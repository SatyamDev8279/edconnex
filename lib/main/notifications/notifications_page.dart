import 'package:edconnex/themes/styles.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _selectedCategoryIndex = 0;
  final List<Map<String, String>> notifications = [
    {
      "name": "Stephan Covey",
      "message": "posted: New post!",
      "time": "1h",
      "image": "assets/profile_2.jpeg"
    },
    {
      "name": "John Doe",
      "message": "followed you.",
      "time": "2h",
      "image": "assets/profile_1.jpeg"
    },
    {
      "name": "A post by Matricks is popular",
      "message": "Lorem ipsum dolor sit amet.",
      "time": "4h",
      "image": "assets/post_4.jpeg"
    },
    {
      "name": "Jane Smith",
      "message": "and 8 people viewed your profile",
      "time": "3h",
      "image": "assets/profile_3.jpeg"
    },
    {
      "name": "Wish Alexa a happy birthday!",
      "message": "(May 8)",
      "time": "5h",
      "image": "assets/profile_5.jpeg"
    },
    {
      "name": "Jason Mark",
      "message": "wanted to connect with you.",
      "time": "10m",
      "image": "assets/profile_1.jpeg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            _buildCategoryRow(),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 8,
              color: liLightGrey,
            ),
            _buildNotificationList(),
          ],
        ),
      ),
    );
  }

  Row _buildCategoryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _singleCategoryItem(
          title: "All",
          index: 0,
        ),
        _singleCategoryItem(
          title: "My Doubts",
          index: 1,
        ),
        _singleCategoryItem(
          title: "Flutter",
          index: 2,
        ),
        _singleCategoryItem(
          title: "C++",
          index: 3,
        ),
        _singleCategoryItem(
          title: "Web",
          index: 4,
        ),
      ],
    );
  }

  Widget _singleCategoryItem({String? title, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: _selectedCategoryIndex == index ? 0 : 1),
          color: _selectedCategoryIndex == index
              ? Colors.blue.shade900
              : Colors.blue.shade100,
        ),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
              color: _selectedCategoryIndex == index
                  ? liWhite
                  : liMediumGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return _singleNotificationWidget(
          name: notifications[index]["name"]!,
          message: notifications[index]["message"]!,
          time: notifications[index]["time"]!,
          image: notifications[index]["image"]!,
        );
      },
    );
  }

  Widget _singleNotificationWidget({
    required String name,
    required String message,
    required String time,
    required String image,
  }) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    style: TextStyle(color: liMediumGrey),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(color: liMediumGrey, fontSize: 12),
              ),
              const Icon(
                Icons.more_vert,
                color: liMediumGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}