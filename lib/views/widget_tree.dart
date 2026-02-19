import 'package:flutter/material.dart';
import 'package:inventory/data/notifiers.dart';
import 'package:inventory/views/pages/dashboard_page.dart';
import 'package:inventory/views/pages/inventory_page.dart';
import 'package:inventory/views/pages/profile_page.dart';
import 'package:inventory/views/pages/transaction_page.dart';
import 'package:inventory/views/widgets/navbar_widget.dart';

List<Widget> pages = [
  DashboardPage(),
  InventoryPage(),
  TransactionPage(),
  ProfilePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        actionsPadding: EdgeInsets.only(right: 24),
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: ValueListenableBuilder(
            valueListenable: selectedPageNotifier,
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value == 0
                        ? 'Dashboard'
                        : value == 1
                        ? 'My Goods'
                        : value == 2
                        ? 'Activity'
                        : 'Profile',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value == 0
                        ? 'Welcome back!'
                        : value == 1
                        ? '6 items . 3 low stock'
                        : value == 2
                        ? 'Recent changes and updates'
                        : 'John Doe',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            },
          ),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: selectedPageNotifier,
            builder: (context, value, child) {
              return value == 0 || value == 1
                  ? Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.inventory_2_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    )
                  : value == 2
                  ? Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.compare_arrows,
                        color: Colors.white,
                        size: 25,
                      ),
                    )
                  : Container();
            },
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color.fromARGB(29, 0, 0, 0),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, updatedIndex, child) {
          return pages.elementAt(updatedIndex);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
