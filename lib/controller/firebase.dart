import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intakeproject/models/Audio.dart';

class FirebaseController {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection("users");

  // for creating new storage instance
  final Reference _storage = FirebaseStorage.instance.ref('/');

  Future createNewUser({@required userid}) async {
    return _ref.doc(userid).set({});
  }

  void uploadFilleToFirebase(
      {@required userid, File audioFile, String fileName}) async {
    Reference response = _storage.child(fileName);
    UploadTask upload = response.putFile(audioFile);
    upload.then(
      (TaskSnapshot snapshot) {
        snapshot.ref.getDownloadURL().then(
          (audioUrl) {
            _ref.doc(userid).collection("audio").add(
              {
                "audio": audioUrl,
              },
            );
          },
        );
      },
    );
  }

  Stream<List<Audio>> getUserAudioFile({@required String userid}) {
    return _ref.doc(userid).collection("audio").snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (docs) => Audio.fromMap(
                  docs.data(),
                ),
              )
              .toList(),
        );
  }
}

final FirebaseController firebaseHalperController = FirebaseController();
