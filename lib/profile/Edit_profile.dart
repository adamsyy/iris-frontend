import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_card/constants.dart';

String tester = "test";

class Edit_profile extends StatefulWidget {
  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
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
                          tester,
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
                                hintText: "Email ID*",
                                fillColor: Color.fromRGBO(248, 248, 248, 1)),
                          ),
                        ),
                        SizedBox(height: 10),

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
                                hintText: "Snapchat",
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
                          padding: const EdgeInsets.only(left: 10,right: 10),
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
                          padding: const EdgeInsets.only(left: 10,right: 10),
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
                  SizedBox(height: 23,),
                  Align( alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/18 ),
                      child: RaisedButton(
                        onPressed: () {},
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
            )));
  }
}
