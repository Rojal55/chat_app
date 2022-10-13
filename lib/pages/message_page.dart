// ignore_for_file: prefer_const_constructors

import 'package:chat_app/utils/widget/display_error_msg.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../utils/data.dart';
import '../utils/message_card.dart';
import '../utils/stories_list.dart';

class MessegesPage extends StatefulWidget {
  const MessegesPage({Key? key}) : super(key: key);

  @override
  State<MessegesPage> createState() => _MessegesPageState();
}

class _MessegesPageState extends State<MessegesPage> {
  final channelListController = ChannelListController();
  @override
  Widget build(BuildContext context) {
    return ChannelListCore(
      channelListController: channelListController,
      filter: Filter.and([
        Filter.equal('type', 'messaginh'),
        Filter.in_('members', [
          StreamChatCore.of(context).currentUser!.id,
        ])
      ]),
      emptyBuilder: (context) => const Center(
        child: Text(
          "So Empty. \n Go and message someone",
          textAlign: TextAlign.center,
        ),
      ),
      errorBuilder: (context, error) => DisplayErrorMsg(
        error: error,
      ),
      loadingBuilder: (context) => const Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      ),
      listBuilder: (context, channels) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stories(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return MessageCard(
                  channel: channels[index],
                  message: messages[index],
                  dateMessage: dateMessage[index],
                );
              }, childCount: channels.length),
            ),
          ],
        );
      },
    );
  }
}
