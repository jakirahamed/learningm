import 'package:flutter/material.dart';
import 'package:learningm/page/add_product/add_product.dart';
import 'package:learningm/page/flash/flash.dart';
import 'package:learningm/page/home/deshboard.dart';
import 'package:learningm/page/order/order.dart';
import 'package:learningm/page/product/all_product.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List pages = [
    const Deshboard(),
    const Orderpage(),
    const AddProduct(),
    const AllProductPage(),
    const FlashPage(),
  ];
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.insert_chart_outlined_outlined),
            selectedIcon: Icon(Icons.insert_chart),
            label: 'Deshboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.multiline_chart_sharp),
            selectedIcon: Icon(Icons.multiline_chart),
            label: 'Order',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box_outlined),
            selectedIcon: Icon(Icons.add_box_rounded),
            label: 'Add',
          ),
          NavigationDestination(
            icon: Icon(Icons.app_registration_sharp),
            selectedIcon: Icon(Icons.app_registration_sharp),
            label: 'Product',
          ),
          NavigationDestination(
            icon: Icon(Icons.flash_on),
            selectedIcon: Icon(Icons.flash_on),
            label: 'Flash',
          ),
        ],
      ),
    );
  }
}
