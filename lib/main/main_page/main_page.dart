import 'package:edconnex/main/main_page/settings_page.dart';
import 'package:edconnex/main/network/network1_page.dart';
import 'package:edconnex/themes/styles.dart';
import 'package:edconnex/main/main_page/widgets/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../create/create_page.dart';
import '../home/home_page.dart';
import '../jobs/jobs_page.dart';
import '../network/network_page.dart';
import '../notifications/notifications_page.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.symmetric(vertical: 40),
          children: [
            // User Profile Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset("assets/profile_1.jpeg"),)),
                  const SizedBox(height: 10),
                  const Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "View profile",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Analytics & Tools Section
            const ListTile(
              title: Text(
                "Analytics & tools",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("888 post impressions"),
            ),
            const Divider(),
            // Manage Pages Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Manage pages",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[300],
              ),
              title: const Text("Page name"),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[300],
              ),
              title: const Text("Page name"),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[300],
              ),
              title: const Text("Page name"),
            ),
            const Divider(),
            // Groups and Events Section
            ListTile(
              title: const Text("Groups"),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              title: const Text("Events"),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            const Divider(),
            // Settings Section
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          ],
        )),
        key: _scaffoldState,
        appBar: _currentPageIndex == 4
            ? appBarWidget(context, title: "Search Jobs", isJobTab: true,
                onLeadingTapClickListener: () {
                setState(() {
                  _scaffoldState.currentState!.openDrawer();
                });
              })
            : appBarWidget(context, title: "Search", isJobTab: false,
                onLeadingTapClickListener: () {
                setState(() {
                  _scaffoldState.currentState!.openDrawer();
                });
              }),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: liWhite,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          selectedItemColor: liBlue,
          selectedLabelStyle: const TextStyle(color: liBlack),
          unselectedItemColor: Colors.grey.shade500,
          unselectedLabelStyle: const TextStyle(color: liMediumGrey),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userGroup),
              label: "Network",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                size: 30,
              ),
              label: "Post",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.briefcase),
              label: "Jobs",
            ),
          ],
        ),
        body: _switchPages(_currentPageIndex));
  }

  _switchPages(int index) {
    switch (index) {
      case 0:
        {
          return const HomePage();
        }
      case 1:
        {
          return ManageNetworkPage();
        }
      case 2:
        {
          return CreatePage(
            onCloneClickListener: () {
              Navigator.pop(context);
              setState(() {
                _currentPageIndex = 0;
              });
            },
          );
        }
      case 3:
        {
          return const NotificationsPage();
        }
      case 4:
        {
          return const JobsPage();
        }
    }
  }
}
