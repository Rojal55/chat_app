// ignore_for_file: prefer_const_constructors

import 'package:chat_app/theme.dart';
import 'package:chat_app/utils/glowing_action_button.dart';
import 'package:flutter/material.dart';

class TextBar extends StatelessWidget {
  const TextBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                          color: Theme.of(context).dividerColor, width: 2,),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.camera_alt),
                    ),
                  )),

              SizedBox(
                width: 8,
              ),

              // SizedBox(height: 50,)
            ],
          ),
          Expanded(
            child: Container(
                height: 60,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    // color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Type Something",
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                )
                // Text(
                //   "Type Here",
                //   style: TextStyle(color: AppColors.textFaded),
                // ),
                ),
          ),
          SizedBox(
            width: 8,
          ),
          GlowingActionButton(
              color: AppColors.accent, icon: Icons.send, onPressed: () {}),
        ],
      ),
    );
  }
}
