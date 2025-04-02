import 'package:edconnex/main/main_page/main_page.dart';
import 'package:edconnex/main/network/network_page.dart';
import 'package:edconnex/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:edconnex/phase3/alumnifollow.dart';
import 'package:edconnex/phase3/clubspage.dart';
import 'package:edconnex/phase3/groupsoage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage My Network',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ManageNetworkPage(),
      routes: {
        '/alumniConnect': (context) => const NetworkPage(),
        '/alumniIFollow': (context) => NetworkkPage(),
        '/clubsAndEvents': (context) => GroupsPage(),
        '/groups': (context) => ClubssPage(),
      },
    );
  }
}

class ManageNetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: liWhite,
        foregroundColor: liLightGrey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainpage()),
            );
          },
        ),
        title: Text('Manage my network',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 8,
            color: liLightGrey,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Alumni connect'),
            trailing: Text('193'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NetworkPage()));
            },
          ),
          SizedBox(height: 10),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Alumni I Follow'),
            trailing: Text('178'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NetworkkPage()));
            },
          ),
          SizedBox(height: 10),
          Divider(),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Clubs and Events'),
            trailing: Text('13'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GroupssPage()));
            },
          ),
          SizedBox(height: 10),
          Divider(),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Groups'),
            trailing: Text('55'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClubssPage()));
            },
          ),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }
}

class AlumniConnectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumni Connect'),
      ),
      body: Center(
        child: Text('Alumni Connect Page'),
      ),
    );
  }
}

class AlumniIFollowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumni I Follow'),
      ),
      body: Center(
        child: Text('Alumni I Follow Page'),
      ),
    );
  }
}

class ClubsAndEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clubs and Events'),
      ),
      body: Center(
        child: Text('Clubs and Events Page'),
      ),
    );
  }
}

class GroupsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
      ),
      body: Center(
        child: Text('Groups Page'),
      ),
    );
  }
}
