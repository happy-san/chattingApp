import 'dart:io';

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String message;
  final bool isMe;
  final String userName;
  final String imageUrl;

  MessageBubble(this.message, this.isMe, this.userName, this.imageUrl,
      {this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.50),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: isMe
                      ? Theme.of(context).primaryColorLight
                      : Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: isMe ? Radius.circular(12) : Radius.circular(0),
                    bottomLeft: Radius.circular(12),
                    topRight: isMe ? Radius.circular(0) : Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
              Positioned(
                top: -8,
                right: !isMe ? -12 : null,
                left: isMe ? -12 : null,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
