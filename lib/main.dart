import 'package:flutter/material.dart';
import 'package:nfc_card/auth/screens/Login.dart';
import 'package:nfc_card/auth/screens/Username.dart';
import 'package:nfc_card/profile/Edit_profile.dart';
import 'package:nfc_card/profile/Edit_profile_laptop.dart';
import 'package:nfc_card/profile/Profile.dart';

import 'auth/screens/Otp.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("main ahne");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:Edit_profile(),
    );
  }
}


