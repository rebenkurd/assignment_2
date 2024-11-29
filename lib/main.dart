/*
* Group B
* Rebin Rafiq Salih
* Aland Karzan
* Namo Hussein
*/
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Static list of items
  final List<Map<String, dynamic>> items = [
    {'name': 'Pizza Margherita', 'icon': Icons.local_pizza, 'price': '\$12'},
    {'name': 'Cappuccino', 'icon': Icons.coffee, 'price': '\$5'},
    {'name': 'Cheesecake', 'icon': Icons.cake, 'price': '\$8'},
    {'name': 'Tacos', 'icon': Icons.fastfood, 'price': '\$10'},
    {'name': 'Ice Cream', 'icon': Icons.icecream, 'price': '\$6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurdish Restaurant Menu'),
        centerTitle: true, // Centering the title
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple[400],
              ),
              child: Text(
                'Kurdish Restaurant',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading:const Icon(Icons.home),
              title:const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Home selected')),
                );
              },
            ),
            ListTile(
              leading: const Icon( Icons.info),
              title:const Text('About'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content:  Text('About selected')),
                );
              },
            ),
            ListTile(
              leading: const Icon( Icons.contact_page),
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text('Contact selected')),
                );
              },
            ),
          ],
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  // First Column
                  Expanded(
                    child: Column(
                      children: items
                          .take((items.length / 2).ceil()) // First half of items
                          .map((item) => buildMenuItem(item))
                          .toList(),
                    ),
                  ),
                const  SizedBox(width: 16), // Spacing between columns
                  // Second Column
                  Expanded(
                    child: Column(
                      children: items
                          .skip((items.length / 2).ceil()) // Remaining items
                          .map((item) => buildMenuItem(item))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          )
        ],
        currentIndex: 0, // Static selection for 'Menu'
        selectedItemColor: Colors.deepPurple[400],
        
        
      ),
    );
  }

  // Method to build each menu item
 Widget buildMenuItem(Map<String, dynamic> item) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children:  [
        Icon(
          item['icon'],
          size: 40,
          color: Colors.deepPurple[400],
        ),
       const SizedBox(width: 20),
        Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['name'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
           const SizedBox(height: 5),
            Text(
              item['price'],
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    ),
  );
 }
 }
