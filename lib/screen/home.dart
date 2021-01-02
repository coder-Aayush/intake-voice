import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:intakeproject/controller/audio_controller.dart';
import 'package:intakeproject/controller/auth_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(authController.getUser().photoUrl),
          ),
        ),
        title: Text(authController.getUser().displayName),
      ),
      body: ListView(
        children: [
          _recordLayout(),
        ],
      ),
    );
  }

  Widget _recordLayout() {
    final AudioController audioController = Get.put(AudioController());

    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.indigo,
      ),
      child: GetBuilder<AudioController>(
          init: AudioController(),
          builder: (state) {
            print(state.isRecording);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    state.isRecording
                        ? state.stopRecording()
                        : state.startRecording();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Icon(
                      audioController.isRecording
                          ? Icons.stop
                          : Icons.keyboard_voice,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Record and Upload",
                  style: Get.theme.textTheme.headline5.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
