import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customTextFormFeildWidget extends StatelessWidget {
  final String title ; 
  final IconData? icon  ; 
  TextEditingController? mycontroller ; 
  void Function(String)? onChanged ; 
  String? Function(String?)? validator ; 
  
    customTextFormFeildWidget({
    super.key, required this.title, required this.icon, this.mycontroller ,  this.onChanged  , this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: mycontroller,
      textDirection:TextDirection.rtl ,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
       
        errorStyle: TextStyle(fontSize: 11 , fontFamily: "noor" , fontWeight: FontWeight.w500) ,
        hintText: title , 
        hintStyle: TextStyle(fontSize: 15 , fontFamily: "noor" , fontWeight: FontWeight.w300) ,
        alignLabelWithHint: true,  
        suffixIcon:  Icon(icon) , 
        
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Get.theme.primaryColor),
          borderRadius: BorderRadius.circular(10 , )
        )
        
        
        )  , 

        onChanged: onChanged , 
        validator: validator ,
    
    );
  }
}

