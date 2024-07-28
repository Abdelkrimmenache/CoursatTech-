

import 'package:corsatech_app/core/model/user_Model.dart';
import 'package:corsatech_app/core/services/Firestore_User.dart';
import 'package:corsatech_app/core/view/pages/profilePages/personalData_View.dart';
import 'package:corsatech_app/core/viewModel/auth_ViewModel.dart';
import 'package:corsatech_app/core/viewModel/auth_ViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class modifyPersonalData extends GetxController {
   
String? name , email  ; 
  // Rx<String?> name = Rx<String?>(null) ; 
  // Rx<String?> email = Rx<String?>(null) ; 
  
  
  AuthViewModel authViewModel = Get.find<AuthViewModel>() ; 

FirebaseAuth _firebaseAuth = FirebaseAuth.instance ; 

@override
  void onInit() {
    if (_firebaseAuth.currentUser != null ) {
    getUpdatedUserData() ; 
    }
    super.onInit();
  }

void updateUserData ( ) {
  UserModel userModel= UserModel(
    email: email, 
    name:  name , 
    userId: _firebaseAuth.currentUser!.uid ,  
  );

  FirestoreUser().addUserToFirestore(userModel) ; 
  authViewModel.setUser(userModel) ; 
  update();

}

getUpdatedUserData () {
  authViewModel.getCurrentUserData(_firebaseAuth.currentUser!.uid) ; 
  update() ; 
}



  
} 