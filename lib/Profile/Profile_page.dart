import 'package:flutter/material.dart';

import '../Logins/Login.dart';
import 'Downloads.dart';
import 'Favourites.dart';
import 'Order_history.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Placeholder values for user information
  String profileImage = 'assets/images/google.png';
  String userName = 'Rajesh Dai';
  String userEmail = 'Rajesh.dai@gmail.com';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        body: Container(
          height: screenHeight, // Set the height of the Container
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/b.jpg'), // Set your image asset path
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle('Profile Details'),
              SizedBox(height: 10),

              // Profile
              GestureDetector(
                onTap: () {
                  // Handle the tap on the profile section
                  // You can show the edit dialog or navigate to an edit page
                  showEditDialog();
                },
                child: buildProfileContainer(
                  profileImage: profileImage,
                  userName: userName,
                  userEmail: userEmail,
                ),
              ),

              SizedBox(height: 40),
              buildClickableContainer(Icons.my_library_books, 'Order History', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Order_History()),
                );
              }),
              SizedBox(height: 20),
              buildClickableContainer(Icons.download_sharp, 'Downloads', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Downloads()),
                );
              }),
              SizedBox(height: 20),
              buildClickableContainer(Icons.favorite_border, 'Favourites', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favourites()),
                );
              }),
              SizedBox(height: 20),
              buildClickableContainer(Icons.logout, 'Log Out', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildProfileContainer({
    required String profileImage,
    required String userName,
    required String userEmail,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(25.0),

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(profileImage),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                userEmail,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildClickableContainer(IconData icon, String text, VoidCallback onTap) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.lightBlue,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(25.0),
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
            child: Row(
              children: [
                buildIconContainer(icon),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconContainer(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        height: 50,
        width: 50,
        child: Icon(
          icon,
          color: Colors.red,
        ),
      ),
    );
  }

  void showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditProfileDialog();
      },
    );
  }
}

class EditProfileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 1, vertical: 20), // Set the horizontal padding to control the width
      //title: Container(
      //  width: 1000,
      // ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/google.png'),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.photo_camera),
                  ),
                  bottom: -10,
                  left: 65,
                )
              ],
            ),
            SizedBox(height: 20),
            buildEditField('Full Name', Icons.person, Colors.blue),
            buildEditField('Email', Icons.email, Colors.orange),
            buildEditField('Phone no', Icons.phone, Colors.green),
            buildEditField('DoB', Icons.calendar_today, Colors.red),
            buildEditField('Password', Icons.lock_open_outlined, Colors.purple),
          ],
        ),
      ),
      actions: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Implement the submit action
                  // Update the user information and close the dialog
                  Navigator.of(context).pop();
                },
                child: Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Close the dialog without saving changes
                  Navigator.of(context).pop();
                },
                child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildEditField(String label, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100, // Adjust the width as needed
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: color, // Adjust the size of the icon as needed
                ),
                SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Container(
              height: 30, // Set the height as needed
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                  ),
                ),
                // Add your text editing controller or other properties here
              ),
            ),
          ),
        ],
      ),
    );
  }
}
