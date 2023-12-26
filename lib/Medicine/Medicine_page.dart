import 'package:flutter/material.dart';
import 'Detail_page.dart';

class MedicineFilter {
  final String name;
  final String category;
  final String imageAsset;
  final String medicineId; // Add a field for unique identifier

  MedicineFilter({required this.name, required this.category, required this.imageAsset, required this.medicineId});
}


class MedicinePage extends StatefulWidget {
  final String? selectedCategory;

  MedicinePage({this.selectedCategory});

  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicinePage> {
  TextEditingController searchController = TextEditingController();

  List<MedicineFilter> products = [
    MedicineFilter(name: 'Paracetamol', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Paracetamol'),
    MedicineFilter(name: 'Niko', category: 'Tablet', imageAsset: 'assets/images/Tablet.jpg', medicineId: 'Niko'),
    MedicineFilter(name: 'Gaviscon', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Gaviscon'),
    MedicineFilter(name: 'Vicks', category: 'Liquid', imageAsset: 'assets/images/Liquid.jpg', medicineId: 'Vicks'),
    MedicineFilter(name: 'Amoxicillin', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Amoxicillin'),
    MedicineFilter(name: 'Doxysina', category: 'Capsule', imageAsset: 'assets/images/Capsule.jpg', medicineId: 'Doxysina'),
    MedicineFilter(name: 'Vitamin', category: 'Syringe', imageAsset: 'assets/images/Syringe.jpg', medicineId: 'Vitamin'),
    MedicineFilter(name: 'Moov', category: 'Spray', imageAsset: 'assets/images/spray.jpg', medicineId: 'Moov'),
    MedicineFilter(name: 'Toothpaste', category: 'Cream/Ointment', imageAsset: 'assets/images/cream.jpg', medicineId: 'Toothpaste'),
  ];


  List<MedicineFilter> filteredProducts = [];

  Set<String> selectedCategories = Set<String>();

  Set<String> allCategories = Set<String>();

  @override
  void initState() {
    super.initState();

    allCategories = Set.from(products.map((product) => product.category));

    if (widget.selectedCategory != null) {
      selectedCategories.add(widget.selectedCategory!);
      filterList();
    } else {
      selectedCategories = allCategories;
    }

    searchController.addListener(() {
      filterList();
    });
  }

  void filterList() {
    setState(() {
      if (selectedCategories.contains('All')) {
        filteredProducts = products
            .where((product) =>
            product.name.toLowerCase().contains(searchController.text.toLowerCase()))
            .toList();
      } else {
        filteredProducts = products
            .where((product) =>
        product.name.toLowerCase().contains(searchController.text.toLowerCase()) &&
            selectedCategories.contains(product.category))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Medicine List', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/b.jpg'), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: [
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
                          setState(() {
                            if (selectedCategories.contains('All')) {
                              selectedCategories.remove('All');
                            } else {
                              selectedCategories.clear();
                              selectedCategories.add('All');
                            }
                          });
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
                          setState(() {
                            if (selectedCategories.contains(category)) {
                              selectedCategories.remove(category);
                            } else {
                              selectedCategories.clear();
                              selectedCategories.add(category);
                            }
                          });
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
            Padding(
              padding: const EdgeInsets.all(8.0),
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
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
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
                      margin: EdgeInsets.all(8.0),
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
