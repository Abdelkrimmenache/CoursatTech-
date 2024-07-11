import 'package:corsatech_app/core/view/UI_components/myCostomMaterialButtonWidget.dart';
import 'package:corsatech_app/core/view/auth/login_Screen.dart';
import 'package:corsatech_app/core/view/pages/profileView.dart';
import 'package:corsatech_app/core/viewModel/auth_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class personalScreen extends StatelessWidget {
   personalScreen({super.key});
  var mycontroller = Get.put(authViewModel()) ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 

      Obx(() {
        return (mycontroller.user != null ) ? 
        profileView()
        :  Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300, 
              child: SvgPicture.asset("Assets/images/sign_in.svg" )) , 
            cutomMaterialButtonWidget(title: "تسجيل الدخول", onPressed: () {
              Get.to(()=> loginScreen() ) ; 
            },) , 
          ],
        ),
      ) ; 

      })
    
     
    );
  }
}
