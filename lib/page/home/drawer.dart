import 'package:flutter/material.dart';

class DrowerF extends StatefulWidget {
  const DrowerF({Key? key}) : super(key: key);

  @override
  State<DrowerF> createState() => _DrowerFState();
}

class _DrowerFState extends State<DrowerF> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Text(
                    "Udemy",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SwitchListTile(
                    title: const Text('Dark'),
                    value: _isDark,
                    onChanged: (bool value) {
                      setState(() {
                        _isDark = value;
                      });
                    }),
                ListTile(
                  leading: const Icon(Icons.home),
                  onTap: () {},
                  title: const Text(
                    'Home',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
