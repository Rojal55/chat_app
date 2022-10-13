

// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, prefer_const_constructors

import 'package:chat_app/model/demo_users.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/utils/select_user_button.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../app.dart';

class SelectUserScreen extends StatefulWidget {
  static Route get route => MaterialPageRoute(
        builder: (context) => const SelectUserScreen(),
      );

  const SelectUserScreen({Key? key}) : super(key: key);

  @override
  State<SelectUserScreen> createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
  @override
  Widget build(BuildContext context) {
    bool _loading = false;

    Future<void> onUserSelected(DemoUser user) async {
      setState(() {
        _loading = true;
      });

      try {
        final client = StreamChatCore.of(context).client;
        await client.connectUser(
            User(
              id: user.id,
              extraData: {
                'name': user.name,
                'image': user.image,
              },
            ),
            client.devToken(user.id).rawValue);
        Navigator.of(context).pushAndRemoveUntil(HomePage.route, (route) => false);
      } on Exception catch (e, st) {
        logger.e('Could not connect user',e,st);
        setState(() {
          _loading = false;
        });
      }
    }

    return Scaffold(
      body: Center(
        child: (_loading)
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select A User",
                          style: TextStyle(fontSize: 24, letterSpacing: 0.4),
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                return SelectUserButton(
                                  user: users[index],
                                  onPressed: onUserSelected,
                                );
                              }))
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
