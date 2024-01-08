import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService_Profile {
  final CollectionReference profileCollection =
  FirebaseFirestore.instance.collection('User');

  Future<Map<String, dynamic>?> getprofileText(String userId) async {
    try {
      DocumentSnapshot snapshot = await profileCollection.doc(userId).get();

      if (snapshot.exists) {
        return {
          'fullname': snapshot['fullname'],
          'phoneno': snapshot['phoneno'],
          'email': snapshot['email'],
          'password': snapshot['password'],
        };
      } else {
        return null; // Document not found
      }
    } catch (e) {
      print('Error getting profile: $e');
      return null;
    }
  }

  Future<void> updateUserData(
      String userId, {
        String? fullName,
        String? phoneNo,
        String? email,
      }) async {
    try {
      // Assuming you have a 'users' collection in Firestore
      final CollectionReference users = FirebaseFirestore.instance.collection('User');
      await users.doc(userId).update({
        'fullname': fullName,
        'phoneno': phoneNo,
        'email': email,
      });
    } catch (e) {
      print('Error updating user data: $e');
    }
  }
}