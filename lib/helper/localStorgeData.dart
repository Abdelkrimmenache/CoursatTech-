
import 'dart:convert';

import 'package:corsatech_app/core/model/user_Model.dart';
import 'package:corsatech_app/helper/constance.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorgageData extends GetxController {

  
 Future<UserModel?> get  getUserData async  {
   try { 
   UserModel userModel = await  _getUserData() ; 
   if(userModel == null ) {
    return  null ; 
   }  
   return userModel ; 

   }catch (e) {
    print(e.toString()) ; 
   }
 }

_getUserData() async {

 SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ; 
 var value =  sharedPreferences.getString(CACHED_USER_DATA) ; 
 return UserModel.fromJson(json.decode(value!)) ; 


}

setUserData (UserModel userModel) async {
 SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;      
 sharedPreferences.setString(CACHED_USER_DATA, json.encode(
   UserModel( 
   email: userModel.email!   ,
   name: userModel.name!     , 
   userId: userModel.userId! , 
   ).toJson() 
 )) ; 
}




}