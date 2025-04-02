import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkedIn Profile Page',
      home: LinkedInProfilePage(),
    );
  }
}

class LinkedInProfilePage extends StatelessWidget {
  final Random random = Random();

  // Sample data for generating random profiles
  final List<String> names = [
    'Alice Johnson',
    'Bob Smith',
    'Charlie O\'Connell',
    'Diana Prince',
    'Edward Elric',
    'Fiona Gallagher',
    'George Jetson',
  ];

  final List<String> universities = [
    'MIT',
    'Stanford',
    'Harvard',
    'Walchand Institute of Technology',
    'UC Berkeley',
    'Caltech',
  ];

  final List<String> skills = [
    'Flutter Development',
    'Cloud Computing',
    'Machine Learning',
    'Web Development',
    'Data Science',
    'App Development',
  ];

  final List<String> images = [
    "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80",
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80",
    "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80",
    "https://images.unsplash.com/photo-1517841902196-9144e7337442?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80",
    "https://images.unsplash.com/photo-1522556189639-b1509e4e9f68?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80",
    "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80",
    "https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80",
    "https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80",
  ];


  // Function to generate random user data
  Map<String, String> generateRandomUser() {
    return {
      'name': names[random.nextInt(names.length)],
      'university': universities[random.nextInt(universities.length)],
      'domain': skills[random.nextInt(skills.length)],
      'jobTitle': 'Intern',
      'location': 'Remote',
      'followers': (random.nextInt(1000)).toString(),
      'profileViews': (random.nextInt(100)).toString(),
      'postImpressions': (random.nextInt(20)).toString(),
      'searchAppearances': (random.nextInt(15)).toString(),
      'profileImage': images[random.nextInt(images.length)], // Profile image URL
      'coverImage': 'https://example.com/cover_image.jpg', // Cover image URL
    };
  }
  late List<String> shuffledImages;
  @override
  Widget build(BuildContext context) {
    final userData = generateRandomUser();
    shuffledImages = images.toList()..shuffle(Random());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        title: Text("Your Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image Section
            Container(
              height: 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(userData['coverImage'] ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 3.0),

            // Profile Section
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                     // child: Image.network('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80',width: 80 ,
                     //  height: 20,
                     //   fit: BoxFit.fill,

                     backgroundImage: NetworkImage(userData['profileImage']?? '')
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData['name'] ?? 'Unknown User',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Student at ${userData['university'] ?? ''}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          userData['domain'] ?? '',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8.0),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Open to Work',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Suggested Section
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Suggested for you:', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10.0),
                  ListTile(
                    title: Text('Enhance your profile with the help of AI'),
                    subtitle: Text('Try Premium for 30 days'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: Text('Get started'),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),

            // Analytics Section
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Analytics:', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(userData['profileViews'] ?? '0', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('Profile views'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(userData['postImpressions'] ?? '0', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('Post impressions'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(userData['searchAppearances'] ?? '0', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('Search appearances'),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Show all analytics'),
                  ),
                ],
              ),
            ),
            Divider(),

            // About Section
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About:', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8.0),
                  Text(
                    'I am a passionate Flutter Developer and an undergraduate student at ${userData['university']}.',
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {},
                    child: Text('Show all posts'),
                  ),
                ],
              ),
            ),
            Divider(),

            // Activity Section
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Activity', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10.0),
                  Text('${userData['followers']} Followers'),
                  ListTile(
                    title: Text('Post 1'),
                    subtitle: Text('Details about post 1'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Post 2'),
                    subtitle: Text('Details about post 2'),
                    onTap: () {},
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {},
                    child: Text('Show all posts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}