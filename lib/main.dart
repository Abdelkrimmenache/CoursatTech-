import 'dart:io';

import 'package:corsatech_app/core/view/controller_View.dart';
import 'package:corsatech_app/core/view/pages/home_View.dart';
import 'package:corsatech_app/helper/myBindings.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

// void main() {
//   runApp(DevicePreview(builder: (context)=> MyApp()));
// }

void main() async {
   WidgetsFlutterBinding.ensureInitialized() ;
  Platform.isAndroid? 
  await Firebase.initializeApp (
    options: const FirebaseOptions(
    apiKey: 'AIzaSyBSi6dn3oKp6yz5VsC-lVGls421NPqNK7k'     , //
    appId: '1:119490786267:android:d99a966d5ed5a3623a2dfe', 
    messagingSenderId: '119490786267'                     , 
    projectId: 'coursatechapp'                            , 
    storageBucket: 'coursatechapp.appspot.com'            , 
    // messagingSenderId: "604005378047",
    )
    ) 
  :await Firebase.initializeApp() ;
  runApp(DevicePreview(builder: (context)=> MyApp()));
  // runApp(const MyApp())           ;
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder ,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 61, 42, 237), 
        primaryColorLight: Color.fromARGB(255, 154, 0, 0), 
        // textTheme: TextTheme(
        //   bodySmall: TextStyle(fontSize: 20 , fontFamily: "English" , fontWeight: FontWeight.w500) , 
        //   bodyLarge: TextStyle(fontSize: 20 , fontFamily: "English" , fontWeight: FontWeight.w500 , color: Colors.white) , 
        //   bodyMedium: TextStyle(fontSize: 20 , fontFamily: "English" , fontWeight: FontWeight.w500 , color: Colors.black ) ,
          

          
        // ) , 
        fontFamily: 'almarai'
        
      ),
      initialBinding: myBindings(), 
      home: 
      Directionality(
        textDirection: TextDirection.rtl,
        child: ControllerView()) 
    );
  }
}
