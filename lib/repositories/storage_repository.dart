import 'dart:io';

import 'package:dating_app/repositories/database_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadImage(XFile image) async {
    try {
      await storage
          .ref('user_1/${image.name}')
          .putFile(File(image.path))
          .then((_) => DataBaseRepository().updateUserPictures(image.name));
    } catch (_) {}
  }

  Future<String> getDownloadUrl(String imageName) async {
    String downloadUrl =
        await storage.ref('user_1/$imageName').getDownloadURL();
    return downloadUrl;
  }
}
