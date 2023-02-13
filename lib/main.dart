import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nfc_card/Routess.dart';
import 'package:nfc_card/auth/screens/Login.dart';
import 'package:nfc_card/auth/screens/Username.dart';
import 'package:nfc_card/profile/Edit_profile.dart';
import 'package:nfc_card/profile/Edit_profile_browser.dart';
import 'package:nfc_card/profile/Edit_profile_laptop.dart';
import 'package:nfc_card/profile/Profile.dart';
import 'package:url_strategy/url_strategy.dart';
import 'dart:ui' show kIsWeb;

import 'auth/screens/Otp.dart';

late String myurl;
late bool toProfile;
late String profilelink;
void main() {

  myurl = Uri.base.toString();
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();







  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
home:  Decidepage(),
    );
  }

  Widget Decidepage() {
    myurl = Uri.base.toString();
    int lastIndex = myurl.lastIndexOf("/");
    String word = myurl.substring(lastIndex + 1);
    if(word.length==0){
      return Edit_profile();
    }
    if(word=='login'){return Username();}
else if(word=='edit'){return Edit_profile();}
return Profile(id: word);
  }
}
