import 'package:flutter/material.dart';

import 'Detail_page.dart';

class MedicineFilter {
  final String name;
  final String category;

  MedicineFilter({required this.name, required this.category});
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
    MedicineFilter(name: 'Paracetamol', category: 'Tablet'),
    MedicineFilter(name: 'Niko', category: 'Tablet'),
    MedicineFilter(name: 'Gaviscon', category: 'Liquid'),
    MedicineFilter(name: 'Vicks', category: 'Liquid'),
    MedicineFilter(name: 'Amoxycillin', category: 'Capsule'),
    MedicineFilter(name: 'Doxysina', category: 'Capsule'),
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
        title: Text('Medicine List', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                children: [
                  ElevatedButton(
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
                      primary: selectedCategories.contains('All')
                          ? Theme.of(context).primaryColorLight
                          : Theme.of(context).backgroundColor,
                    ),
                    child: Text('All'),
                  ),
                  ...allCategories
                      .where((category) => category != 'All')
                      .map((category) => ElevatedButton(
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
                      primary: selectedCategories.contains(category)
                          ? Theme.of(context).primaryColorLight
                          : Theme.of(context).backgroundColor,
                    ),
                    child: Text(category),
                  ))
                      .toList(),
                ],
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
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
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
                      // Navigate to a new page when a list item is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.lightBlueAccent, // Change the color for the card
                      elevation: 5.0,
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
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