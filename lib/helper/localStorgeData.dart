
import 'dart:convert';

import 'package:corsatech_app/core/model/user_Model.dart';
import 'package:corsatech_app/helper/constance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorgageData extends GetxController {

   

  Future<UserModel?> get getUser async {
    try {
    UserModel userModel = await _getUserData() ; 
    if(userModel == null ) {
     return null ; 
    }
    return userModel ; 
    }catch(e) {
    print(e.toString()) ; 
    }
  
  }

  _getUserData () async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance() ; 
  var value =  sharedPrefs.getString(CACHED_USER_DATA) ; 
  return UserModel.fromJson(json.decode(value!)) ;
   
 }

 setUser (UserModel userModel) async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance() ;
  sharedPrefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson())) ;

 }

 deleteUser () async {
      SharedPreferences sharedPrefs = await SharedPreferences.getInstance() ; 
      await sharedPrefs.clear() ; 

 }
}
