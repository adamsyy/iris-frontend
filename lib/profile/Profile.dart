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

                    var width = MediaQuery.of(context).size.width;
                    var isPhone = width < 720;
                    if(isPhone){
                      var fileName = url.split("/").last;

                      // Get the temporary directory for storing the downloaded file
                      var tempDir = await getTemporaryDirectory();
                      var filePath = '${tempDir.path}/$fileName';

                      // Download the file
                      var client = HttpClient();
                      var request = await client.getUrl(Uri.parse(url));
                      var response = await request.close();
                      var bytes = await consolidateHttpClientResponseBytes(response);
                      var file = File(filePath);
                      await file.writeAsBytes(bytes);

                      // Share the file
                      Share.shareFiles([filePath]);
                    }else{
                      Share.share(url,subject: 'contact');
                    }






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
                  GestureDetector(onTap: ()async{
                    final Uri _url = Uri.parse(data['brochure_file']);
                    var response = await http.get(_url);
                    var file = File('newahne.jpg');
                    await file.writeAsBytes(response.bodyBytes);
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
SizedBox(height: 20,),
                  Text("Made with ❤️ by Iris Cards",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                ],
              ),
            )):Center(child: CupertinoActivityIndicator(),));
  }




}
