import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:flutter_sound/public/tau.dart';
import 'package:get/get.dart';
import 'package:intakeproject/controller/auth_controller.dart';
import 'package:intakeproject/controller/firebase.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AudioController extends GetxController {
  final FlutterSoundRecorder _soundRecorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _sound = FlutterSoundPlayer();
  bool isRecording = false;
  String outputPathDir;
  File outputFile;
  String fileName;

  AudioController() {
    _init();
  }

  _init() async {
    await _soundRecorder.openAudioSession(
      category: SessionCategory.record,
    );
    await _sound.openAudioSession();
  }

  startRecording() async {
    var status = await Permission.microphone.request();
    var storage = await Permission.storage.request();
    var tempDir = await getTemporaryDirectory();

    print(outputFile);
    if (status.isGranted && storage.isGranted && _soundRecorder.isStopped) {
      outputPathDir =
          "${tempDir.path}/record${DateTime.now().millisecondsSinceEpoch}.acc";
      _soundRecorder.startRecorder(
        toFile: outputPathDir,
        codec: Codec.aacADTS,
      );
      isRecording = true;
      fileName = 'record${DateTime.now().millisecondsSinceEpoch}.acc';
      outputFile = File(outputPathDir);
      update();
    } else {
      Get.snackbar("Alert", 'Unknown Error');
    }
  }

  stopRecording() async {
    _soundRecorder.stopRecorder();
    print(outputFile);
    await _sound.startPlayer(
      fromURI: outputPathDir,
    );
    firebaseHalperController.uploadFilleToFirebase(
      userid: authController.getUser().uid,
      audioFile: outputFile,
      fileName: fileName,
    );
    print(outputPathDir);
    isRecording = false;
    update();
  }

  void startAudioPlayer({@required audioPath}) async {
    await _sound.startPlayer();
  }

  void stopAudioPlayer()async{
    await _sound.stopPlayer();
  }

}
