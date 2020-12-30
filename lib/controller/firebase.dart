import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intakeproject/constant/app_constant.dart';

class FirebaseController {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection("users");

  // for creating new storage instance
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: FirebaseInfo.storageBucketUrl);

  Future createNewUser({@required userid}) async {
    return _ref.doc(userid).set({});
  }

  // create methods to upload mp3 file on firestore using (audio lib)
  uploadFilleToFirebase({@required userid}) async {
    // return await _storage.ref('/').putFile().then((e) {
    //   _ref.doc(userid).set({});
    // });
  }
  // fetch user documents

  getUserAudioFile({@required userid}) async {
    // return  _ref.doc(userid).snapshots();
  }
}
