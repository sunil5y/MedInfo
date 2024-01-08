import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Logins/Login.dart';
import 'Favourites.dart';
import 'Order_history.dart';
import 'ProfileDatabase.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late User currentUser;
  late Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    // Fetch and set user data when the widget is created
    fetchUserData();
  }

  // Function to fetch user data
  Future<void> fetchUserData() async {
    try {
      // Get the current authenticated user
      currentUser = FirebaseAuth.instance.currentUser!;
      // Fetch user data from Firestore
      userData = await FirebaseService_Profile().getprofileText(currentUser.uid) ?? {};
      // Update the UI with the fetched data
      setState(() {});
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

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
            )


          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/b.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: buildSectionTitle('Profile Details'),
                ),
                SizedBox(height: 10),

                // Profile
                GestureDetector(
                  onTap: () async {
                    // Handle the tap on the profile section
                    // You can show the edit dialog or navigate to an edit page
                    await showEditDialog();
                    // Reload user data after editing
                    await fetchUserData();
                  },
                  child: buildProfileContainer(
                    profileImage: 'assets/images/ProfilePic3.png', // You can set a default image here if needed
                    userName: userData['fullname'] ?? 'Full Name',
                    userEmail: userData['email'] ?? 'Email',
                  ),
                ),

                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: buildClickableContainer(Icons.my_library_books, 'Order History', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Order_History()),
                    );
                  }),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: buildClickableContainer(Icons.favorite_border, 'Favourites', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Favourites()),
                    );
                  }),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: buildClickableContainer(Icons.logout, 'Log Out', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),
                ),
                SizedBox(height: 40),
              ],
            ),
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
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(profileImage),
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                userEmail,
                style: TextStyle(
                  fontSize: 15,
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

  Future<void> showEditDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        // Pass user data to EditProfileDialog
        return EditProfileDialog(userData: userData);
      },
    );
  }
}

class EditProfileDialog extends StatelessWidget {
  final Map<String, dynamic> userData;

  // Constructor to receive user data
  EditProfileDialog({required this.userData});

  // Create a TextEditingController for each field
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize the controllers with the existing user data
    fullNameController.text = userData['fullname'];
    phoneNoController.text = userData['phoneno'];
    emailController.text = userData['email'];

    return AlertDialog(
      // Set the horizontal padding to control the width
      content: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/ProfilePic3.png'),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {
                      openCamera();
                    },
                    icon: Icon(Icons.photo_camera),
                  ),
                  bottom: -10,
                  left: 65,
                )
              ],
            ),
            SizedBox(height: 20),
            buildEditField(
              'Full Name',
              Icons.person,
              Colors.blue,
              fullNameController,
            ),
            buildEditField(
              'Phone no',
              Icons.phone,
              Colors.green,
              phoneNoController,
            ),
            buildEditField(
              'Email',
              Icons.email,
              Colors.orange,
              emailController,
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Implement the submit action
                  // Update the user information and close the dialog
                  await updateUserData();
                  Navigator.of(context).pop();
                },
                child: Text('Edit Profile',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Close the dialog without saving changes
                  Navigator.of(context).pop();
                },
                child: Text(
                    'Cancel', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> updateUserData() async {

    final String fullName = fullNameController.text.trim();
    final String phoneNo = phoneNoController.text.trim();
    final String email = emailController.text.trim();

    // Update the user data in Firebase
    try {
      final User currentUser = FirebaseAuth.instance.currentUser!;
      await FirebaseService_Profile().updateUserData(
        currentUser.uid,
        fullName: fullName,
        phoneNo: phoneNo,
        email: email,
      );
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Handle the picked image (e.g., upload it, display it, etc.)
      print('Image path: ${pickedFile.path}');
    } else {
      print('No image selected');
    }
  }

  Widget buildEditField(
      String label,
      IconData icon,
      Color color,
      TextEditingController controller,
      ) {
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
                controller: controller,
                style: TextStyle(fontSize: 14), // Adjust font size
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
