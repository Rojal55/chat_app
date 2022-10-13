// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors

import 'package:chat_app/pages/select_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import 'package:chat_app/app.dart';
import 'package:chat_app/theme.dart';

void main() {
  final client = StreamChatClient(streamKey);
  runApp(
    MyApp(
      client: client,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          child: ChannelsBloc(child: UsersBloc(child: child!)),
        );
      },
      home: SelectUserScreen(),
    );
  }
}
