import 'package:flutter/material.dart';
import 'package:inventory/data/notifiers.dart';
import 'package:inventory/views/pages/dashboard_page.dart';
import 'package:inventory/views/pages/inventory_page.dart';
import 'package:inventory/views/pages/profile_page.dart';
import 'package:inventory/views/pages/report_page.dart';
import 'package:inventory/views/pages/transaction_page.dart';
import 'package:inventory/views/widgets/navbar_widget.dart';

List<Widget> pages = [DashboardPage(), InventoryPage(), TransactionPage(), ReportPage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inventory Management')),
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
