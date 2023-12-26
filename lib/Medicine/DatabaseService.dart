import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference medicineDetailsCollection =
  FirebaseFirestore.instance.collection('Medicine');

  Future<Map<String, dynamic>?> getMedicineDetailText(String medicineId) async {
    try {
      DocumentSnapshot snapshot =
      await medicineDetailsCollection.doc(medicineId).get();

      if (snapshot.exists) {
        return {
          'Title': snapshot['Title'],
          'Detail': snapshot['Detail'],
          'Usages': snapshot['Usages'],
          'Dosages': snapshot['Dosages'],
          'Side Effects': snapshot['Side Effects'],
          'Price': snapshot['Price'],

        };
      } else {
        return null; // Document not found
      }
    } catch (e) {
      print('Error getting medicine detail: $e');
      return null;
    }
  }
}