import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String message;
  final bool isMe;
  final String userName;

  MessageBubble(this.message, this.isMe, this.userName, {this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.50),
          child: Container(
            decoration: BoxDecoration(
              color:
                  isMe ? Theme.of(context).primaryColorLight : Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: isMe ? Radius.circular(12) : Radius.circular(0),
                bottomLeft: Radius.circular(12),
                topRight: isMe ? Radius.circular(0) : Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1.color,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
