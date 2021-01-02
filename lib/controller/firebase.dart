import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseController {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection("users");

  // for creating new storage instance
  final Reference _storage = FirebaseStorage.instance.ref('/');

  Future createNewUser({@required userid}) async {
    return _ref.doc(userid).set({});
  }

  // TODO: add audio in new field
  uploadFilleToFirebase(
      {@required userid, File audioFile, String fileName}) async {
    Reference response = _storage.child(fileName);
    UploadTask upload = response.putFile(audioFile);
    upload.then((TaskSnapshot snapshot) {
      snapshot.ref.getDownloadURL().then((audioUrl) {
        _ref.doc(userid).set(
            {
              "audio": audioUrl,
            },
            SetOptions(
              merge: false,
              mergeFields: [
                'audio',
              ],
            ));
      });
    });
  }
  // fetch user documents

  Stream<DocumentSnapshot> getUserAudioFile({@required userid}) {
    return _ref.doc(userid).snapshots();
  }
}

final FirebaseController firebaseHalperController = FirebaseController();
