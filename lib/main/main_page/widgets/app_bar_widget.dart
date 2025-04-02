import 'package:edconnex/phase3/profilepagecode.dart';
import 'package:edconnex/themes/styles.dart';
import 'package:flutter/material.dart';

import '../messaging_page.dart';

PreferredSizeWidget appBarWidget(BuildContext context,
    {VoidCallback? onleadingTapClickListener,
    String? title,
    bool? isJobTab,
    required Null Function() onLeadingTapClickListener}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 1,
    backgroundColor: liWhite,
    leading: GestureDetector(
        onTap: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LinkedInProfilePage()), // Replace with your actual profile page
        );},
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("assets/avatarrr.jpeg")))),
    title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: liLightGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "$title",
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search, color: liLightGrey)),
        )),
    actions: [
      isJobTab == false
          ? Stack(children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MessagingScreen()));
                },
                icon: const Icon(Icons.message_rounded,
                    size: 28, color: liMediumGrey),
              ),
              Positioned(
                right: 1,
                top: 1,
                child: Container(
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ])
          : Stack(
              children: [
                // IconButton(
                //     onPressed: () {},
                //     icon: const Icon(Icons.more_vert,
                //         size: 35, color: liMediumGrey)),
                // const SizedBox(width: 10),
                IconButton(
                  onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MessagingScreen()));},
                  icon: const Icon(Icons.message_rounded,
                      size: 28, color: liMediumGrey),
                ),
                Positioned(
                  right: 1,
                  top: 1,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      const SizedBox(width: 10)
    ],
  );
}
