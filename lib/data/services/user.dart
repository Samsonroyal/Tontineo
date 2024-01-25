import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tontineo_mobile_app/data/model/AdminModel.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUserToCollection(
    String userId,
    String name,
    String email,
    String phone,
    String selectedUserType,
  ) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        'uid': userId,
        'phone': phone,
        'selectedUserType': selectedUserType
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
          selectedUserType: data['selectedUserType'],
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

  // Future<Map<String, dynamic>?> getUserById(String userId) async {
  //   try {
  //     DocumentSnapshot userSnapshot =
  //         await _firestore.collection('users').doc(userId).get();
  //     if (userSnapshot.exists) {
  //       return userSnapshot.data() as Map<String, dynamic>;
  //     } else {
  //       print('User not found');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return null;
  // }

  Future<AdminModel?> getUserById(String userId) async {
    try {
      // Reference to the 'users' collection
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Get the document snapshot corresponding to the provided user ID
      DocumentSnapshot documentSnapshot = await users.doc(userId).get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Extract data from the document snapshot
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        // Create an AdminModel object from the data
        AdminModel user = AdminModel(
          name: data['name'],
          email: data['email'],
          uid: data['uid'],
          phone: data['phone'],
          selectedUserType: data['selectedUserType'],
        );

        return user;
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error getting user by ID: $e');
    }
    return null; // Return null if an error occurs or if document doesn't exist
  }
}
