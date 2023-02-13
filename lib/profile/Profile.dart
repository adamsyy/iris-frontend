import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nfc_card/auth/screens/Username.dart';
import 'package:nfc_card/constants.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';


int check=0;
late var data;

class Profile extends StatefulWidget {
   late String id;
  Profile({required this.id});




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
      var url;
    if(widget.id.contains("@")){
       url = Uri.parse(controller.baseurl+"profile/"+widget.id);
    }else{
       url = Uri.parse(controller.baseurl+"profile/"+widget.id+'@gmail.com');
    }


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
var url;
      if(widget.id.contains("@")){
        url = Uri.parse(controller.baseurl+"contact/"+widget.id);
        await launchUrl(url);
      }else{
        url = Uri.parse(controller.baseurl+"contact/"+widget.id+'@gmail.com');
        await launchUrl(url);
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

    print("gonna orint oke");
    print(widget.id.toString());

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
                        image:data["profile_pic"]!=null ?NetworkImage(data["profile_pic"]):NetworkImage("https://i.ibb.co/jr8RFT5/default-profile-pic.png"),
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
                  GestureDetector(onTap: ()async{
                    // try{
                    //   var url;
                    //   if(widget.id.contains("@")){
                    //     url = Uri.parse(controller.baseurl+"contact/"+widget.id);
                    //     Share.share(url.toString(),subject: 'Contact');
                    //   }else{
                    //     url = Uri.parse(controller.baseurl+"contact/"+widget.id+'@gmail.com');
                    //     Share.share(url.toString(),subject: 'Contact');
                    //   }
                    //
                    //
                    //
                    // }catch(e){
                    //   print(e.toString());
                    // }

                    var url;
                    if(widget.id.contains("@")){
                      url = controller.baseurl+"contact/"+widget.id;

                    }else{
                      url = controller.baseurl+"contact/"+widget.id+'@gmail.com';

                    }

                  //  await Clipboard.setData(ClipboardData(text: "MATHEW SCENE THANE"));

                    Clipboard.setData(new ClipboardData(text: 'http://localhost:59858/'+data['email'])).then((_){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Copied to your clipboard !')));
                    });





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
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 56,
                    width: 343,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.phone, color: Colors.blue),

                          Expanded(
                            child: Container(
                              child: Text(
                                data["phone"],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.email, color: Colors.red),

                          Expanded(
                            child: Container(
                              child: Text(
                                data["email"],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.person, color: Colors.black),

                          Expanded(
                            child: Container(
                              child: Text(
                                data["job_title"],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 100,
                      width: 343,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.map_outlined, color: Colors.green),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),



                  GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["location"]);
                    await launchUrl(_url);
                  },
                    child:     Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(FontAwesomeIcons.locationArrow, color: Colors.blue),

                              Expanded(
                                child: Container(
                                  child: Text(
                                    'maps.google.com',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),


                 data["website"].length!=0? GestureDetector(onTap: ()async{
                   final Uri _url = Uri.parse(data["website"]);
                   await launchUrl(_url);
                 },
                   child: Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: Container(
                       height: 56,
                       width: 343,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(8),
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 22),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Icon(FontAwesomeIcons.portrait, color: Colors.black),

                             Expanded(
                               child: Container(
                                 child: Text(
                                   'Website',
                                   style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 18,
                                     fontWeight: FontWeight.w400,
                                   ),
                                   textAlign: TextAlign.center,
                                 ),
                               ),
                             ),
                             SizedBox(width: 10),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ):SizedBox( height:0),


                  data["facebooklink"].length!=0?  GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["facebooklink"]);
                    await launchUrl(_url);
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(FontAwesomeIcons.facebook, color: Colors.blue),

                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Facebook',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ):SizedBox(height: 0,),


                  data["twitterlink"].length!=0? GestureDetector(
                    onTap: ()async{
                      final Uri _url = Uri.parse(data["twitterlink"]);
                      await launchUrl(_url);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(FontAwesomeIcons.twitter),

                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Twitter',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ):SizedBox(height: -20,),


                  data["instagramlink"].length!=0?GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["instagramlink"]);
                    await launchUrl(_url);
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(FontAwesomeIcons.instagram),

                              Expanded(
                                child: Container(
                                  child: Text(
                                    'instagram',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ):SizedBox(height:0),


                  data["skypelink"]!=null?  GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["skypelink"]);
                    await launchUrl(_url);
                  },
                    child:Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(FontAwesomeIcons.skype,color: Colors.blue,),

                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Skype',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ):SizedBox(height: 0,),


                  data["youtubelink"].length!=0?   GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data["youtubelink"]);
                    await launchUrl(_url);
                  },
                    child:Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 56,
                        width: 343,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(FontAwesomeIcons.youtube,color: Colors.red,),

                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Youtube',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ):SizedBox(height: 1,),



                  GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data['brochure_file']);
                    try{
                      var url;
                      if(widget.id.contains("@")){
                        url = Uri.parse(controller.baseurl+"download-brochure/"+widget.id);
                        await launchUrl(url);
                      }else{
                        url = Uri.parse(controller.baseurl+"download-brochure/"+widget.id+'@gmail.com');
                        await launchUrl(url);
                      }



                    }catch(e){
                      print(e.toString());
                    }
                  },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
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
                    ),
                  ),
SizedBox(height: 20,),
                  Text("Made with ❤️ by Iris Cards",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
            )):Center(child: CupertinoActivityIndicator(),));
  }




}
