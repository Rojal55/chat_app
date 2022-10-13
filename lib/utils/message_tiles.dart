// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme.dart';

class MessageTileOther extends StatelessWidget {
  final String messageOthers;
  final String msgDate1;
  const MessageTileOther({
    Key? key,
    required this.messageOthers,
    required this.msgDate1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              child: Text(messageOthers),
            ),
          ),
          SizedBox(height: 8,),
          Text(
            msgDate1,
            style: TextStyle(color: AppColors.textFaded,fontSize: 11),
          )
        ],
      ),
    );
  }
}

class MessageTileOwn extends StatelessWidget {
  final String messageOwn;
  final String msgDate2;

  const MessageTileOwn(
      {Key? key, required this.messageOwn, required this.msgDate2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              child: Text(messageOwn),
            ),
          ),
          SizedBox(height: 8,),
          Text(
            msgDate2,
            style: TextStyle(color: AppColors.textFaded,fontSize: 11),
          )
        ],
      ),
    );
  }
}
