import 'package:edconnex/main/main_page/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MessagingApp());
}

class MessagingApp extends StatelessWidget {
  const MessagingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MessagingScreen(),
    );
  }
}

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainpage()),
            );
          },
        ),
        title: const Text(
          'Messaging',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blueAccent),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search messages',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildChatItem(
                  context,
                  profileImage: Icons.person,
                  name: 'Full Name',
                  lastMessage: 'You: Your message',
                  time: '11:11 AM',
                  isOnline: true,
                ),
                _buildChatItem(
                  context,
                  profileImage: Icons.person,
                  name: 'Full Name',
                  lastMessage: 'You: Your message',
                  time: '11:11 AM',
                  isOnline: true,
                ),
                _buildChatItem(
                  context,
                  profileImage: Icons.group,
                  name: 'Group Name',
                  lastMessage: 'You sent a post',
                  time: '11:11 AM',
                ),
                _buildChatItem(
                  context,
                  profileImage: Icons.person,
                  name: 'Another User',
                  lastMessage: 'You: Another message',
                  time: '11:11 AM',
                  isOnline: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(
    BuildContext context, {
    required IconData profileImage,
    required String name,
    required String lastMessage,
    required String time,
    bool isOnline = false,
  }) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(chatName: name),
          ),
        );
      },
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(profileImage, color: Colors.white),
          ),
          if (isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.green,
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        lastMessage,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Text(
        time,
        style: const TextStyle(color: Colors.grey, fontSize: 12.0),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final String chatName;

  const ChatPage({Key? key, required this.chatName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chatname"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Chat with $chatName',
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
