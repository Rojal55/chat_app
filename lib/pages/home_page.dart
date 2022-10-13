// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors

import 'package:chat_app/app.dart';
import 'package:chat_app/pages/profile_page.dart';
import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/pages/contacts_page.dart';
import 'package:chat_app/pages/calls_page.dart';
import 'package:chat_app/pages/message_page.dart';
import 'package:chat_app/pages/notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route get route => MaterialPageRoute(
        builder: (context) => HomePage(),
      );
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    MessegesPage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
  ];
  final List<String> title = ["Messages", "Notifications", "Calls", "Accounts"];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.secondary,
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.secondary,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        elevation: 0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.messenger_rounded,
                  // color: Colors.white,
                ),
              ),
              label: "messeges"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.notifications,
                ),
              ),
              label: "notification"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.call,
                ),
              ),
              label: "calls"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.person,
                ),
              ),
              label: "Contacts"),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Search
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).cardColor),
              child: const Icon(Icons.search_rounded),
            ),

            // Page Title
            Text(
              title[_currentIndex],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            // Avatar
            // Container(
            //   height: 50,
            //   width: 50,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25),
            //     color: Theme.of(context).cardColor,
            //   ),
            //   child: Image.network(context.currentUserImage.toString()),
            // )
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushAndRemoveUntil(ProfilePage.route, (route) => false);
              },
              child: Hero(
                tag: 'hero-profile-picture',
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    context.currentUserImage.toString(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: pages[_currentIndex],
    );
  }
}
