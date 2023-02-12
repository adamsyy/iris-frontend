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
import 'dart:ui' show kIsWeb;

import 'auth/screens/Otp.dart';

late String myurl;
late bool toProfile;
late String profilelink;
void main() {

  String platformName;
  if (kIsWeb) {
    myurl = Uri.base.toString();
    toProfile=myurl.contains("59773/");
    if(toProfile){

      profilelink = myurl.split("59773/")[1];
    }
  }else{
    profilelink='edit';
  }



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: decidepage()
    );
  }

  Widget decidepage(){
   if(profilelink=='home'){return Username();
  }
   if(profilelink=='edit'){return Edit_profile();
   }
 return Profile(id: profilelink);

}}
