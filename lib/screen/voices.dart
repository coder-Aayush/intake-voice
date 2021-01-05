import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakeproject/controller/audio_controller.dart';
import 'package:intakeproject/controller/auth_controller.dart';
import 'package:intakeproject/controller/firebase.dart';
import 'package:intakeproject/models/Audio.dart';
import 'package:intakeproject/screen/voice_player.dart';

class Voices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$this"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: StreamBuilder(
          stream: firebaseHalperController.getUserAudioFile(
              userid: authController.getUser().uid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Audio _audio = snapshot.data[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text("My Recoded Audio"),
                  onTap: () => Get.to(VoicePlayer(_audio)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
