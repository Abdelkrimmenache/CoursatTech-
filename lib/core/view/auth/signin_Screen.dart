
import 'package:corsatech_app/core/view/UI_components/CustomTextFormFeild_Widget.dart';
import 'package:corsatech_app/core/view/UI_components/myCostomMaterialButtonWidget.dart';
import 'package:corsatech_app/core/view/controller_View.dart';
import 'package:corsatech_app/core/view/pages/home_View.dart';
import 'package:corsatech_app/core/viewModel/auth_ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class signinScreen extends StatelessWidget {



  TextEditingController fullName = TextEditingController() ; 
  TextEditingController email = TextEditingController() ; 
  TextEditingController password = TextEditingController() ; 
  GlobalKey<FormState> _formstate = GlobalKey<FormState>() ; 

  signinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white ,
        shadowColor: Colors.transparent ,
        
      ),
      body: 
       GetBuilder<authViewModel>(
          init: authViewModel() , 
          builder: (controller) => 
           Form(
             key: _formstate ,
             child: SingleChildScrollView(
             child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30 ,vertical: 30 ),
              // alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    child: SvgPicture.asset("Assets/images/login.svg")) , 
                    SizedBox(height: 30 ,) , 
                    Container(
                    alignment: Alignment.center,
                    child:
                     Text("انشاء حساب" , style: TextStyle(fontFamily: "noor" , fontSize: 30 , fontWeight: FontWeight.bold),)),  
                     SizedBox(height: 30 ,) ,  
                    Text("الاسم الكامل" , style: TextStyle(fontSize: 15 , fontFamily: "noor" , fontWeight: FontWeight.w500))  ,
                    SizedBox(height: 10 ,) , 
                    customTextFormFeildWidget(title: "الاسم الكامل" , icon: Icons.email_outlined,
                    mycontroller: fullName ,
                     onChanged: (Value) {
                      controller.name = Value ; 
                     },
                     validator: (val) {
                       if (val!.length < 5 ) {
                        return "على الاقل 5 احرف"  ; 
                       } 
                     },
                    
                    )  , 
                    SizedBox(height: 20 ,) ,
                      
                      
                    Text("البريد الالكتروني" , style: TextStyle(fontSize: 15 , fontFamily: "noor" , fontWeight: FontWeight.w500))  ,
                    SizedBox(height: 10 ,) , 
                    customTextFormFeildWidget(title: "البريد الالكتروني", icon: Icons.email_outlined,
                     mycontroller: email ,
                      onChanged: (Value) {
                        controller.email = Value ; 
                      },
                       validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل البريد الالكتروني';
                          }
                          // Regular expression for validating an email
                          String pattern =
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'ادخل بريد الكتروني صالح';
                          }
                          return null;
                        },
                    )  , 
                    SizedBox(height: 20 ,) , 
                    Text("كلمة السر", style: TextStyle(fontSize: 15 , fontFamily: "noor" , fontWeight: FontWeight.w500))  ,
                    SizedBox(height: 10 ,) , 
                    customTextFormFeildWidget(title: "كلمة السر" ,   icon: Icons.lock_outlined,
                     mycontroller: password ,
                      onChanged: (Value) {
                        controller.password = Value ; 
                      },
                       validator: (val) {
                       if (val!.length < 6 ) {
                        return "على الاقل 6 احرف"  ; 
                       } 
                     },
                    
                    ) , 
                    SizedBox(height: 10 ,) , 
                    
                    SizedBox(height: 20 ,) , 

                     controller.isLoading ? 

                     MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      minWidth: double.infinity ,
                      padding: EdgeInsets.symmetric(vertical: 10 ),
                      color: Get.theme.primaryColor,
                      onPressed: (){}, 
                    child: CircularProgressIndicator(color: Colors.white,) 
                    ) : 


                    cutomMaterialButtonWidget(title: "انشاء حساب", onPressed: () {
                    _formstate.currentState!.save() ; 
                    if(_formstate.currentState!.validate() ) {
                      controller.createUserWithEmailAndPassword(); 
                    }
                    }) , 
                    SizedBox(height: 30 ,) , 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            
                          },
                          child: Text("سجل الدخول" , style : TextStyle(fontSize: 20 , fontFamily: "noor" , fontWeight: FontWeight.bold ,color: Get.theme.primaryColor, ) ,)) , 
                        Text("لديك حساب؟" , style:  TextStyle(fontSize: 20 , fontFamily: "noor" , fontWeight: FontWeight.w300) ,)  
                      ],
                    )
                    
                ],
              ),
                   ),
                      ),
           ),
       )
    );
  }
}


