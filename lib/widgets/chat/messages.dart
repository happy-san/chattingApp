import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('timeStamp', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = snapshot.data.docs;
        return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (ctx, index) {
              return MessageBubble(
                  chatDocs[index].get('text'),
                  chatDocs[index]
                      .get('userId')
                      .toString()
                      .contains(FirebaseAuth.instance.currentUser.uid),
                  chatDocs[index].get('userName'),
                  chatDocs[index].get('imageUrl'),
                  key: ValueKey(chatDocs[index].id));
            });
      },
    );
  }
}
