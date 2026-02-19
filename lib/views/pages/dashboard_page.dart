import 'package:flutter/material.dart';

class Item {
  final String name;
  final String action;
  final String updated;

  Item({required this.name, required this.action, required this.updated});
}

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final items = [
    Item(name: 'Laptop', action: 'Add', updated: '2 hours ago'),
    Item(name: 'Proyektor', action: 'Update', updated: '5 hours ago'),
    Item(name: 'Kabel HDMI', action: 'Low', updated: '1 day ago'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.dashboard_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.arrow_outward_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '24',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Items',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.arrow_outward,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.warning_amber,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Low Stock',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '6',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_outward_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Added This Week',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.0),
          Text(
            'Recent Activity',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      items[index].action,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Text(items[index].name, style: TextStyle(fontSize: 20.0)),
                  ],
                ),
                subtitle: Text(
                  items[index].updated,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 12.0),
          ),
          SizedBox(height: 18.0),
          Text(
            'Quick Actions',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Add Item',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.list_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'View All',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
