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
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool isPlaying = false;
  bool isRecording = false;
  String outputPathDir;
  File _outputFile;
  String _fileName;

  AudioController() {
    _init();
  }

  _init() async {
    await _soundRecorder.openAudioSession(
      category: SessionCategory.record,
    );
    await _player.openAudioSession();
  }

  startRecording() async {
    var status = await Permission.microphone.request();
    var storage = await Permission.storage.request();
    var tempDir = await getTemporaryDirectory();

    if (status.isGranted && storage.isGranted && _soundRecorder.isStopped) {
      outputPathDir =
          "${tempDir.path}/record${DateTime.now().millisecondsSinceEpoch}.wav";
      _soundRecorder.startRecorder(
        toFile: outputPathDir,
        codec: Codec.pcm16WAV,
      );
      isRecording = true;
      _fileName = 'record${DateTime.now().millisecondsSinceEpoch}.wav';
      _outputFile = File(outputPathDir);
      update();
    } else {
      Get.snackbar("Alert", 'Unknown Error');
    }
  }

  stopRecording() async {
    _soundRecorder.stopRecorder();
    await _player.startPlayer(
      fromURI: outputPathDir,
      codec: Codec.opusWebM,
    );
    firebaseHalperController.uploadFilleToFirebase(
      userid: authController.getUser().uid,
      audioFile: _outputFile,
      fileName: _fileName,
    );
    isRecording = false;
    update();
  }

  void startAudioPlayer({@required String audioPath}) async {
    await _player.startPlayer(
      fromURI: audioPath,
      codec: Codec.opusWebM,
    );
    isPlaying = true;
    update();
  }

  void stopAudioPlayer() async {
    await _player.stopPlayer();
    isPlaying = false;
    update();
  }
}
