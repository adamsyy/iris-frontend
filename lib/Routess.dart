import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nfc_card/auth/screens/Username.dart';
import 'package:nfc_card/profile/Edit_profile.dart';
import 'package:nfc_card/profile/Profile.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static final router = FluroRouter();

  static var userHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return  Username();
      });

  static var placeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return Profile(id: "id");
      });

  static var editHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return Edit_profile();
      });

  static var profileHandler2 = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
        return Profile(id: "heuu");
      });


  static dynamic defineRoutes() {

    router.define("/", handler: userHandler,transitionType: TransitionType.fadeIn);

    router.define("/profile", handler: placeHandler,transitionType: TransitionType.inFromLeft);
    router.define("/edit", handler: editHandler,transitionType: TransitionType.inFromLeft);

  }
}