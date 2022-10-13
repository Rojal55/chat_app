// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors


import 'package:chat_app/utils/demo_message_list.dart';

import 'package:chat_app/utils/text_bar.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  const ChatScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[800],
                    ),
                    child: const Icon(Icons.person),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //username
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: 2,
                      ),

                      //status
                      Text(
                        "Online Now",
                        style: TextStyle(fontSize: 10, color: Colors.green),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).cardColor),
                    child: const Icon(Icons.video_call),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor),
                      child: const Icon(Icons.call),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: const [
            Expanded(
              child: SizedBox(
                height: 500,
                child: SingleChildScrollView(child: DemoMessageList()),
              ),
            ),
            TextBar()
          ],
        ));
  }
}
