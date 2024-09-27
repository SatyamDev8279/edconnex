import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBody: true,
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                child: ClipOval(
                  child: Image.asset('assets/images/icons8-avatar-48.png'),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      constraints: BoxConstraints(maxHeight: 35),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,),
                  suffixIcon: Icon(Icons.qr_code,color: Colors.grey.shade400,),
                  ),
                ),
              ),
              ),
              Icon(Icons.chat_bubble,color: Colors.grey,)
            ],
          )),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(label: "", icon: Icon(Icons.house,color: Colors.grey,size: 25,),
          ),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.person_2_sharp,color: Colors.grey,size: 25,),),

          BottomNavigationBarItem(label: "" , icon: Icon(Icons.notification_important,color: Colors.grey,size: 25,)),
          BottomNavigationBarItem(label: "" , icon: Icon(Icons.notification_important,color: Colors.grey,size: 25,)),
          BottomNavigationBarItem(label: "" , icon: Icon(Icons.notification_important,color: Colors.grey,size: 25,)),
        ],
      ),
    );
  }
}
