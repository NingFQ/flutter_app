import 'dart:io';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordMp3AudioPlay extends StatefulWidget {
  @override
  _RecordMp3AudioPlayState createState() => _RecordMp3AudioPlayState();
}

class _RecordMp3AudioPlayState extends State<RecordMp3AudioPlay> {

  int recordDuration = 0;// 当前录制时长 秒
  Timer recordTimer; // 定时器实例
  String recordFilePath = '';// 录制路径
  Duration audioCurrentDuration = Duration(seconds: 0);// 当前播放时长
  Duration audioPlayDuration = Duration(seconds: 0);// 音频总时长
  AudioPlayer audioPlayer;// 音频播放器
  AudioPlayerState audioStatus = AudioPlayerState.STOPPED;
  get _recordStatus => RecordMp3.instance.status; // 录制音频的状态

  get _recodeReady => _recordStatus == RecordStatus.IDEL;// 录制准备就绪
  get _recordIng => _recordStatus == RecordStatus.RECORDING;// 正在录制中
  get _recordPause => _recordStatus == RecordStatus.PAUSE;// 正在暂停中


  get _audioPlaying => audioStatus == AudioPlayerState.PLAYING;// 播放中
  get _audioPause => audioStatus == AudioPlayerState.PAUSED;// 暂停中
  get _audioStopped => audioStatus == AudioPlayerState.STOPPED;// 已终止
  get _audioCompleted => audioStatus == AudioPlayerState.COMPLETED;// 已播完

  StreamSubscription _durationSubscription;
  StreamSubscription _stateSubscription;
  StreamSubscription  _positionSubscription;

  @override
  void initState() {
    super.initState();
    getFilePath();
    initListenerAudioPlay();
  }

