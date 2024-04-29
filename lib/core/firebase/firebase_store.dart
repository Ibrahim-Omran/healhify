import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../feature/auth/data/models/user_model.dart';

class FireStoreController {
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  Future<void> addUserData({
    required String idUser,
    required String name,
    required String email,
    required String password,
  }) async {
    await _firebaseFireStore.collection('users').doc(idUser).set(
          UserModel(
            idUser: idUser,
            name: name,
            email: email,
            password: password,
          ).toMap(),
        );
  }

  Future<UserModel?> getCurrentPatient() async {
    UserModel? currentUser;

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('isUser',
              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> data =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        currentUser = UserModel.fromMap(data);
      } else {
        debugPrint('Patient not found');
      }
    } catch (e) {
      debugPrint('Error getting current Patient: $e');
    }

    return currentUser;
  }
}
