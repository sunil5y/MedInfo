import 'package:cloud_firestore/cloud_firestore.dart';

// Service class for interacting with Firebase to retrieve medicine details
class FirebaseService {
  // Collection reference for the 'Medicine' collection in Firestore
  final CollectionReference medicineDetailsCollection =
  FirebaseFirestore.instance.collection('Medicine');

  // Method to retrieve detailed information about a specific medicine
  Future<Map<String, dynamic>?> getMedicineDetailText(String medicineId) async {
    try {
      // Get a document snapshot for the specified medicineId
      DocumentSnapshot snapshot =
      await medicineDetailsCollection.doc(medicineId).get();

      // Check if the document exists
      if (snapshot.exists) {
        // Return a map containing various details of the medicine
        return {
          'Title': snapshot['Title'],
          'Detail': snapshot['Detail'],
          'Usages': snapshot['Usages'],
          'Dosages': snapshot['Dosages'],
          'Side Effects': snapshot['Side Effects'],
          'Price': snapshot['Price'],
        };
      } else {
        // Return null if the document is not found
        return null;
      }
    } catch (e) {
      // Handle any errors that may occur during the process
      print('Error getting medicine detail: $e');
      return null;
    }
  }
}
