// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:chat_app/model/demo_users.dart';

class SelectUserButton extends StatelessWidget {
  
  final Function(DemoUser user) onPressed;
  final DemoUser user;

  const SelectUserButton({
    Key? key,
    required this.onPressed,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: (() => onPressed(user)),
        child: Row(
          children: [
            //Avatar
            // Container(
            //   height: 60,
            //   width: 60,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30),
            //     color: Colors.grey[800],
            //   ),
            //   child: Image.network(image),
            // ),
      
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.image)
            ),
      
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                user.name,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
