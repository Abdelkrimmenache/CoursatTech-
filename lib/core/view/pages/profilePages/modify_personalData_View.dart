
import 'package:corsatech_app/core/model/user_Model.dart';
import 'package:corsatech_app/core/view/UI_components/CustomTextFormFeild_Widget.dart';
import 'package:corsatech_app/core/view/controller_View.dart';
import 'package:corsatech_app/core/viewModel/modify_psersonalData_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class modifyData extends StatelessWidget {
   
   TextEditingController nameController = TextEditingController() ;
   TextEditingController emailController = TextEditingController() ;

  UserModel? userModel ; 
  
  modifyData({super.key , this.userModel} );
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<modifyPersonalData>(
     init: Get.put(modifyPersonalData()),
      builder: (controller) {
        
        
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
            
                 
                         SizedBox(height: 20 ,) ,  
                         customTextFormFeildWidget(
                          title: "name", 
                          icon: Icons.person , 
                          mycontroller: nameController ,
                          onChanged: (value) {
                            controller.name = value ;
                          },
                          ) , 
                         Divider() , 
                         SizedBox(height: 20 ,) ,  
                         customTextFormFeildWidget(
                          title: "name", 
                          icon: Icons.email , 
                          mycontroller: emailController ,
                           onChanged: (value) {
                            controller.email = value ;
                          },
                          ) , 
                          ],
                        ) , 
                        SizedBox(height: 20 ,) , 
            
                        MaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10) , 
                          ),
                          color: Get.theme.primaryColor,
                          onPressed: () {
                            controller.updateUserData() ; 
                            Get.offAll(() => ControllerView()) ;
            
                          } , 
                          child: Text("modification" , style: TextStyle(color: Colors.white , ),),
                          )
                  
                         
                      
                    ],
                  ),
                ),
              ) 
            );
          }
        
      
    );
  }
}