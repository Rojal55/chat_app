// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme.dart';
import 'message_tiles.dart';

class DemoMessageList extends StatelessWidget {
  const DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).cardColor),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 14),
                  child: Text(
                    "Yesterday",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textFaded),
                  ),
                ),
              ),
            ),
          ),
          MessageTileOther(
            msgDate1: "7:59 PM",
            messageOthers: "Hello",
          ),
          MessageTileOwn(
            msgDate2: "7:59 PM",
            messageOwn: "Hello",
          ),
          MessageTileOther(
            msgDate1: "7:59 PM",
            messageOthers: "Whats Up",
          ),
          MessageTileOwn(
            msgDate2: "7:59 PM",
            messageOwn: "Nothing much",
          ),
          MessageTileOther(
            msgDate1: "7:59 PM",
            messageOthers: "how have u been",
          ),
          MessageTileOwn(
            msgDate2: "7:59 PM",
            messageOwn: "fine",
          ),
          MessageTileOther(
            msgDate1: "7:59 PM",
            messageOthers: "how have u been",
          ),
          MessageTileOwn(
            msgDate2: "7:59 PM",
            messageOwn: "fine",
          ),
          MessageTileOther(
            msgDate1: "7:59 PM",
            messageOthers: "how have u been",
          ),
          MessageTileOwn(
            msgDate2: "7:59 PM",
            messageOwn: "fine",
          ),
          MessageTileOther(
            msgDate1: "7:59 PM",
            messageOthers: "how have u been",
          ),
          MessageTileOwn(
            msgDate2: "7:59 PM",
            messageOwn: "fine",
          ),
          MessageTileOther(
            msgDate1: "7:59 PM",
            messageOthers: "how have u been",
          ),
          MessageTileOwn(
            msgDate2: "7:59 PM",
            messageOwn: "fine",
          ),
          
        ],
      ),
    );
  }
}
