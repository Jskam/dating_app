import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/repositories/storage_repository.dart';

import '../models/models.dart';

class DataBaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<User> getUser()  {
    return _firebaseFirestore
        .collection('users')
        .doc('XlkQNTPBPO4aK2Yo6H5L')
        .snapshots()
        .map((snap) => User.fromSnapshot(snap));

  }

  Future<void> updateUserPictures(String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadUrl(imageName);
    log('download url : ' + downloadUrl);
    return _firebaseFirestore
        .collection('users')
        .doc('XlkQNTPBPO4aK2Yo6H5L')
        .update({
          'imageUrls': FieldValue.arrayUnion([downloadUrl])
        })
        .then((_) => log('Updated [updateUserPictures]'))
        .catchError(
            (error) => log('[updateUserPictures] Update failed: $error'));
  }
}
