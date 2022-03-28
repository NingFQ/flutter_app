// import 'dart:async';
// import 'package:flutter/rendering.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'dart:io' as io;
//
//
// class RecorderAudioPlay extends StatefulWidget {
//   @override
//   _RecorderAudioPlayState createState() => _RecorderAudioPlayState();
// }
//
// class _RecorderAudioPlayState extends State<RecorderAudioPlay> {
//   FlutterAudioRecorder _recorder;// 录制实例
//   AudioPlayer audioPlayer;// 音频播放器
//   String customPath;
//   Timer recordTimer;// 录制定时器
//   Recording currentRecordInfo;// 当前录制的信息
//   Duration audioCurrentDuration = Duration(seconds: 0);// 当前播放时长
//   Duration audioPlayDuration = Duration(seconds: 0);// 音频总时长
//
//   AudioPlayerState audioStatus = AudioPlayerState.STOPPED;// 播放状态
//   get currentRecordStatus => currentRecordInfo?.status;// 录制状态
//   get _audioPlaying => audioStatus == AudioPlayerState.PLAYING;// 播放中
//   get _audioPause => audioStatus == AudioPlayerState.PAUSED;// 暂停中
//   get _audioStopped => audioStatus == AudioPlayerState.STOPPED;// 已终止
//   get _audioCompleted => audioStatus == AudioPlayerState.COMPLETED;// 已播完
//   // 视频播放流监听
//   StreamSubscription _durationSubscription;
//   StreamSubscription _stateSubscription;
//   StreamSubscription  _positionSubscription;
//
//   @override
//   void initState() {
//     super.initState();
//     _initRecorder();
//     initListenerAudioPlay();
//   }
//
//   @override
//   void dispose() {
//     _durationSubscription?.cancel();
//     _stateSubscription?.cancel();
//     _positionSubscription?.cancel();
//     audioPlayer?.dispose();
//     audioPlayer = null;
//     recordTimer?.cancel();
//     recordTimer = null;
//     print('销毁=======销毁');
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('音频录制播放Recorder'),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             // 展示时长进度区
//             Container(
//               width: 1.sw,
//               height: 100,
//               alignment: Alignment.center,
//               child: Text(
//                 // _recordPause ? '$audioCurrentDuration/$audioPlayDuration' : '${Duration(seconds: recordDuration)}',
//                 '$audioCurrentDuration / $audioPlayDuration\n$audioCurrentDuration / ${currentRecordInfo?.duration}',
//                 style: TextStyle(
//                     fontSize: 20
//                 ),
//               ),
//             ),
//             // 状态显示区
//             Container(
//               width: 1.sw,
//               // height: 200,
//               padding: EdgeInsets.all(15),
//               color: Colors.greenAccent.shade100,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('说明：此插件不能在未停止录音的情况下播放音频',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red)),
//                   Text('录制状态===${currentRecordStatus.toString()}'),
//                   Text('播放状态===${audioStatus.toString()}'),
//                   Text('文件路径===${currentRecordInfo?.path}',),
//                 ],
//               ),
//             ),
//             // 操作面板区
//             Expanded(
//                 child: Container(
//                   width: 1.sw,
//                   padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Visibility(
//                         visible: currentRecordStatus == RecordingStatus.Initialized,
//                         child: ElevatedButton(
//                           onPressed: () => startRecord(),
//                           color: Colors.red,
//                           child: Text('开始录音',style: TextStyle(color: Colors.white),),
//                         ),
//                       ),
//                       Visibility(
//                         visible: currentRecordStatus == RecordingStatus.Recording,
//                         child: ElevatedButton(
//                           onPressed: () => pauseRecord(),
//                           color: Colors.red,
//                           child: Text('暂停录音',style: TextStyle(color: Colors.white),),
//                         ),
//                       ),
//                       Visibility(
//                         visible: currentRecordStatus == RecordingStatus.Paused || currentRecordStatus == RecordingStatus.Stopped,
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: currentRecordStatus != RecordingStatus.Stopped ? null : () => audioSeek(1),
//                                   color: Colors.red.shade500,
//                                   child: Text('回退15s',style: TextStyle(color: Colors.white),),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: currentRecordStatus != RecordingStatus.Stopped ? null : () => playPauseAudio(),
//                                   color: Colors.black,
//                                   child: Text('${_audioPlaying ? '暂停' : '播放'}',style: TextStyle(color: Colors.white),),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: currentRecordStatus != RecordingStatus.Stopped ? null : () => audioSeek(2),
//                                   color: Colors.red.shade500,
//                                   child: Text('前进15s',style: TextStyle(color: Colors.white),),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed:  _audioPlaying ? null : () => againRecord(),
//                                   color: Colors.black,
//                                   child: Text('重录',style: TextStyle(color: Colors.white),),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: _audioPlaying || currentRecordStatus == RecordingStatus.Stopped ? null : () => resumeRecord(),
//                                   color: Colors.red.shade500,
//                                   child: Text('继续录制',style: TextStyle(color: Colors.white),),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: _audioPlaying ? null : () => recordComplete(),
//                                   color: Colors.green.shade500,
//                                   child: Text('完成',style: TextStyle(color: Colors.white),),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   _initRecorder() async{
//     String customPath = '/flutter_audio_recorder_';
//     io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
//     if (io.Platform.isIOS) {
//       appDocDirectory = await getApplicationDocumentsDirectory();
//     } else {
//       appDocDirectory = await getExternalStorageDirectory();
//     }
//     customPath = appDocDirectory.path + customPath + DateTime.now().millisecondsSinceEpoch.toString();
//     _recorder = FlutterAudioRecorder(customPath, audioFormat: AudioFormat.WAV);
//     if (await FlutterAudioRecorder.hasPermissions) {
//       await _recorder.initialized;
//       var current = await _recorder.current(channel: 0);
//       setState(() {
//         currentRecordInfo = current;
//       });
//     } else {
//       Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("You must accept permissions")));
//     }
//   }
//
//   //  开始录制
//   void startRecord() async {
//     bool hasPermission = await checkPermission();
//     if (hasPermission) {
//       await _recorder.start();// 开始
//       currentRecordInfo = await _recorder.current(channel: 0);
//       startCountdownTimer();
//       setState(() {});
//     }
//     setState(() {});
//   }
//
//   // 开启定时器
//   void startCountdownTimer() {
//     const tick = const Duration(milliseconds: 50);
//     recordTimer = Timer.periodic(tick, (Timer recordTimer) async {
//       if (currentRecordStatus == RecordingStatus.Stopped) {
//         recordTimer.cancel();
//       }
//       var _current = await _recorder.current(channel: 0);
//       setState(() {
//         currentRecordInfo = _current;
//       });
//     });
//   }
//
//   // 暂停录制
//   void pauseRecord() async{
//     await _recorder.pause();
//     setState(() {
//       currentRecordInfo.status = RecordingStatus.Paused;
//       recordTimer?.cancel();
//       recordTimer = null;
//     });
//   }
//
//   // 恢复录制
//   void resumeRecord() async{
//     await _recorder.resume();
//     setState(() {
//       currentRecordInfo.status = RecordingStatus.Recording;
//       startCountdownTimer();
//     });
//   }
//
//   // 重新录制
//   void againRecord() async{
//     var result = await _recorder.stop();
//     setState(() {
//       currentRecordInfo.duration = Duration(seconds: 0);
//       currentRecordInfo.status = RecordingStatus.Initialized;
//       recordTimer?.cancel();
//       recordTimer = null;
//       _initRecorder();// 重新初始化
//       reloadAudioPlayer();
//     });
//   }
//
//   // 完成录制
//   recordComplete() async{
//     var result = await _recorder.stop();
//     setState(() {
//       // currentRecordInfo.duration = Duration(seconds: 0);
//       // currentRecordInfo.status = RecordingStatus.Initialized;
//       recordTimer?.cancel();
//       recordTimer = null;
//       reloadAudioPlayer();
//       // _initRecorder();// 重新初始化录制器
//     });
//     // Navigator.pop(context);
//   }
//
//   //  重新加载播放器
//   void reloadAudioPlayer() {
//     audioCurrentDuration = Duration(seconds: 0);// 当前播放时长清零
//     audioPlayDuration = Duration(seconds: 0);// 音频总时长清零
//     audioPlayer?.dispose();
//     audioPlayer = null;
//     audioStatus = AudioPlayerState.STOPPED;
//     _durationSubscription?.cancel();
//     _positionSubscription?.cancel();
//     _stateSubscription?.cancel();
//     initListenerAudioPlay();
//   }
//
//   // 音频播放监听
//   void initListenerAudioPlay() {
//     if (audioPlayer == null) {
//       audioPlayer = new AudioPlayer();
//     }
//     _durationSubscription = audioPlayer.onDurationChanged.listen((Duration d) {
//       setState(() {audioPlayDuration = d;});
//     });
//     _positionSubscription = audioPlayer.onAudioPositionChanged.listen((Duration p) {
//       setState(() {audioCurrentDuration = p;});
//     });
//     _stateSubscription = audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
//       print('状态实时搜索=========${s.toString()}');
//       setState(() {
//         audioStatus = s;
//         if (s == AudioPlayerState.COMPLETED) { // 正常播放结束后重新生成一个定时器
//           audioPlayer?.dispose();
//           audioPlayer = null;
//           _durationSubscription?.cancel();
//           _positionSubscription?.cancel();
//           _stateSubscription?.cancel();
//         }
//       });
//     });
//   }
//
//   // 播放音频
//   void playPauseAudio () async{
//     if (audioPlayer == null) initListenerAudioPlay();
//     if (_audioCompleted || _audioStopped) {
//       audioPlayer.release().then((val) {
//         audioPlayer.play(currentRecordInfo?.path, isLocal: true);
//       });
//     } else if (_audioPlaying){// 暂停播放
//       audioPlayer.pause();
//     } else if (_audioPause){// 恢复播放
//       audioPlayer.resume();
//     }
//     setState(() {});
//   }
//
//   // 前进或后退
//   void audioSeek(int type) async {
//     if (type == 1) { // 后退
//       int changedVal = (audioCurrentDuration.inMilliseconds - 15 * 1000).toInt(); // 后退后的时间 毫秒
//       if(changedVal > 0){
//         double changePro = changedVal / (audioPlayDuration.inMilliseconds);// 回退后 占总时长的比例
//         audioPlayer.seek(Duration(microseconds: (changePro * audioPlayDuration.inMicroseconds).toInt()));
//       } else {
//         SmartDialog.showToast('时长超过最小值');
//       }
//     } else { // 前进
//       int changedVal = (audioCurrentDuration.inMilliseconds + 15 * 1000).toInt(); // 前进后的时间 毫秒
//       if(changedVal < audioPlayDuration.inMilliseconds.toInt()){
//         double changePro = changedVal / (audioPlayDuration.inMilliseconds);// 前进后 占总时长的比例
//         audioPlayer.seek(Duration(microseconds: (changePro * audioPlayDuration.inMicroseconds).toInt()));
//       } else {
//         SmartDialog.showToast('时长超过最大值');
//       }
//     }
//   }
//
//   //  获取录制权限
//   Future<bool> checkPermission() async {
//     Map<Permission, PermissionStatus> map = await [
//       Permission.microphone,
//       Permission.storage,
//     ].request();
//     print(map[Permission.microphone]);
//     return map[Permission.microphone] == PermissionStatus.granted;
//   }
// }
