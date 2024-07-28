

import 'package:corsatech_app/core/model/user_Model.dart';
import 'package:corsatech_app/core/view/UI_components/customButton_Widget.dart';
import 'package:corsatech_app/core/view/pages/profilePages/modify_personalData_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class personalData extends StatelessWidget {

  UserModel? userModel ;
   personalData({super.key , this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("personal Data"), 

      ),
      body: 
  
       Container(
            margin: EdgeInsets.symmetric(vertical: 20 , horizontal: 20 ),
            padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10 ),
            decoration: BoxDecoration(
              border: Border.all(color: Get.theme.primaryColor ), 
              borderRadius: BorderRadius.circular(10) , 
            ),
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                    Center(
                      child: Container(
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
                    ),
                    SizedBox(height: 20 ,) ,
                    Divider( ) ,
                    SizedBox(height: 15 ,) ,  
                    Column(
                      children: [
                      Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5 ),
                          color: Get.theme.primaryColor ,
                          child: Icon(Icons.person , color: Colors.white,)) , 
                        SizedBox(width: 20 ,) , 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                          children: [
                            Text("name") , 
                            Text("${userModel!.name}") , 
                             SizedBox(height: 20 ,) ,  
                          ],
                        )
                      ],
                    ) , 
          
                     Divider() , 
                     SizedBox(height: 20 ,) ,  
                      Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 5 ),
                          color: Get.theme.primaryColor ,
                          child: Icon(Icons.email , color: Colors.white,)) , 
                        SizedBox(width: 20 ,) , 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                          children: [
                            Text("email") , 
                            Text("${userModel!.email}") , 
                             SizedBox(height: 20 ,) ,  
                          ],
                        )
                      ],
                    ) 
                      ],
                    ) , 
                    SizedBox(height: 20 ,) , 
          
                    cutomButton_widget(
                      title: "modification", 
                      onPressed: () {
                        Get.to(()=> modifyData(userModel: userModel,)) ; 
                       },
                      
                      )
              
                     
                  
                ],
              ),
            ),
          )
        
    );
  }
}

