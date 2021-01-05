import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakeproject/controller/audio_controller.dart';
import 'package:intakeproject/controller/auth_controller.dart';
import 'package:intakeproject/models/Audio.dart';

class VoicePlayer extends StatelessWidget {
  final Audio audio;

  const VoicePlayer(this.audio);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play Audio"),
      ),
      body: Center(
          child: GetBuilder<AudioController>(
        init: AudioController(),
        builder: (state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                maxRadius: 100,
                child: Text(
                  "V",
                  style: TextStyle(fontSize: 150),
                ),
              ),
              Column(
                children: [
                  IconButton(
                      iconSize: 50,
                      color: Get.theme.primaryColor,
                      icon: state.isPlaying
                          ? Icon(Icons.pause_circle_filled_rounded)
                          : Icon(Icons.play_circle_fill_rounded),
                      onPressed: () => state.isPlaying
                          ? state.stopAudioPlayer()
                          : state.startAudioPlayer(audioPath: audio.audio)),
                ],
              ),
            ],
          );
        },
      )),
    );
  }
}
