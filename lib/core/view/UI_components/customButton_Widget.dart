
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class cutomButton_widget extends StatelessWidget {
  void Function()? onPressed ; 
  final String title ; 
   cutomButton_widget({
    super.key, this.onPressed  ,required this.title 
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10) , 
      ),
      color: Get.theme.primaryColor,
      onPressed: onPressed , 
      child: Text(title , style: TextStyle(color: Colors.white , ),),
      );
  }
}