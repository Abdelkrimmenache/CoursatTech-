
import 'package:corsatech_app/core/model/user_Model.dart';
import 'package:corsatech_app/core/model/user_Model.dart';
import 'package:corsatech_app/helper/localStorgeData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class profileViewModel extends GetxController {

  @override
  void onInit() {
    print("###########################################${_userModel.toString()}") ; 
    super.onInit();
    getUserModel() ; 
  }

 LocalStorgageData localStorgageData = Get.find<LocalStorgageData>() ; 
 UserModel get userModel => _userModel! ;  
 UserModel? _userModel  ;

   void getUserModel () async {
   await localStorgageData.getUserData.then((value) {
      _userModel = value ; 
    }) ; 
  
    update() ; 
 }


 void signOut () async {
  await FirebaseAuth.instance.signOut(); 
 }




}