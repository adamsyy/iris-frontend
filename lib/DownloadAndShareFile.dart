// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:nfc_card/auth/screens/Username.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class DownloadAndShareFile extends StatefulWidget {
//   late String url;
//     String fileName = "contact.vcf";
//     late String email;
//   DownloadAndShareFile({required this.url,required this.email,required this.fileName});
//
//
//   @override
//   _DownloadAndShareFileState createState() => _DownloadAndShareFileState();
// }
//
// class _DownloadAndShareFileState extends State<DownloadAndShareFile> {
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Download and Share File"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () => _downloadAndShareFile(),
//           child: Text("Download and Share File"),
//         ),
//       ),
//     );
//   }
//
//   downloadAndShareFile() async {
//     final response = await HttpRequest.request(widget.url, responseType: "blob");
//     final blob = Blob([response.response]);
//     final url = Url.createObjectUrlFromBlob(blob);
//     final anchor = AnchorElement(href: url)
//       ..setAttribute("download", widget.fileName)
//       ..click();
//     Url.revokeObjectUrl(url);
//
//     final uri = Uri.parse(url);
//     if (await canLaunch(uri.toString())) {
//       await launch(uri.toString());
//     } else {
//       throw 'Could not launch $uri';
//     }
//   }
// }
