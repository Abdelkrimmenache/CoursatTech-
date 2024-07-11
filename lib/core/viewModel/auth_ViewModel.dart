
import 'package:corsatech_app/core/model/user_Model.dart';
import 'package:corsatech_app/core/services/Firestore_User.dart';
import 'package:corsatech_app/core/view/auth/login_Screen.dart';
import 'package:corsatech_app/core/view/controller_View.dart';
import 'package:corsatech_app/helper/localStorgeData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class authViewModel extends GetxController {

    LocalStorgageData localStorageData = Get.put(LocalStorgageData()) ;

  String? email , password  , name  ;  
   get user => _user.value?.email   ; 
  Rx<User?> _user = Rx<User?>(null) ; 
  bool get isLoading => _isLoading  ; 
  bool _isLoading  = false ; 

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;  



   void onInit() {
     print(_firebaseAuth.currentUser) ; 
     if (_firebaseAuth.currentUser != null) {
      getCurrentUserData(_firebaseAuth.currentUser!.uid) ; 
     }
     _user.bindStream(_firebaseAuth.userChanges()) ; 
    super.onInit() ;
    
  }

 
  Future<void> signInWithEmailAndPassword () async {
    try {
   _isLoading = true ;    
   update() ; 
  final credential = await _firebaseAuth.signInWithEmailAndPassword(
    email: email!,
    password: password! 
  ).then((value) {
    // getCurrentUserData(value.user!.uid) ; 
  });
   _isLoading = false ;  
   update() ; 
  Get.offAll(()=> ControllerView()) ;
} on FirebaseAuthException catch (e) {
  _isLoading = false ;  
  update() ; 
  if (e.code == 'user-not-found' || e.code == 'wrong-password' ) {
    Get.snackbar(
    "قم بالتاكد من صحة البريد الالكتروني او كلمة السر",
     e.message! , 
    snackPosition: SnackPosition.BOTTOM 
     ) ;


  } else  {
       Get.snackbar(
    "حدث خطأ اثناء تسجيل الدخول",
     e.message! , 
    snackPosition: SnackPosition.BOTTOM 
     ) ;

  }
}

  }


  Future<void> createUserWithEmailAndPassword() async {
    try {
      _isLoading = true ;  
      update() ;
  final credential = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email!,
    password: password!,

  ).then((value) async {
  await saveUser(value) ;     
  } ) ;
  _isLoading = false ;  
   update() ; 
  // _firebaseAuth.currentUser!.sendEmailVerification() ; 
   await FirebaseAuth.instance.signOut(); 
  Get.snackbar("رسالة تحقق", "تم ارسال رسالة تحقق من البريد على بريدك الالكتورني" , duration: Duration(seconds: 4) ) ;
  Get.to(() => loginScreen()) ; 
} on FirebaseAuthException catch (e) {
   _isLoading = false ;  
  update() ; 
  Get.snackbar(
    "مشكل اثناء انشاء الحساب",
     e.message! , 
    snackPosition: SnackPosition.BOTTOM 
     ) ;
} catch (e) {
  print(e);
}
  }


 

  Future<void> sendPasswordResetEmail() async {
    await FirebaseAuth.instance
    .sendPasswordResetEmail(email: email!);
    Get.snackbar("اعادة تعيين كلمة السر", "تم ارسال رسالة اعادة تعيين كلمة السر على البريد الالكتروني" , duration: Duration(seconds: 4) ) ;

  }


  saveUser (UserCredential value) {
    UserModel userModel = UserModel(
      email: value.user!.email,
      userId: value.user!.uid , 
      name: name ,    
    ) ; 
    FirestoreUser().addUserToFirestore(userModel) ; 
    setuser(userModel) ; 

  }

  setuser (UserModel userModel) async {
   await localStorageData.setUserData(userModel) ;
  }


    void getCurrentUserData(String uid) async {
      await FirestoreUser().getCurrentUser(uid).then((value) {
        if (value.exists && value.data() != null) {
          setuser(UserModel.fromJson(value.data() as Map<String, dynamic>));
        } else {
          // Handle the case when data is null or the document doesn't exist
          print("User data is null or document does not exist");
        }
      });
    }





}