
import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as log;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

const streamKey = "rv64q9wwzyvn";

var logger = log.Logger();


// Extensions can be used to add functionality to SDK
extension StreamChatContext on BuildContext{

  /// fetches the current user image
  String? get currentUserImage => currentUser!.image;


  // fetches current user 
  User? get currentUser => StreamChatCore.of(this).currentUser;

}
