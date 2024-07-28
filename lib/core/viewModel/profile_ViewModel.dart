
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corsatech_app/core/model/user_Model.dart';
import 'package:corsatech_app/core/services/Firestore_User.dart';
import 'package:corsatech_app/helper/localStorgeData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class profileViewModel extends GetxController {

  @override
  void onInit() {
    getUserModel()   ; 
    super.onInit();
  }

  LocalStorgageData localStorgageData = Get.find<LocalStorgageData>(); 
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;  

  UserModel? get userModel => _userModel ; 
  UserModel? _userModel ; 
  
    void signOut () async {
      await _firebaseAuth.signOut() ;  
      localStorgageData.deleteUser()  ;     
    }

   

   void getUserModel () async {
     await localStorgageData.getUser.then((value) {
      _userModel = value ;   

     }) ;
     update() ; 
      
    }










    }