  @override
  void dispose() {
    RecordMp3.instance.stop();
    _durationSubscription?.cancel();
    _stateSubscription?.cancel();
    _positionSubscription?.cancel();
    audioPlayer?.dispose();
    recordTimer?.cancel();
    File(recordFilePath).delete();// 删除文件
    print('销毁=======销毁');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('音频录制播放record_mp3'),
      ),
      body: Container(
        child: Column(
          children: [
            // 展示时长进度区
            Container(
              width: 1.sw,
              height: 100,
              alignment: Alignment.center,
              child: Text(
                // _recordPause ? '$audioCurrentDuration/$audioPlayDuration' : '${Duration(seconds: recordDuration)}',
                '$audioCurrentDuration / $audioPlayDuration\n$audioCurrentDuration / ${Duration(milliseconds: recordDuration)}',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            // 状态显示区
            Container(
              width: 1.sw,
              height: 300,
              color: Colors.greenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('录制状态${_recordStatus.toString()}',style: TextStyle(fontSize: 20),),
                  Text('播放状态${audioStatus.toString()}',style: TextStyle(fontSize: 20),),
                  // Text('文件路径=====$recordFilePath',style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            // 操作面板区
            Expanded(
              child: Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: _recodeReady,
                      child: RaisedButton(
                        onPressed: !_recodeReady ? null : () => startRecord(),
                        color: Colors.red,
                        child: Text('开始录音',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Visibility(
                      visible: _recordIng,
                      child: RaisedButton(
                        onPressed: () => pauseRecord(),
                        color: Colors.red,
                        child: Text('暂停录音',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Visibility(
                      visible: _recordPause,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RaisedButton(
                                onPressed: () => audioSeek(1),
                                color: Colors.red.shade500,
                                child: Text('回退15s',style: TextStyle(color: Colors.white),),
                              ),
                              RaisedButton(
                                onPressed: recordFilePath.isEmpty ? null : () => playPauseAudio(),
                                color: Colors.black,
                                child: Text('${_audioPlaying ? '暂停' : '播放'}',style: TextStyle(color: Colors.white),),
                              ),
                              RaisedButton(
                                onPressed: () => audioSeek(2),
                                color: Colors.red.shade500,
                                child: Text('前进15s',style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RaisedButton(
                                onPressed:  _audioPlaying ? null : () => againRecord(),
                                color: Colors.black,
                                child: Text('重录',style: TextStyle(color: Colors.white),),
                              ),
                              RaisedButton(
                                onPressed: _audioPlaying ? null : () => resumeRecord(),
                                color: Colors.red.shade500,
                                child: Text('继续录制',style: TextStyle(color: Colors.white),),
                              ),
                              RaisedButton(
                                onPressed: _audioPlaying ? null : () => recordComplete(),
                                color: Colors.green.shade500,
                                child: Text('完成',style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  // 开启定时器
  void startCountdownTimer() {
    recordTimer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        recordDuration += 10;
      });
    });
  }

  //  开始录制
  void startRecord() async{
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      startCountdownTimer();// 开始计时器
      RecordMp3.instance.start(recordFilePath, (type) {
        print("Record error-------->$type");
        recordTimer?.cancel();
        recordTimer = null;
        recordDuration = 0;
        setState(() {});
      });
    }
    setState(() {});
  }

  // 暂停录制
  void pauseRecord() async{
    bool s = RecordMp3.instance.pause();
    if (s) {
      setState(() {
        recordTimer?.cancel();
        recordTimer = null;
      });
    }
  }

  // 恢复录制
  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      setState(() {
        startCountdownTimer();
        reloadAudioPlayer();
      });
    }
  }

  // 重新录制
  void againRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      setState(() {
        File(recordFilePath).delete();// 删除文件
        recordDuration = 0;// 录制时长清零
        reloadAudioPlayer();
      });
    }
  }
  //  重新加载播放器
  void reloadAudioPlayer() {
    audioCurrentDuration = Duration(seconds: 0);// 当前播放时长清零
    audioPlayDuration = Duration(seconds: 0);// 音频总时长清零
    audioPlayer?.dispose();
    audioPlayer = null;
    audioStatus = AudioPlayerState.STOPPED;
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _stateSubscription?.cancel();
    initListenerAudioPlay();
  }

  // 完成
  recordComplete() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      setState(() {});
    }
    Navigator.pop(context);
  }

  // 音频播放监听
  void initListenerAudioPlay() {
    if (audioPlayer == null) audioPlayer =  AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    _durationSubscription = audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {audioPlayDuration = d;});
    });
    _positionSubscription = audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {audioCurrentDuration = p;});
    });
    _stateSubscription = audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioStatus = s;
        if (s == AudioPlayerState.COMPLETED) { // 正常播放结束后重新生成一个定时器
          audioPlayer?.dispose();
          audioPlayer = null;
          _durationSubscription?.cancel();
          _positionSubscription?.cancel();
          _stateSubscription?.cancel();
        }
      });
    });
  }

  // 播放音频
  void playPauseAudio () async{
    if (audioPlayer == null) initListenerAudioPlay();
    if (_audioCompleted || _audioStopped) {
      audioPlayer.release().then((val) {
        audioPlayer.play(recordFilePath, isLocal: true);
      });
    } else if (_audioPlaying){// 暂停播放
      audioPlayer.pause();
    } else if (_audioPause){// 恢复播放
      audioPlayer.resume();
    }
    setState(() {});
  }

  // 前进或后退
  void audioSeek(int type) async {
    if (type == 1) { // 后退
      int changedVal = (audioCurrentDuration.inMilliseconds - 15 * 1000).toInt(); // 后退后的时间 毫秒
      if(changedVal > 0){
        double changePro = changedVal / (audioPlayDuration.inMilliseconds);// 回退后 占总时长的比例
        audioPlayer.seek(Duration(microseconds: (changePro * audioPlayDuration.inMicroseconds).toInt()));
      } else {
        SmartDialog.showToast('时长超过最小值');
      }
    } else { // 前进
      int changedVal = (audioCurrentDuration.inMilliseconds + 15 * 1000).toInt(); // 前进后的时间 毫秒
      if(changedVal < audioPlayDuration.inMilliseconds.toInt()){
        double changePro = changedVal / (audioPlayDuration.inMilliseconds);// 前进后 占总时长的比例
        audioPlayer.seek(Duration(microseconds: (changePro * audioPlayDuration.inMicroseconds).toInt()));
      } else {
        SmartDialog.showToast('时长超过最大值');
      }
    }
  }

  //  获取录制权限
  Future<bool> checkPermission() async {
    Map<Permission, PermissionStatus> map = await [
      Permission.microphone,
      Permission.storage,
    ].request();
    print(map[Permission.microphone]);
    return map[Permission.microphone] == PermissionStatus.granted;
  }

  //  生成文件路径
  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    setState(() {
      recordFilePath = sdPath + "/test.mp3";
    });
  }
}
