// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String name;
  const StoryCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          // const SizedBox(
          //   height: 15,
          // ),

          const SizedBox(
            height: 15,
          ),

          //Avatar
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[800],
            ),
            child: const Icon(Icons.person),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
