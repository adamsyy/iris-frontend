import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_card/auth/screens/Login.dart';
import 'package:nfc_card/constants.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: gradient1),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            )),
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

                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Align(alignment: Alignment.centerLeft,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
                    ),
                  ),
                ),


                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                Center(
                  child: Text(
                    "Enter your 4-digit code",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width /6, right:MediaQuery.of(context).size.width /6),
                    child: Container(width: 250,
                      child: PinCodeTextField(
                        autoFocus: true, keyboardType: TextInputType.number,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          inactiveColor: Colors.white,
                          disabledColor: Colors.white,
                          selectedColor: Colors.white,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                        ),
                        animationDuration: Duration(milliseconds: 300),

                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        // controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            // currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                        appContext: context,
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 20),
                //   child: Text(
                //     "P.S: Check spam folder if you can’t find the OTP in the mailbox",
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 13,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Resend Code",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    GestureDetector(onTap:
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons.arrow_forward_ios,
                            color: Colors.black, size: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
