import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfc_card/Controller.dart';
import 'package:nfc_card/constants.dart';
import 'package:http/http.dart' as http;
import 'package:nfc_card/profile/Edit_profile.dart';
import 'package:nfc_card/profile/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

late String username;
late String password;
Controller controller = Get.put(Controller());
int check=0;
String hint_username="Username";
String hint_password="Password";

class Username extends StatefulWidget {
  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {


  dynamic login(String email , password) async {
    setState(() {
      check=1;
    });
    // Controller c = Get.put(Controller());
    try{
      // c.username.value=email;
      var loginbody={
        "username":username,
        "password":password
      };
  final url = Uri.parse(controller.baseurl+'login/');


      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(loginbody),
      );



print(response.body);

      setState(() {
        check=0;
      });

      if(response.statusCode == 202){



        // Obtain shared preferences.

        final prefs = await SharedPreferences.getInstance();


   await prefs.setString('email',username);

         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Edit_profile()));
      }else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            title: const Text('Incorrect credentials'),
            content: const Text('The credentials you entered is incorrect. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK', style: TextStyle(color: Color(0xff9AC9C2)),),
              ),
            ],
          ),
        );
      }
    }catch(e){
      print(e.toString());
    }
    // setState(() {
    //   flag=false;
    // });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(  resizeToAvoidBottomInset: false,
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
                  "Enter your Credentials",
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
                      child: TextField(  textAlign: TextAlign.center,onChanged: (String s){
                        username=s;
                      },
                          onTap: (){
                            setState(() {
                              hint_username="";
                            });
                          },
                          decoration: InputDecoration(hintText: hint_username,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          )),
                    ),
                    SizedBox(width: 0),


                  ],
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //add a text field
                    SizedBox(width: 50,),
                    Container(
                      height: 70,
                      width: 217,
                      child: TextField( obscureText: true, textAlign: TextAlign.center,onChanged: (String s){
                        password=s;
                      },
                          onTap: (){
                            setState(() {
                           hint_password="";
                            });

                          },
                          decoration: InputDecoration(hintText: hint_password,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          )),
                    ),
                    SizedBox(width: 10),

                    GestureDetector(onTap: ()async{
                      await login(username,password);
                    },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(
                          height: 40,
                          width: 40,
                          child:check==0? Icon(Icons.arrow_forward_ios,
                              color: Colors.black, size: 20):Center(child: CupertinoActivityIndicator()),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    
                    
                  ],
                ),
                GestureDetector(onTap: ()async{
                  try{
                    final Uri _url = Uri.parse(controller.baseurl+'reset-password');
                    await launchUrl(_url);
                  }catch(e){
                    print(e.toString());
                  }
                },
                    child: Text("Forgot password?", style: TextStyle(color: Color(0xff9AC9C2))))
              ],
            )));
  }
}
