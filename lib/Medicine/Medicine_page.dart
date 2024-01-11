// Import necessary packages and files
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Profile/Favourites.dart';
import 'Detail_page.dart';

// Model class representing a filtered medicine with additional details
class MedicineFilter {
  final String name;
  final String category;
  final String imageAsset;
  final String medicineId; // Add a field for a unique identifier
  bool isFavorite; // Add a field for favorite status

  MedicineFilter({
    required this.name,
    required this.category,
    required this.imageAsset,
    required this.medicineId,
    this.isFavorite = false, // Default to not being a favorite
  });
}

// Stateful widget representing the page displaying a list of medicines
class MedicinePage extends StatefulWidget {
  final String? selectedCategory;

  MedicinePage({this.selectedCategory});

  @override
  _MedicineListState createState() => _MedicineListState();
}

// State class for the MedicinePage widget
class _MedicineListState extends State<MedicinePage> {
  TextEditingController searchController = TextEditingController();

  // List of MedicineFilter objects representing available medicines
  List<MedicineFilter> products = [
    MedicineFilter(name: 'Paracetamol', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Paracetamol'),
    MedicineFilter(name: 'Gaviscon', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Gaviscon'),
    MedicineFilter(name: 'Enoxaparin', category: 'Syringe', imageAsset: 'assets/images/Syringe.jpg', medicineId: 'Enoxaparin'),
    MedicineFilter(name: 'Neosporin', category: 'Cream/Ointment', imageAsset: 'assets/images/cream.jpg', medicineId: 'Neosporin'),
    MedicineFilter(name: 'Cephalexin', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Cephalexin'),
    MedicineFilter(name: 'Aspirin', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Aspirin'),
    MedicineFilter(name: 'Amoxicillin', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Amoxicillin'),
    MedicineFilter(name: 'Boniva', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Boniva'),
    MedicineFilter(name: 'Halicon', category: 'Syringe', imageAsset: 'assets/images/Syringe.jpg', medicineId: 'Halicon'),
    MedicineFilter(name: 'Citalopram', category: 'Cream/Ointment', imageAsset: 'assets/images/cream.jpg', medicineId: 'Citalopram'),
    MedicineFilter(name: 'Farxiga', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Farxiga'),
    MedicineFilter(name: 'Hydrea', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Hydrea'),
    MedicineFilter(name: 'Pantoprazole', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Pantoprazole'),
    MedicineFilter(name: 'Vitamin D3', category: 'Vitamin', imageAsset: 'assets/images/vitamin.jpg', medicineId: 'Vitamin D3'),
    MedicineFilter(name: 'Calcium Carbonate', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Calcium Carbonate'),
    MedicineFilter(name: 'Cephalexin', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Cephalexin'),
    MedicineFilter(name: 'Magnesium Oxide', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Magnesium Oxide'),
    MedicineFilter(name: 'Fish Oil', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Fish Oil'),
    MedicineFilter(name: 'Gabapentin', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Gabapentin'),
    MedicineFilter(name: 'Metformin', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Metformin'),
    MedicineFilter(name: 'Tamsulosin', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Tamsulosin'),
    MedicineFilter(name: 'Fluoxetine', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Fluoxetine'),
    MedicineFilter(name: 'Mucinex', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Mucinex'),
    MedicineFilter(name: 'Vibramycin', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Vibramycin'),
    MedicineFilter(name: 'Ondansetron', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Ondansetron'),
    MedicineFilter(name: 'Cetirizine', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Cetirizine'),
    MedicineFilter(name: 'Nitrofurantoin', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Nitrofurantoin'),
    MedicineFilter(name: 'Warfarin', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Warfarin'),
    MedicineFilter(name: 'Potassium Citrate', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Potassium Citrate'),
    MedicineFilter(name: 'Ivermectin', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Ivermectin'),
    MedicineFilter(name: 'Epinephrine', category: 'Syringe', imageAsset: 'assets/images/Syringe.jpg', medicineId: 'Epinephrine'),
    MedicineFilter(name: 'Morphine', category: 'Syringe', imageAsset: 'assets/images/Syringe.jpg', medicineId: 'Morphine'),
    MedicineFilter(name: 'Lidocaine', category: 'Syringe', imageAsset: 'assets/images/Syringe.jpg', medicineId: 'Lidocaine'),
    MedicineFilter(name: 'Sumatriptan', category: 'Syringe', imageAsset: 'assets/images/Syringe.jpg', medicineId: 'Sumatriptan'),
    MedicineFilter(name: 'Abilify', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Abilify'),
    MedicineFilter(name: 'Moov', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Moov'),
    MedicineFilter(name: 'Relispray', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Relispray'),
    MedicineFilter(name: 'Volini', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Volini'),
    MedicineFilter(name: 'Fluticasone', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Fluticasone'),
    MedicineFilter(name: 'Beclomethasone', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Beclomethasone'),
    MedicineFilter(name: 'Benzocaine throat', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Benzocaine throat'),
    MedicineFilter(name: 'Antibacterial Wound Spray', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Antibacterial Wound Spray'),
    MedicineFilter(name: 'Burn Relief', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Burn Relief'),
    MedicineFilter(name: 'Hydrocortisone', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Hydrocortisone'),
    MedicineFilter(name: 'Psoriasis Treatment', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Psoriasis Treatment'),
    MedicineFilter(name: 'Vaseline', category: 'Cream/Ointment', imageAsset: 'assets/images/cream.jpg', medicineId: 'Vaseline'),
    MedicineFilter(name: 'Heparin', category: 'Cream/Ointment', imageAsset: 'assets/images/cream.jpg', medicineId: 'Heparin'),
    MedicineFilter(name: 'Vicks VapoRub', category: 'Cream/Ointment', imageAsset: 'assets/images/cream.jpg', medicineId: 'Vicks VapoRub'),
    MedicineFilter(name: 'Triple Antibiotic', category: 'Cream/Ointment', imageAsset: 'assets/images/cream.jpg', medicineId: 'Triple Antibiotic'),
    MedicineFilter(name: 'Vitamin A', category: 'Vitamin', imageAsset: 'assets/images/vitamin.jpg', medicineId: 'Vitamin A'),
    MedicineFilter(name: 'Vitamin E', category: 'Vitamin', imageAsset: 'assets/images/vitamin.jpg', medicineId: 'Vitamin E'),
    MedicineFilter(name: 'Vitamin K', category: 'Vitamin', imageAsset: 'assets/images/vitamin.jpg', medicineId: 'Vitamin K'),
    MedicineFilter(name: 'Vitamin B Complex', category: 'Vitamin', imageAsset: 'assets/images/vitamin.jpg', medicineId: 'Vitamin B Complex'),
  ];

  List<MedicineFilter> filteredProducts = [];
  List<MedicineFilter> favoriteMedicines = [];

  // Set to keep track of selected medicine categories
  Set<String> selectedCategories = Set<String>();
  // Set to store all unique medicine categories
  Set<String> allCategories = Set<String>();

  @override
  void initState() {
    super.initState();

    // Initialize categories and filter list
    allCategories = Set.from(products.map((product) => product.category));

    if (widget.selectedCategory != null) {
      selectedCategories.add(widget.selectedCategory!);
      filterList();
    } else {
      selectedCategories = allCategories;
    }

    // Add listener to search input for real-time filtering
    searchController.addListener(() {
      filterList();
    });
  }

  // Method to filter the list of medicines based on selected categories and search input
  void filterList() {
    setState(() {
      if (selectedCategories.contains('All')) {
        // Filter all medicines when 'All' category is selected
        filteredProducts = products
            .where((product) =>
            product.name.toLowerCase().contains(searchController.text.toLowerCase()))
            .toList();
      } else {
        // Filter medicines based on selected categories and search input
        filteredProducts = products
            .where((product) =>
        product.name.toLowerCase().contains(searchController.text.toLowerCase()) &&
            selectedCategories.contains(product.category))
            .toList();
      }
    });
  }

  // Reference to the Firestore collection for user favorites
  CollectionReference favoritesCollection = FirebaseFirestore.instance.collection('Favorites');

  // Method to toggle the favorite status of a medicine
  void toggleFavoriteStatus(int index) {
    setState(() {
      // Toggle the favorite status of the selected medicine
      filteredProducts[index].isFavorite = !filteredProducts[index].isFavorite;

      if (filteredProducts[index].isFavorite) {
        // Add to Firebase favorites collection
        favoritesCollection.add({
          'name': filteredProducts[index].name,
          'category': filteredProducts[index].category,
          'imageAsset': filteredProducts[index].imageAsset,
          'medicineId': filteredProducts[index].medicineId,
          'userEmail': FirebaseAuth.instance.currentUser!.email, // Use email as the identifier
        });
      } else {
        // Remove from Firebase favorites collection
        favoritesCollection
            .where('medicineId', isEqualTo: filteredProducts[index].medicineId)
            .where('userEmail', isEqualTo: FirebaseAuth.instance.currentUser!.email)
            .get()
            .then((querySnapshot) {
          for (DocumentSnapshot ds in querySnapshot.docs) {
            ds.reference.delete();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with title
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Medicine List', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Container(
        // Background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/b.jpg'), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            // Horizontal scrolling category filter buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Wrap(
                  spacing: 8.0,
                  children: [
                    // 'All' category filter button
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
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
                      child: ElevatedButton(
                        onPressed: () {
                          // Toggle 'All' category filter
                          setState(() {
                            if (selectedCategories.contains('All')) {
                              selectedCategories.remove('All');
                            } else {
                              selectedCategories.clear();
                              selectedCategories.add('All');
                            }
                          });
                          // Filter the list accordingly
                          filterList();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, // Make the button transparent
                          elevation: 0.0, // Remove elevation
                        ),
                        child: Text(
                          'All',
                          style: TextStyle(color: Colors.white), // Set text color to white
                        ),
                      ),
                    ),
                    // Other category filter buttons
                    ...allCategories
                        .where((category) => category != 'All')
                        .map((category) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
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
                      child: ElevatedButton(
                        onPressed: () {
                          // Toggle selected category filter
                          setState(() {
                            if (selectedCategories.contains(category)) {
                              selectedCategories.remove(category);
                            } else {
                              selectedCategories.clear();
                              selectedCategories.add(category);
                            }
                          });
                          // Filter the list accordingly
                          filterList();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, // Make the button transparent
                          elevation: 0.0, // Remove elevation
                        ),
                        child: Text(
                          category,
                          style: TextStyle(color: Colors.white), // Set text color to white
                        ),
                      ),
                    ))
                        .toList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            // Search input field
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search by Medicine',
                  suffixIcon: Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // List of filtered medicines
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to detail page when a medicine is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            medicine: filteredProducts[index], // Pass the selected medicine
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 12.0,
                      margin: EdgeInsets.only(left: 20, right: 15, bottom: 10,),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
                          contentPadding: EdgeInsets.all(8.0), // Increase content padding for overall height
                          leading: Container(
                            width: 100,
                            height: 80, // Adjust the height as needed
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  filteredProducts[index].imageAsset,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            filteredProducts[index].name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            filteredProducts[index].category,
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              // Display filled or outlined heart icon based on favorite status
                              filteredProducts[index].isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.deepPurple,
                            ),
                            onPressed: () {
                              // Toggle the favorite status when the heart icon is pressed
                              toggleFavoriteStatus(index);
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
