import 'package:flutter/material.dart';

class Item {
  final String name;
  final int stock;
  final String category;
  final String location;

  Item({
    required this.name,
    required this.stock,
    required this.category,
    required this.location,
  });
}

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final List<String> categories = [
    'All',
    'Food',
    'Electronics',
    'Office',
    'Tools',
    'Clothing',
  ];
  String selected = 'All';

  final items = [
    Item(
      name: 'Laptop',
      stock: 2,
      category: 'Electronics',
      location: 'Home Cabinet',
    ),
    Item(
      name: 'Proyektor',
      stock: 4,
      category: 'Electronics',
      location: 'Storage Room',
    ),
    Item(
      name: 'Kabel HDMI',
      stock: 6,
      category: 'Electronics',
      location: 'Storage Room',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(22.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search items...',
              suffixIcon: Icon(Icons.folder_copy_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.only(left: 4, right: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                spacing: 8,
                children: categories.map((category) {
                  final isSelected = selected == category;
                  return ChoiceChip(
                    label: Text(category, style: TextStyle(fontSize: 18)),
                    selected: isSelected,
                    selectedColor: Colors.white,
                    backgroundColor: Colors.grey.shade200,
                    labelStyle: TextStyle(color: Colors.black),
                    onSelected: (_) => setState(() => selected = category),
                    shape: StadiumBorder(),
                    showCheckmark: false,
                    side: BorderSide.none,
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                leading: Icon(Icons.folder_copy_outlined, size: 40),
                title: Text(
                  items[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Chip(
                          label: Text(
                            '${items[index].stock} in stock',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          backgroundColor: Colors.grey.shade200,
                        ),
                        Chip(
                          label: Text(
                            items[index].category,
                            style: TextStyle(fontSize: 18.0),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${items[index].stock} items',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 18.0),
            itemCount: items.length,
          ),
        ],
      ),
    );
  }
}
