import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NetworkkPage(),
    );
  }
}

class NetworkkPage extends StatelessWidget {
  final List<Person> network = [
    Person(name: 'John Doe', description: 'Flutter Developer | Google OS | Google Summer of …'),
    Person(name: 'Dong Steveson', description: 'Personnel Management || Industrial Relations ||…'),
    Person(name: 'Carig C Watson', description: 'Product @Kuvaka Tech | B2C & B2B SaaS | 0 to 1 | Strategy | Growth'),
    Person(name: 'Diana Joe', description: 'HR Professional with 10+ years of experience'),
    Person(name: 'Alexandra Tulip', description: 'Engineering Intern @ Moveworks || GenAI || DevOps '),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text("Your Network", style: TextStyle(color: Colors.black)),
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'Following'),
              Tab(text: 'Followers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FollowingTab(network: network),
            FollowersTab(),
          ],
        ),
      ),
    );
  }
}

class FollowingTab extends StatefulWidget {
  final List<Person> network;

  FollowingTab({required this.network});

  @override
  _FollowingTabState createState() => _FollowingTabState();
}

class _FollowingTabState extends State<FollowingTab> {
  // A map to track follow status
  Map<String, bool> followingStatus = {};

  @override
  void initState() {
    super.initState();
    for (var person in widget.network) {
      followingStatus[person.name] = false; // Initialize all as not followed
    }
  }

  void toggleFollow(String name) {
    setState(() {
      followingStatus[name] = !followingStatus[name]!; // Toggle follow/unfollow
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "You are following people out of your network",
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            itemCount: widget.network.length,
            itemBuilder: (context, index) {
              var person = widget.network[index];
              return ListTile(
                minVerticalPadding: 7,
                leading: CircleAvatar(child: Text(person.name[0])),
                title: Text(person.name),
                subtitle: Text(person.description),
                trailing: ElevatedButton(
                  onPressed: () => toggleFollow(person.name),
                  child: Text(followingStatus[person.name]! ? 'Unfollow' : 'Following'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FollowersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Followers List will be here'));
  }
}

class Person {
  final String name;
  final String description;

  Person({required this.name, required this.description});
}