


import 'package:corsatech_app/core/view/UI_components/courseInfoCard_Widget.dart';
import 'package:corsatech_app/core/view/UI_components/cutomProfile_widget.dart';
import 'package:corsatech_app/core/view/pages/profilePages/personalData_View.dart';
import 'package:corsatech_app/core/viewModel/profile_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class profileView extends StatelessWidget {

  

  const profileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
   return GetBuilder(
     init: Get.find<profileViewModel>(),
     builder: (controller) {
      
       return Scaffold(
        backgroundColor: Get.theme.primaryColor ,
        appBar: 
        AppBar(
           backgroundColor: Get.theme.primaryColor , 
          title: Center(child: Text("profile"  , style: TextStyle(fontSize: 20 , color: Colors.white),) ) ,
        ),
       
        body: 
        Padding(

          padding: EdgeInsets.symmetric(horizontal: 20 ) , 
          child: SingleChildScrollView(
            child: 
            Column(
              
              children : [
                Container(
                  alignment: Alignment.center,
                  child: Column(
              
                    children: [
                      Container(
                        height: 130, 
                        width: 130,
                        decoration:  BoxDecoration(
                            boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 3), // Offset in the x and y direction

                            )
                          ],
                          borderRadius: BorderRadius.circular(100) , 
                     
                          image: DecorationImage(image: AssetImage("Assets/images/profilePicture.png"))
                        ),
                      ),
                      SizedBox(height: 15,) , 
                      // Text("${controller.userModel!.name}" , style: TextStyle(color: Colors.white , fontSize: 25 ,fontWeight: FontWeight.bold ), ) , 
                      SizedBox(height: 50,) ,
                      
                      customProfileCard(
                        title: "personal Data", 
                        icon: Icon(Icons.person), 
                        onTap: () {
                          Get.to(() => personalData(userModel: controller.userModel,)) ; 
                        },
                        ) ,
                      SizedBox(height: 20,) ,  
                      customProfileCard(
                        title: "about the app" , 
                        icon: Icon(Icons.info) , 
                        onTap: () {

                        },
                        ) , 
                      SizedBox(height: 20,) ,  
                      customProfileCard(
                        title: "contact information" , 
                        icon: Icon(Icons.phone) , 
                        onTap: () {

                        },
                        ) ,
                      SizedBox(height: 20,) ,  
                      customProfileCard(
                        title: "sign out" , 
                        icon: Icon(Icons.exit_to_app) , 
                        onTap: () {
                          controller.signOut() ; 
                        },
                        
                        ) , 
                  
          
          
                 
                       
                 
                    
          
                     
                     
                 
                    ],
                  ),
                )
                 
                 
              ]
            ),
          ),
        ),
       );
     }
   ) ; 
  }
}
