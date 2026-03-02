import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListTransaction {
  final DateTime date;
  final List<Transaction> listTransaction;

  ListTransaction({required this.date, required this.listTransaction});
}

class Transaction {
  final String name;
  final String type;
  final String description;
  final DateTime date;
  final Item item;

  Transaction({
    required this.name,
    required this.type,
    required this.description,
    required this.date,
    required this.item,
  });
}

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

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final List<String> categories = [
    'All',
    'Added',
    'Updated',
    'Alerts',
    'Removed',
  ];
  String selected = 'All';

  final listTransactions = [
    ListTransaction(
      date: DateTime.now(),
      listTransaction: [
        Transaction(
          name: 'Added Laptop',
          type: 'Added',
          description: 'Quantity: 3',
          date: DateTime.now(),
          item: Item(
            name: 'Laptop',
            stock: 3,
            category: 'Electronics',
            location: 'Home Cabinet',
          ),
        ),
        Transaction(
          name: 'Updated Proyektor',
          type: 'Updated',
          description: 'Changed from 2 to 4',
          date: DateTime.now(),
          item: Item(
            name: 'Proyektor',
            stock: 4,
            category: 'Electronics',
            location: 'Storage Room',
          ),
        ),
      ],
    ),
    ListTransaction(
      date: DateTime.now().subtract(Duration(days: 1)),
      listTransaction: [
        Transaction(
          name: 'Removed Kabel HDMI Alert',
          type: 'Removed',
          description: 'Item depleted',
          date: DateTime.now().subtract(Duration(days: 1)),
          item: Item(
            name: 'Kabel HDMI',
            stock: 6,
            category: 'Electronics',
            location: 'Storage Room',
          ),
        ),
      ],
    ),
    ListTransaction(
      date: DateTime.now().subtract(Duration(days: 2)),
      listTransaction: [
        Transaction(
          name: 'Low Stock Alert',
          type: 'Alerts',
          description: 'only 10 pcs remaining',
          date: DateTime.now().subtract(Duration(days: 2)),
          item: Item(
            name: 'Print Paper',
            stock: 10,
            category: 'Office',
            location: 'Storage Room',
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(22.0),
      child: Column(
        children: [
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
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 8),
          Column(
            children: listTransactions
                .map(
                  (transaction) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.date.toLocal().toString().split(' ')[0],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            leading:
                                transaction.listTransaction[index].type ==
                                    'Added'
                                ? Icon(Icons.add, size: 40, color: Colors.green)
                                : transaction.listTransaction[index].type ==
                                      'Updated'
                                ? Icon(
                                    Icons.update,
                                    size: 40,
                                    color: Colors.orange,
                                  )
                                : transaction.listTransaction[index].type ==
                                      'Alerts'
                                ? Icon(
                                    Icons.warning,
                                    size: 40,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.remove,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                            title: Text(
                              transaction.listTransaction[index].name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction.listTransaction[index].item.name,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Row(
                                  spacing: 8,
                                  children: [
                                    Chip(
                                      label: Text(
                                        transaction
                                            .listTransaction[index]
                                            .item
                                            .category,
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      side: BorderSide.none,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          14.0,
                                        ),
                                      ),
                                      backgroundColor: Colors.grey.shade200,
                                    ),
                                    Text(
                                      transaction
                                          .listTransaction[index]
                                          .description,
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Text(
                              timeago.format(
                                transaction.listTransaction[index].date
                                    .toLocal(),
                              ),
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        itemCount: transaction.listTransaction.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
