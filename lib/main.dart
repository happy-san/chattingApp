import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/auth_screen.dart';
import './screens/chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Chat App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.purple,
                backgroundColor: Colors.lightBlue,
                accentColor: Colors.deepOrange,
                accentColorBrightness: Brightness.light,
                textTheme: TextTheme(
                  button: TextStyle(color: Colors.white),
                ),
                buttonTheme: ButtonTheme.of(context).copyWith(
                  buttonColor: Colors.purple,
                  textTheme: ButtonTextTheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (ctx, AsyncSnapshot<User> userSnapshot) {
                  if (userSnapshot.hasData) {
                    return ChatScreen();
                  }
                  return AuthScreen();
                },
              ),
            );
          } else
            return SizedBox();
        });
  }
}
