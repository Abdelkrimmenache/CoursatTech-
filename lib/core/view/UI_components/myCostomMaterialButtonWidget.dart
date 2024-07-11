


import 'package:corsatech_app/core/view/auth/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class cutomMaterialButtonWidget extends StatelessWidget {
  final String title ; 
   void Function()? onPressed ; 
   cutomMaterialButtonWidget({
    super.key, required this.title,
    required this.onPressed 
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      minWidth: double.infinity ,
      padding: EdgeInsets.symmetric(vertical: 10 ),
      color: Get.theme.primaryColor,
      onPressed: onPressed , 
    child: Text(title , style: TextStyle(fontFamily: "noor" , color: Colors.white , fontSize: 20 )) ,
    );
  }
}