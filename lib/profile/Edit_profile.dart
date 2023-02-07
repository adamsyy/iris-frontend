import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_card/auth/screens/Username.dart';
import 'package:nfc_card/constants.dart';
import 'package:nfc_card/profile/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';


int check=0;

String tester = "test";

String firstname = "k9";
String lastname = "k9";
String company = "k9";
String jobtitle = "k9";
String Address1 = "k9";
String Address2 = "null";
String city = "k9";
String email = "adamrubiks@gmail.com";
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
String website="null";

String about = "k9";
late String brochure_file = "null";

late String pp = "null";
late String cf = "null";

class Edit_profile extends StatefulWidget {

  static const String route = '/edit';
  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  @override


  void checkLogin() async {
    // Here we check if user already logged in or not
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? emailval = await pref.getString("email");




    if (emailval != null) {
      setState(() {
      email=emailval;

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
    profiledetails("EHEH");

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
        body:check==1? Container(
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
                  Container(
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "First Name*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Last Name*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Company*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Job Title*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            onChanged: (String s) {
                              Address1 = s;
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
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Address Line*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            onChanged: (String s) {
                              Address2 = s;
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
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Address Line2",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "City*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "State*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Country*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Pincode*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Mobile Number*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Alternate Mobile Number",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child:Container(height: 30,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                color: Color.fromRGBO(125, 143, 171, 1),
                                style: BorderStyle.none,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                email,
                                style: TextStyle(
                                  color: Color.fromRGBO(125, 143, 171, 1),
                                ),
                              ),
                            ),
                          )


                        ),
                        SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Alternative Email ID",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Linkedin",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),

                        SizedBox(height: 10),
                        //textfield for name with border radius
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Twitter",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),

                        SizedBox(height: 10),
                        //textfield for name with border radius
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Facebook",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),

                        SizedBox(height: 10),
                        //textfield for name with border radius
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Instagram",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),

                        SizedBox(height: 10),
                        //textfield for name with border radius
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Skype",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),

                        //textfield for name with border radius

                        SizedBox(height: 10),
                        //textfield for name with border radius
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
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
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Youtube",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),

                        SizedBox(height: 10),
                        //textfield for name with border radius
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
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
                                    color: Color.fromRGBO(125, 143, 171, 1)),
                                hintText: "Any other social links",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "  Upload Profile Picture",
                                  style: TextStyle(
                                      color: Color.fromRGBO(125, 143, 171, 1)),
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

                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 248, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "  Upload Brochure",
                                  style: TextStyle(
                                      color: Color.fromRGBO(125, 143, 171, 1)),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 18),
                      child: RaisedButton(
                        onPressed: () async{

                            var datatosend = {
                              "first_name": firstname,
                              "last_name": lastname,
                              "company": company,
                              "job_title": jobtitle,
                              "email": "adamrubiks@gmail.com",
                              "email2": email2,
                              "phone": phone,
                              "phone2": phone2,
                              "profile_pic": null,
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
                              "brochure_file": null,
                              "about": " "
                            };

                          //  print(datatosend);
                           await login(datatosend);

                        },
                        color: Color.fromRGBO(212, 241, 244, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                ],
              ),
            )):Center(child: CupertinoActivityIndicator())


    );
  }

  dynamic profiledetails(String email) async {
    // Controller c = Get.put(Controller());
    try{
      // c.username.value=email;

       final url = Uri.parse("http://127.0.0.1:8081/profile/adamrubiks@gmail.com");
    //  final url = Uri.parse("http://10.0.2.2:8081/profile/adamrubiks@gmail.com");


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

data=jsonDecode(response.body);






      if(response.statusCode == 200){
        //  print("print akua");


        setState(() {


          firstname = data["first_name"]??" ";
          lastname =  data["last_name"]??" ";
          company = data["country"]??" ";
          jobtitle =  data["job_title"]??" ";
          Address1 =  data["address_line1"]??" ";
          Address2 =  data["address_line2"]??" ";
          city =  data["city"]??" ";

          phone =  data["phone"]??" ";
          email2 = data["email2"]??" ";
          phone2 =  data["phone2"]??" ";
          state = data["state"]??" ";
          country =  data["first_name"]??" ";
          zipcode =  data["zipcode"]??" ";
          location =  data["location"]??" ";

          linkedinlink =  data["linkedinlink"]??" ";
          twitterlink = data["twitterlink"]??" ";
          facebooklink =  data["facebooklink"]??" ";
          instagramlink = data["instagramlink"]??" ";
          skypelink =  data["skypelink"]??" ";
          youtubelink = data["youtubelink"]??" ";
          website=data["website"]??" ";

          about =  data["about"]??" ";

          pp =  data["profile_pic"]??" ";


          email =  data["email"];

          check=1;
          email=data["email"];
          //  print("response.body");
        });
        WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {email=data["email"];}));

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



  dynamic login(var datatosend) async {
    // Controller c = Get.put(Controller());
    try {
      // c.username.value=email;

      final url = Uri.parse("http://127.0.0.1:8081/edit/adamrubiks@gmail.com");

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',

        },
        body: jsonEncode(datatosend),
      );

      print("thaze  error");
      print(response.body);
      print(response.statusCode);
      // if(response.statusCode == 202){
      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Profile()));
      // }else {
      //   showDialog<String>(
      //     context: context,
      //     builder: (BuildContext context) => AlertDialog(
      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      //       title: const Text('Incorrect credentials'),
      //       content: const Text('The credentials you entered is incorrect. Please try again.'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () => Navigator.pop(context, 'OK'),
      //           child: const Text('OK', style: TextStyle(color: Color(0xff9AC9C2)),),
      //         ),
      //       ],
      //     ),
      //   );
      // }
    } catch (e) {
      print(e.toString());
    }
    // setState(() {
    //   flag=false;
    // });
  }
}
