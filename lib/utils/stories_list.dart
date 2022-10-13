import 'package:chat_app/utils/data.dart';
import 'package:flutter/material.dart';

import 'story_card.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
              child: Container(
                height: 150,
                // color: Theme.of(context).cardColor,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Stories",
                        style: TextStyle(
                            color: Colors.grey[500], fontWeight: FontWeight.bold),
                      ),
                    ),

                    // Stories List
                    Expanded(
                      child: ListView.builder(
                        itemCount: names.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return StoryCard(
                            name: names[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}