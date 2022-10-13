// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:chat_app/app.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/select_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Route get route => MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(HomePage.route,(route)=> false);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            // avatar
            Hero(
              tag: 'hero-profile-picture',
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  context.currentUserImage.toString(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              context.currentUser!.name,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 40,
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: Text(
            //     "Sign Out",
            //     style: TextStyle(color: Colors.blue),
            //   ),
            // ),
            _SignOutButton(),
          ],
        ),
      ),
    );
  }
}

class _SignOutButton extends StatefulWidget {
  const _SignOutButton({Key? key}) : super(key: key);

  @override
  State<_SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<_SignOutButton> {
  bool _loading = false;

  Future<void> _signOut() async {
    setState(() {
      _loading = true;
    });

    try {
      await StreamChatCore.of(context).client.disconnectUser();
      Navigator.of(context).pushAndRemoveUntil(SelectUserScreen.route, (route) => false);

      
    } on Exception catch (e, st) {
      logger.e('Could not sign out', e, st);
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const CircularProgressIndicator()
        : TextButton(
            onPressed: _signOut,
            child: Text("Sign Out"),
          );
  }
}
