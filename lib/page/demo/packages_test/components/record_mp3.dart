import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordMp3Widget extends StatefulWidget {
  @override
  _RecordMp3WidgetState createState() => _RecordMp3WidgetState();
}

class _RecordMp3WidgetState extends State<RecordMp3Widget> {

  String statusText = "就绪"; // 录制状态
  AudioPlayerState audioState; //播放状态
  String statusText2 = '就绪';// 播放状态
  double progress = 0.0;// 播放进度
  String recordFilePath;// 音频路径
  bool isComplete = false;// 是否录制结束
  AudioPlayer audioPlayer;// 音频播放器
  Duration currentDuration = Duration(seconds: 0);// 当前时长
  Duration audioDuration = Duration(seconds: 0);// 音频总时长
  int goBackSecond = 10; // 默认后退秒数
  int forwardSecond = 10;// 默认前进秒数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('音频录制播放'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '录制状态：$statusText',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    startRecord();
                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.green.shade300,
                      child: Text(
                        "开始录制",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    pauseRecord();
                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.amber.shade300,
                      child: Text(
                        "${RecordMp3.instance.status == RecordStatus.PAUSE ? '继续录制' : '暂停录制'}",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    stopRecord();
                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      child: Text(
                        "结束录制",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                  ),
                ),
              ),
            ],
          ),
          Container(
            constraints: BoxConstraints(minHeight: 100),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            alignment: AlignmentDirectional.center,
            child: Text(
              "本地存放路径：$recordFilePath",
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '播放状态：$statusText2',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 1.sw,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('音频播放进度：${currentDuration.toString().split('.').first} / ${audioDuration.toString().split('.').first}',style: TextStyle(fontSize: 16),),
                ),
                Stack(
                  children: [
                    Container(
                      width: 1.sw,
                      height: 5,
                      color: Colors.amber,
                    ),
                    Container(
                      width: progress * 1.sw,
                      height: 5,
                      color: Colors.red,
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    audioSeek(1);
                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      child: Text(
                        "回退$goBackSecond秒",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    audioPlay();
                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.green.shade300,
                      child: Text(
                        "${audioState == AudioPlayerState.PLAYING ? '暂停' : '播放'}",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    audioStop();
                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        "结束",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    audioSeek(2);
                  },
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      child: Text(
                        "前进$forwardSecond秒",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                  ),
                ),
              ),
            ],
          ),
        ]),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    initListenerAudioPlay();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer?.dispose();
  }

  //  开始录制音频
  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }
  // 暂停录制音频
  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }
  // 手动结束录制
  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      setState(() {});
    }
  }

  void initListenerAudioPlay() {
    audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    // 播放音频 监听
    audioPlayer.onDurationChanged.listen((Duration d) {
      print('音频时长========$d');
      setState(() {
        audioDuration = d;
      });
    });
    //当前的播放时长
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        currentDuration = p;
        progress = (p.inSeconds) / (audioDuration.inSeconds);
      });
      // print('当前进度========='+ p.inSeconds.toString() +'秒============' + progress.toString() + '%');
    });
    //播放状态
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      print('播放状态改变========${s.toString()}');
      setState(() {
        audioState = s;
      });
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        isComplete = true;
        statusText2 = '播放完成';
      });
    });
  }

  // 播放音频
  void audioPlay() async{
    print('audioState========+${audioState.toString()}');
    if (recordFilePath != null && File(recordFilePath).existsSync()) {
      if (audioState == null || audioState == AudioPlayerState.COMPLETED || audioState == AudioPlayerState.STOPPED) {
        audioPlayer.release().then((val) {
          audioPlayer.play(recordFilePath, isLocal: true);
          statusText2 = '播放中...';
        });
      } else {// 暂停播放 恢复播放　
        if (audioState == AudioPlayerState.PLAYING) {
          int result = await audioPlayer.pause();// 暂停播放
          setState(() {
            statusText2 = '暂停中...';
          });
        } else {
          int result = await audioPlayer.resume();// 恢复播放
          setState(() {
            statusText2 = '播放中...';
          });
        }
      }
    } else {
      SmartDialog.showToast('未找到音频文件',alignment: Alignment.topCenter);
    }
  }

  // 前进或后退
  void audioSeek(int type) async {
    if (type == 1) { // 后退
      int changedVal = (currentDuration.inMilliseconds - goBackSecond * 1000).toInt(); // 后退后的时间 毫秒
      if(changedVal > 0){
        double changePro = changedVal / (audioDuration.inMilliseconds);// 回退后 占总时长的比例
        audioPlayer.seek(Duration(microseconds: (changePro * audioDuration.inMicroseconds).toInt()));
      } else {
        SmartDialog.showToast('时长超过最小值');
      }
    } else { // 前进
      int changedVal = (currentDuration.inMilliseconds + goBackSecond * 1000).toInt(); // 前进后的时间 毫秒
      if(changedVal < audioDuration.inMilliseconds.toInt()){
        double changePro = changedVal / (audioDuration.inMilliseconds);// 前进后 占总时长的比例
        audioPlayer.seek(Duration(microseconds: (changePro * audioDuration.inMicroseconds).toInt()));
      } else {
        SmartDialog.showToast('时长超过最大值');
      }
    }
  }

  // 结束播放
  void audioStop () async {
    audioPlayer.stop();
    setState(() {
      statusText2 = '结束播放';
    });
  }

  //  获取录制权限
  Future<bool> checkPermission() async {
    Map<Permission, PermissionStatus> map = await [
      Permission.microphone,
      Permission.storage,
    ].request();
    print(map[Permission.microphone]);
    return map[Permission.microphone] == PermissionStatus.granted;

    // if (!await Permission.microphone.isGranted) {
    //   PermissionStatus status = await Permission.microphone.request();
    //   if (status != PermissionStatus.granted) {
    //     return false;
    //   }
    // }
    // return true;
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
  }
}