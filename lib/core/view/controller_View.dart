

import 'package:corsatech_app/core/view/auth/login_Screen.dart';
import 'package:corsatech_app/core/view/pages/home_View.dart';
import 'package:corsatech_app/core/view/pages/personal_Screen.dart';
import 'package:corsatech_app/core/viewModel/auth_ViewModel.dart';
import 'package:corsatech_app/core/viewModel/controller_View_Model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ControllerView extends StatelessWidget{


   ControllerView({super.key});
   
   var controller = Get.put(controllerViewModel())  ; 
   var mycontroller = Get.put(AuthViewModel()) ; 
  

  @override
  Widget build(BuildContext context) {
    return 
      //  Obx(() {
      //   return (mycontroller.user == null) ? loginScreen() :
          GetBuilder(
         init: controller ,
         builder: (controller) {

         
         return Scaffold(
               
         body: controller.currentScreen ,
      
         bottomNavigationBar: bottomNavigationBar() ,
               
               ); }
       );

      //  } ) ;
     
    
  }
  
  Widget bottomNavigationBar() {
    
    return CurvedNavigationBar(
    
    backgroundColor: Colors.transparent,
    buttonBackgroundColor:  Get.theme.primaryColor  ,
    color: Get.theme.primaryColor ,
    index: controller.nvaigatorValue ,
    
    // animationDuration: Duration(milliseconds: 300),
    items: <Widget>[
    Icon(Icons.person, color: Colors.white, size: 26) , 
    Icon(FontAwesomeIcons.road, color: Color.fromARGB(255, 255, 255, 255), size: 26), 
    Icon(Icons.home, color: Colors.white, size: 26)  , 
    Icon(FontAwesomeIcons.userGraduate, color: Colors.white, size: 26), 
    Icon(Icons.favorite_outlined, color: Colors.white, size: 26), 
  
    ],
    
    onTap: (index) {
      controller.changeSelctedValue(index) ; 
      }
  );
  
  

  }
}