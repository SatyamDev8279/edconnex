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
      "name": "Wish Alexandera a happy birthday!",
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
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                _singleCategoryItem(
                    title: "All",
                    bgColor: _selectedCategoryIndex == 0
                        ? Colors.blue.shade900
                        : Colors.blue.shade100,
                    textColor:
                        _selectedCategoryIndex == 0 ? liWhite : liMediumGrey,
                    border: _selectedCategoryIndex == 0 ? 0 : 1,
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = 0;
                      });
                    }),
                const SizedBox(
                  width: 8,
                ),
                _singleCategoryItem(
                    title: "My Doubts",
                    bgColor: _selectedCategoryIndex == 1
                        ? Colors.blue.shade900
                        : Colors.blue.shade100,
                    textColor:
                        _selectedCategoryIndex == 1 ? liWhite : liMediumGrey,
                    border: _selectedCategoryIndex == 1 ? 0 : 1,
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = 1;
                      });
                    }),
                const SizedBox(
                  width: 8,
                ),
                _singleCategoryItem(
                    title: "Flutter",
                    bgColor: _selectedCategoryIndex == 2
                        ? Colors.blue.shade900
                        : Colors.blue.shade100,
                    textColor:
                        _selectedCategoryIndex == 2 ? liWhite : liMediumGrey,
                    border: _selectedCategoryIndex == 2 ? 0 : 1,
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = 2;
                      });
                    }),
                SizedBox(width: 8),
                _singleCategoryItem(
                    title: "C++",
                    bgColor: _selectedCategoryIndex == 3
                        ? Colors.blue.shade900
                        : Colors.blue.shade100,
                    textColor:
                        _selectedCategoryIndex == 3 ? liWhite : liMediumGrey,
                    border: _selectedCategoryIndex == 3 ? 0 : 1,
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = 3;
                      });
                    }),
                SizedBox(width: 8),
                _singleCategoryItem(
                    title: "Web",
                    bgColor: _selectedCategoryIndex == 4
                        ? Colors.blue.shade900
                        : Colors.blue.shade100,
                    textColor:
                        _selectedCategoryIndex == 4 ? liWhite : liMediumGrey,
                    border: _selectedCategoryIndex == 4 ? 0 : 1,
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = 4;
                      });
                    })
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 8,
            color: liLightGrey,
          ),
          ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return _singleNotificationWidget(
                  name: notifications[index]["name"]!,
                  message: notifications[index]["message"]!,
                  time: notifications[index]["time"]!,
                  image: notifications[index]["image"]!,
                );
              })
        ],
      ),
    ));
  }

  _singleCategoryItem(
      {String? title,
      Color? textColor,
      Color? bgColor,
      VoidCallback? onTap,
      double? border}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: border!),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  _singleNotificationWidget(
      {required String name,
      required String message,
      required String time,
      required String image}) {
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
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
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
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    message,
                    style: TextStyle(color: liMediumGrey),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
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
              )
            ],
          )
        ],
      ),
    );
  }
}
