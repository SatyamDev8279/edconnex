import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Groups',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GroupssPage(),
    );
  }
}

class GroupssPage extends StatelessWidget {
  final List<Map<String, String>> groups = [
    {'name': 'Flutter Developer', 'members': '21,419'},
    {'name': 'Hire Flutter Developer', 'members': '40,092'},
    {'name': 'Flutter Developer Community (moderated)', 'members': '209,974'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Your Groups' , style: TextStyle(color: Colors.black),),
        actions: [
          TextButton(
            onPressed: () {
              // Create group action
            },
            child: Text('Create group', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(Icons.group, size: 40),
                    title: Text(groups[index]['name']!),
                    subtitle: Text('${groups[index]['members']} members'),
                    trailing: Icon(Icons.more_vert),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Search other trusted communities that share and support your goals.',
              style: TextStyle(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}