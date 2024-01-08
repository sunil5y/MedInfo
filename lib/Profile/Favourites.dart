import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  final CollectionReference favoritesCollection =
  FirebaseFirestore.instance.collection('Favorites');

  @override
  Widget build(BuildContext context) {
    // Get the current user's email
    final String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;

    if (currentUserEmail == null) {
      // If the user is not logged in, you may want to handle this case accordingly
      return Scaffold(
        body: Center(
          child: Text('User not logged in.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Favourites',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/b.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          // Modify the query to filter by the user's email
          stream: favoritesCollection
              .where('userEmail', isEqualTo: currentUserEmail)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            // Display the favorite medicines
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5, top: 1),
                  child: Container(
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightGreen,
                          Colors.lightBlue,
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        stops: [0.0, 0.9],
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        data['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        data['category'],
                        style: TextStyle(color: Colors.white),
                      ),
                      // Add other properties as needed
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
