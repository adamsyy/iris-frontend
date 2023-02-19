import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nfc_card/auth/screens/Username.dart';
import 'package:nfc_card/constants.dart';
import 'package:nfc_card/main.dart';
import 'package:nfc_card/profile/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

late PickedFile imageFile;
final ImagePicker _picker = ImagePicker();
bool ppuploaded = false;

late PickedFile imageFile2;
final ImagePicker _picker2 = ImagePicker();
bool ppuploaded2 = false;
int check = 0;

int c1=0;
int c2=0;
int c3=0;

String tester = "test";

String firstname = "k9";
String lastname = "k9";
String company = "k9";
String jobtitle = "k9";
String Address1 = "k9";
String Address2 = "null";
String city = "k9";
late String email = "adamrubiks@gmail.com";
String phone = "k9";
String email2 = "null";
String phone2 = "null";
String state = "k9";
String country = "k9";
String zipcode = "k9";
String location = "k9";

String linkedinlink = "null";
String twitterlink = "null";
String facebooklink = "null";
String instagramlink = "null";
String skypelink = "null";
String youtubelink = "null";
String website = "null";



late String cf = "null";

late final fileBytes;
late final fileName;

class Edit_profile extends StatefulWidget {
  static const String route = '/edit';
  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  @override
  void _pickImage() async {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        imageFile = pickedFile!;
        ppuploaded = true;
      });
      // String fileName = _imageFile.path.split('/').last;
      // print("File name: " + fileName);

    } catch (e) {
      setState(() {

        ppuploaded = false;
      });
      print("Image picker error " + e.toString());
    }
  }

  void _pickImage2() async {
    try {
      // get file
      final resultfile = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);

      if (resultfile != null && resultfile.files.isNotEmpty) {
        fileBytes = resultfile.files.first.bytes;
        fileName = resultfile.files.first.name;

        // upload file
        print(fileName);
        setState(() {
          // imageFile = pickedFile!;
          ppuploaded2 = true;
        });
      } else {
        // User canceled the picker
        setState(() {

          ppuploaded2 = false;
        });
      }

    } catch (e) {

      print("Image picker error " + e.toString());
    }
  }

  void checkLogin() async {
    // Here we check if user already logged in or not
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? emailval = await pref.getString("email");

    if (emailval != null) {
      setState(() {
        email = emailval;
        profiledetails(email);
      });
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Username(),
          ),
          (route) => false);
    }
  }

  void initState() {
    // TODO: implement initState

    super.initState();

    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    var deviceType =
        MediaQuery.of(context).devicePixelRatio >= 2 ? "Phone" : "Laptop";
    print(deviceType);
    setState(() {
      tester = deviceType;
    });

    return Scaffold(
        body: check == 1
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [gradient1, gradient2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: 65),
                      Text(
                        "Edit Card",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 50),
                      Image.asset(
                        "pictures/iris.png",
                        width: 125,
                        height: 43,
                      ),
                      SizedBox(height: 50),

                      //white container with circular border and row as the child
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(
                                      id: email,
                                    )),
                          );
                        },
                        child: Container(
                          height: 55,
                          width: 198,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "pictures/profile_round.png",
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "     Personal Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            //textfield for name with border radius
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  firstname = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                    hintText:
                                        data['first_name'] ?? 'First Name*',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  lastname = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.7)),
                                    hintText: data["last_name"].length != 0
                                        ? data["last_name"]
                                        : 'Last Name*',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  company = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["company"].length != 0
                                        ? TextStyle(
                                        color:
                                        Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                        color: Color.fromRGBO(
                                            125, 143, 171, 1)),
                                    hintText: data["company"].length != 0
                                        ? data["company"]
                                        : 'Company',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  jobtitle = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["job_title"].length != 0
                                        ? TextStyle(
                                        color:
                                        Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                        color: Color.fromRGBO(
                                            125, 143, 171, 1)),
                                    hintText: data["job_title"].length != 0
                                        ? data["job_title"]
                                        : 'Job Title',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(  maxLines: null,
                                  minLines: 1,
                                onChanged: (String s) {
                                  Address1 = s;
                                },
                                decoration: InputDecoration( hintMaxLines: 2,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["address_line1"].length != 0
                                        ? TextStyle(
                                        color:
                                        Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                        color: Color.fromRGBO(
                                            125, 143, 171, 1)),
                                    hintText: data["address_line1"].length != 0
                                        ? data["address_line1"]
                                        : 'Address Line*',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(maxLines: null,
                                minLines: 1,
                                onChanged: (String s) {
                                  Address2 = s;
                                },
                                decoration: InputDecoration( hintMaxLines: 2,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["address_line2"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["address_line2"].length != 0
                                        ? data["address_line2"]
                                        : 'Address Line2',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  city = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["city"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["city"].length != 0
                                        ? data["city"]
                                        : 'City',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  state = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["state"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["state"].length != 0
                                        ? data["state"]
                                        : 'State',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  country = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["country"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["country"].length != 0
                                        ? data["country"]
                                        : 'Country',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  zipcode = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["zipcode"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["zipcode"].length != 0
                                        ? data["zipcode"]
                                        : 'Zipcode',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(  maxLines: null,
                                minLines: 1,
                                onChanged: (String s) {
                              location=s;
                                },
                                decoration: InputDecoration( hintMaxLines: 2,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["location"].length != 0
                                        ? TextStyle(
                                        color:
                                        Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                        color: Color.fromRGBO(
                                            125, 143, 171, 1)),
                                    hintText: data["location"].length != 0
                                        ? data["location"]
                                        : 'Location',
                                    fillColor:
                                    Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "    Contact Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  phone = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["phone"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["phone"].length != 0
                                        ? data["phone"]
                                        : 'Mobile number*',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                enabled: false,
                                onChanged: (String s) {
                                  phone2 = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["email"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["email"].length != 0
                                        ? data["email"]
                                        : 'Memail',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  phone2 = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["phone2"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["phone2"].length != 0
                                        ? data["phone2"]
                                        : 'Secondary mobile number',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),

                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  email2 = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["email2"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["email2"].length != 0
                                        ? data["email2"]
                                        : 'Secondary email',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),

                            SizedBox(height: 10),
                            Text(
                              "     Social Links",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            //textfield for name with border radius
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  linkedinlink = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["linkedinlink"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["linkedinlink"].length != 0
                                        ? data["linkedinlink"]
                                        : 'Linkedin',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),

                            SizedBox(height: 10),
                            //textfield for name with border radius
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  twitterlink = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["twitterlink"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["twitterlink"].length != 0
                                        ? data["twitterlink"]
                                        : 'Twitter',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),

                            SizedBox(height: 10),
                            //textfield for name with border radius
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  facebooklink = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["facebooklink"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["facebooklink"].length != 0
                                        ? data["facebooklink"]
                                        : 'Facebook',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),

                            SizedBox(height: 10),
                            //textfield for name with border radius
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  instagramlink = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["instagramlink"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["instagramlink"].length != 0
                                        ? data["instagramlink"]
                                        : 'Instagram',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),

                            SizedBox(height: 10),
                            //textfield for name with border radius
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  skypelink = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["skypelink"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["skypelink"].length != 0
                                        ? data["skypelink"]
                                        : 'Skype',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),

                            //textfield for name with border radius

                            SizedBox(height: 10),
                            //textfield for name with border radius
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                onChanged: (String s) {
                                  youtubelink = s;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["youtubelink"].length != 0
                                        ? TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                            color: Color.fromRGBO(
                                                125, 143, 171, 1)),
                                    hintText: data["youtubelink"].length != 0
                                        ? data["youtubelink"]
                                        : 'Youtube',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),

                            SizedBox(height: 10),
                            //textfield for name with border radius
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: TextField(onChanged: (String s){
                                website=s;
                              },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle: data["website"].length != 0
                                        ? TextStyle(
                                        color:
                                        Colors.black.withOpacity(0.7))
                                        : TextStyle(
                                        color: Color.fromRGBO(
                                            125, 143, 171, 1)),
                                    hintText: data["website"].length != 0
                                        ? data["website"]
                                        : 'Personal website',
                                    fillColor:
                                        Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),

                            SizedBox(height: 10),

                            Text(
                              "     Files",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                _pickImage();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ppuploaded
                                          ? Text(
                                              "  Profile Picture uploaded",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )
                                          : Text(
                                              "  Upload Profile Picture",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      125, 143, 171, 1)),
                                            ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Icon(
                                          FontAwesomeIcons.cloudUploadAlt,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                _pickImage2();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 15),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ppuploaded2
                                          ? Text(
                                              "  brochure uploaded",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )
                                          : Text(
                                              "  Upload Brochure",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      125, 143, 171, 1)),
                                            ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Icon(
                                          FontAwesomeIcons.cloudUploadAlt,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: RaisedButton(
                                onPressed: () async {
                                  var datatosend = {
                                    "first_name": firstname,
                                    "last_name": lastname,
                                    "company": company,
                                    "job_title": jobtitle,
                                    "email": email,
                                    "email2": email2,
                                    "phone": phone,
                                    "phone2": phone2,
                                    "contact_file": cf,
                                    "address_line1": Address1,
                                    "address_line2": Address2,
                                    "city": city,
                                    "state": state,
                                    "country": country,
                                    "zipcode": zipcode,
                                    "location": location,
                                    "linkedinlink": linkedinlink,
                                    "twitterlink": twitterlink,
                                    "facebooklink": facebooklink,
                                    "instagramlink": instagramlink,
                                    "skypelink": skypelink,
                                    "youtubelink": youtubelink,
                                    "website": website
                                  };

                                  //  print(datatosend);
                                  await login(datatosend);
                                },
                                color: Color.fromRGBO(212, 241, 244, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Container(
                                  height: 55,
                                  width: 175,
                                  child: Center(
                                    child: Text(
                                      "SAVE",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: RaisedButton(
                                onPressed: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();

                                  final success = await prefs.remove('email');
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Username()));
                                },
                                color: Color.fromRGBO(255,236,232,1),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Container(
                                  height: 55,
                                  width: 100,
                                  child: Center(
                                      child: Icon(
                                          Icons.power_settings_new_rounded,color: Color.fromRGBO(254, 110, 76,1),)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                    ],
                  ),
                ))
            : Center(child: CupertinoActivityIndicator()));
  }

  dynamic profiledetails(String email) async {
    // Controller c = Get.put(Controller());
    try {
      // c.username.value=email;

      final url = Uri.parse(controller.baseurl + "profile/" + email);

      print(url.toString());
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      //  print(response.body);
      print("profileil error");
      print(response.body);

      data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        //  print("print akua");

        setState(() {
          firstname = data["first_name"] ?? " ";
          lastname = data["last_name"] ?? " ";
          company = data["company"] ?? " ";
          jobtitle = data["job_title"] ?? " ";
          Address1 = data["address_line1"] ?? " ";
          Address2 = data["address_line2"] ?? " ";
          city = data["city"] ?? " ";

          phone = data["phone"] ?? " ";
          email2 = data["email2"] ?? " ";
          phone2 = data["phone2"] ?? " ";
          state = data["state"] ?? " ";
          country = data["country"] ?? " ";
          zipcode = data["zipcode"] ?? " ";
          location = data["location"] ?? " ";

          linkedinlink = data["linkedinlink"] ?? " ";
          twitterlink = data["twitterlink"] ?? " ";
          facebooklink = data["facebooklink"] ?? " ";
          instagramlink = data["instagramlink"] ?? " ";
          skypelink = data["skypelink"] ?? " ";
          youtubelink = data["youtubelink"] ?? " ";
          website = data["website"] ?? " ";



          email = data["email"];

          check = 1;
          email = data["email"];
          //  print("response.body");
        });
        WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
              email = data["email"];
            }));

        data = jsonDecode(response.body);
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            content: const Text('Something went wrong.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Color(0xff9AC9C2)),
                ),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
    // setState(() {
    //   flag=false;
    // });
  }

  dynamic login(var datatosend) async {
    try {
      final url = Uri.parse(controller.baseurl + "edit/" + email);
      final response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(datatosend));
      print(response.statusCode);

    if(response.statusCode!=200&&!ppuploaded&&!ppuploaded2){
      c1=1;
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          content: const Text('Error saving the changes'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, ' Try again'),
              child: const Text(
                'OK',
                style: TextStyle(color: Color(0xff9AC9C2)),
              ),
            ),
          ],
        ),
      );
    }

      if (ppuploaded) {
        final imageBytes = await imageFile.readAsBytes();
        final url = controller.baseurl + "editprofilepic/" + email;
        final request = http.MultipartRequest('PUT', Uri.parse(url));
        final multipartFile = http.MultipartFile.fromBytes(
          'profile_pic',
          imageBytes,
          filename: '$email.jpg',
        );
        request.files.add(multipartFile);
        final response = await request.send();
        if (response.statusCode == 200) {
          print('Image uploaded successfully');
        } else {
          c2=1;
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              content: const Text('Error uploading the picture'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, ' Try again'),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Color(0xff9AC9C2)),
                  ),
                ),
              ],
            ),
          );
        }
      }

      if (ppuploaded2) {
        final imageBytes = fileBytes;
        final url = controller.baseurl + "editbrochure/" + email;
        final request = http.MultipartRequest('PUT', Uri.parse(url));
        final multipartFile = http.MultipartFile.fromBytes(
          'brochure_file',
          imageBytes,
          filename: fileName,
        );
        request.files.add(multipartFile);
        final response = await request.send();
        if (response.statusCode == 200) {
          print('brochure_file uploaded successfully');
        } else {
          c3=1;
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              content: const Text('Error uploading the brochure'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, ' Try again'),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Color(0xff9AC9C2)),
                  ),
                ),
              ],
            ),
          );
        }
      }
if(c1==0&&c2==0&&c3==0){

  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      content: const Text('Changes saved sucessfully'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text(
            'OK',
            style: TextStyle(color: Color(0xff9AC9C2)),
          ),
        ),
      ],
    ),
  );
}
    } catch (e) {
      print(e.toString());


    }
    // setState(() {
    //   flag=false;
    // });
  }

  Future<Uint8List> _getImageBytes(PickedFile image) async {
    final imageBytes = await image.readAsBytes();
    return Uint8List.fromList(imageBytes);
  }
}
