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

  List<MedicineFilter> filteredProducts = [];
  Set<String> selectedCategories = Set<String>();

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
    searchController.addListener(() {
      filterList();
    });
  }

  void filterList() {
    setState(() {
      filteredProducts = products
          .where((product) =>
      product.category.toLowerCase().contains(searchController.text.toLowerCase()) &&
          (selectedCategories.isEmpty || selectedCategories.contains(product.category)))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filterable Product List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              children: products
                  .map((product) => FilterChip(
                label: Text(product.category),
                selected: selectedCategories.contains(product.category),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedCategories.add(product.category);
                    } else {
                      selectedCategories.remove(product.category);
                    }
                  });
                  filterList();
                },
              ))
                  .toList(),
            ),
          ),
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