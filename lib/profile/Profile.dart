import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_card/constants.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            child: SingleChildScrollView(scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 65),
                  //image of the profile picture with rounded corners
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage("pictures/profile.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text("John Doe Mathews",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700)),

                  SizedBox(height: 2),
                  Text("Iris Cards",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w300)),
//create a container with height 56 width 343 and color pink and a row child
                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(212, 241, 244, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                        Text("Download Contact",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),
                        Icon(Icons.file_download, color: Colors.black),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(212, 241, 244, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                        Text("Share Contact",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),
                        Icon(Icons.share, color: Colors.black),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone, color: Colors.blue),
                        SizedBox(width: 20),
                        Text("+91 755907475",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mail_outlined, color: Colors.redAccent),
                        SizedBox(width: 20),
                        Text("adamrubiks@gmail.com",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, color: Colors.blue),
                        SizedBox(width: 20),
                        Text("Managing Director",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map_outlined, color: Colors.green),
                        SizedBox(width: 20),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("House name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),

                            Text("Street name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),

                            Text("Pincode",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_pin, color: Colors.red),
                        SizedBox(width: 20),
                        Text("maps.google.com",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.globe),
                        SizedBox(width: 20),
                        Text("www.adamsy.me",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                        SizedBox(width: 20),
                        Text("Facebook",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.twitter,color: Colors.blue,),
                        SizedBox(width: 20),
                        Text("Twitter",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Icon(FontAwesomeIcons.instagram,color: Colors.pink,),
                        SizedBox(width: 20),
                        Text("Instagram",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.skype,color: Colors.blue,),
                        SizedBox(width: 20),
                        Text("Skype",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.snapchat,color: Colors.yellow,),
                        SizedBox(width: 20),
                        Text("Snapchat",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.youtube,color: Colors.red,),
                        SizedBox(width: 20),
                        Text("Youtube",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),

                      ],
                    ),
                  ),


                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(212, 241, 244, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 20),
                        Text("Download Brochure",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                        SizedBox(width: 10),
                        Icon(FontAwesomeIcons.bookOpenReader),


                      ],
                    ),
                  ),
SizedBox(height: 20,),
                  Text("Made with ❤️ by Iris Cards",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
            )));
  }
}
