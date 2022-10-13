// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import 'package:chat_app/app.dart';
import 'package:chat_app/pages/chat_screen.dart';
import 'package:chat_app/theme.dart';
import 'package:chat_app/utils/widget/helpers.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final String dateMessage;
  final Channel channel;

  const MessageCard({
    Key? key,
    required this.message,
    required this.dateMessage,
    required this.channel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ChatScreen(
                name: Helpers.getChannelName(channel, context.currentUser!),
              );
            },
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).cardColor,
                // border: Border(
                //   bottom: BorderSide(color: Colors.grey,width: 0.2)
                // )
              ),
              child: Row(
                children: [
                  // Avatar
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      // Theme.of(context).cardColor,
                      color: Colors.grey[800],
                    ),
                    child: Image.network(
                      Helpers.getChannelImage(channel, context.currentUser!)
                          .toString(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Helpers.getChannelName(
                                channel, context.currentUser!),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 1.5),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _buildLastMessage(),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildLastMessageDate(),
                      // Text(
                      //   dateMessage.toUpperCase(),
                      //   style: TextStyle(
                      //       fontSize: 11,
                      //       letterSpacing: -0.2,
                      //       fontWeight: FontWeight.w600,
                      //       color: AppColors.textFaded),
                      // ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondary,
                        ),
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontSize: 10, color: AppColors.textLigth),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }

  Widget _buildLastMessage() {
    return BetterStreamBuilder(
        stream: channel.state!.lastMessageStream,
        initialData: channel.state!.lastMessage,
        builder: (context, lastMessage) {
          return Text(
            lastMessage?.toString() ?? '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: AppColors.textFaded),
          );
        });
  }

  Widget _buildLastMessageDate() {
    return BetterStreamBuilder<DateTime>(
        stream: channel.lastMessageAtStream,
        initialData: channel.lastMessageAt,
        builder: (context, data) {
          final lastMessageAt = data.toLocal();
          String stringDate;
          final now = DateTime.now();
          final startOfDay = DateTime(now.year, now.month, now.day);

          if (lastMessageAt.millisecondsSinceEpoch >=
              startOfDay.millisecondsSinceEpoch) {
            stringDate = Jiffy(lastMessageAt.toLocal()).jm;
          } else if (lastMessageAt.millisecondsSinceEpoch >=
              startOfDay.subtract(Duration(days: 1)).millisecondsSinceEpoch) {
            stringDate = 'YESTERDAY';
          } else if (startOfDay.difference(lastMessageAt).inDays < 7) {
            stringDate = Jiffy(lastMessageAt.toLocal()).EEEE;
          } else {
            stringDate = Jiffy(lastMessageAt.toLocal()).yMd;
          }

          return Text(
            stringDate,
            style: const TextStyle(
                fontSize: 11,
                color: AppColors.textFaded,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.2),
          );
        });
  }
}
