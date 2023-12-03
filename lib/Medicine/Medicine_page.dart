import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MedicineFilter {
  final String name;
  final String category;

  MedicineFilter({required this.name, required this.category});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.red, // Change the primary color to your preference
      ),
      title: 'Medicine',
      home: MedicineList(),
    );
  }
}

class MedicineList extends StatefulWidget {
  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  TextEditingController searchController = TextEditingController();

  List<MedicineFilter> products = [
    MedicineFilter(name: 'Paracetamol', category: 'Tablet'),
    MedicineFilter(name: 'Niko', category: 'Tablet'),
    MedicineFilter(name: 'Gaviscon', category: 'Liquid'),
    MedicineFilter(name: 'Vicks', category: 'Liquid'),
    MedicineFilter(name: 'Amoxycillin', category: 'Capsule'),
    MedicineFilter(name: 'Doxysina', category: 'Capsule'),
  ];

  Map<String, List<MedicineFilter>> categoryMap = {};

  List<MedicineFilter> filteredProducts = [];
  Set<String> uniqueCategories = Set<String>();
  Set<String> selectedCategories = Set<String>();

  @override
  void initState() {
    super.initState();
    uniqueCategories = Set.from(products.map((product) => product.category));
    uniqueCategories.add('All'); // Add "All" category option

    for (String category in uniqueCategories) {
      categoryMap[category] = products.where((product) => product.category == category).toList();
    }

    selectedCategories.add('All'); // Initially select "All"
    filteredProducts = products;
    searchController.addListener(() {
      filterList();
    });
  }

  void filterList() {
    setState(() {
      if (selectedCategories.contains('All')) {
        filteredProducts = products
            .where((product) =>
            product.category.toLowerCase().contains(searchController.text.toLowerCase()))
            .toList();
      } else {
        filteredProducts = products
            .where((product) =>
        product.category.toLowerCase().contains(searchController.text.toLowerCase()) &&
            selectedCategories.contains(product.category))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: uniqueCategories
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
            ),
          ),

          SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search by Category',
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
                return ListTile(
                  title: Text(filteredProducts[index].name),
                  subtitle: Text(filteredProducts[index].category),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
