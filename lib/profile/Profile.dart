import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_card/constants.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

int check=0;
late var data;

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    profiledetails("adam");
  }

  dynamic profiledetails(String email) async {
    // Controller c = Get.put(Controller());
    try{
      // c.username.value=email;

   //  final url = Uri.parse("http://127.0.0.1:8081/profile/adamrubiks@gmail.com");
     final url = Uri.parse("http://10.0.2.2:8081/profile/adamrubiks@gmail.com");


print(url.toString());
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },

      );
    //  print(response.body);
print(response.body);
      if(response.statusCode == 200){
      //  print("print akua");


          setState(() {
           check=1;

         //  print("response.body");
          });

      data=jsonDecode(response.body);
      }else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

            content: const Text('Something went wrong.'),
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

  dynamic downloadcontact() async {
    // Controller c = Get.put(Controller());
    try{
      final Uri _url = Uri.parse("http://127.0.0.1:8081/contact/adamrubiks@gmail.com");
      await launchUrl(_url);
    }catch(e){
      print(e.toString());
    }
    // setState(() {
    //   flag=false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  check==1?Container(
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
                        image: AssetImage("pictures/adamsy.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(data["first_name"]+" "+data["last_name"]??" ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700)),

                  SizedBox(height: 2),
                  Text(data["company"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w300)),
//create a container with height 56 width 343 and color pink and a row child
                  SizedBox(height: 20),
                  GestureDetector(onTap: ()async{
                    await downloadcontact();
                  },
                    child: Container(
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
                        Text(data["phone"],
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
                        Text(data["email"],
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
                        Text(data["job_title"],
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
                            Text(data["city"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),

                            Text(data["state"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),

                            Text(data["zipcode"],
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
                  GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["location"]);
                    await launchUrl(_url);
                  },
                    child: Container(
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
                  ),

                  SizedBox(height: 20),
                 data["website"]!=null? Container(
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
                  ):SizedBox( height:0),

                  SizedBox(height: 20),
                  data["facebooklink"]!=null?  GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["facebooklink"]);
                    await launchUrl(_url);
                  },
                    child: Container(
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
                  ):SizedBox(height: 0,),

                  SizedBox(height: 20),
                  data["twitterlink"]!=null? GestureDetector(
                    onTap: ()async{
                      final Uri _url = Uri.parse(data["twitterlink"]);
                      await launchUrl(_url);
                    },
                    child: Container(
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
                  ):SizedBox(height: 0,),

                  SizedBox(height: 20),
                  data["instagramlink"]!=null?GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["instagramlink"]);
                    await launchUrl(_url);
                  },
                    child: Container(
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
                  ):SizedBox(height: 0,),

                  SizedBox(height: 20),
                  data["skypelink"]!=null?  GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["skypelink"]);
                    await launchUrl(_url);
                  },
                    child: Container(
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
                  ):SizedBox(height: 0,),

                  SizedBox(height: 20),
                  data["skypelink"]!=null?  GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["skypelink"]);
                    await launchUrl(_url);
                  },
                    child: Container(
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
                  ):SizedBox(height: 1,),

                  SizedBox(height: 20),
                  data["skypelink"]!=null?   GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["youtubelink"]);
                    await launchUrl(_url);
                  },
                    child: Container(
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
                  ):SizedBox(height: 1,),


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
            )):Center(child: CupertinoActivityIndicator(),));
  }
}
