import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageApi {
  FirebaseStorageApi();

  static Future<String> putFileOnStorage(
      String bucket, String docName, File file) async {
    final storageRef =
        FirebaseStorage.instance.ref().child(bucket).child(docName);

    await storageRef.putFile(file);

    final fileUrl = await storageRef.getDownloadURL();

    return fileUrl;
  }
}
