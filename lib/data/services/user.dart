import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tontineo_mobile_app/data/model/AdminModel.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserToCollection(
    String userId,
    String name,
    String email,
    String phone,
  ) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        'uid': userId,
        'phone': phone,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<AdminModel?> getUserFromCollection(String userId) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(userId).get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return AdminModel(
          name: data['name'],
          email: data['email'],
          uid: data['uid'],
          phone: data['phone'],
        );
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Future<AdminModel?> getUserByUid(String uid) async {
  //   try {
  //     QuerySnapshot querySnapshot = await _firestore
  //         .collection('users')
  //         .where('uid', isEqualTo: uid)
  //         .get();
  //     if (querySnapshot.docs.isNotEmpty) {
  //       var data = querySnapshot.docs.first.data();
  //       if (data != null) {
  //         return AdminModel(
  //           name: data['name'] ?? '',
  //           email: data['email'] ?? '',
  //           uid: data['uid'] ?? '',
  //           phone: data['phone'] ?? '',
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return null;
  // }
}
