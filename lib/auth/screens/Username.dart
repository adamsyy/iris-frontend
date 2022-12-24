import 'package:flutter/material.dart';
import 'package:nfc_card/constants.dart';


class Username extends StatefulWidget {
  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [gradient1, gradient2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 65),
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 125),
                Image.asset(
                  "pictures/iris.png",
                  width: 125,
                  height: 43,
                ),
                SizedBox(height: 110),
                Text(
                  "Enter your Username",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),

                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //add a text field
                    Container(
                      height: 70,
                      width: 217,
                      child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          )),
                    ),
                    SizedBox(width: 10),

                    Container(
                      height: 40,
                      width: 40,
                      child: Icon(Icons.arrow_forward_ios,
                          color: Colors.black, size: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
