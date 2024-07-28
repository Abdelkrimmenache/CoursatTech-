



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corsatech_app/core/model/user_Model.dart';

class FirestoreUser {
 
 CollectionReference _userCollectionRef = FirebaseFirestore.instance.collection("user") ; 

 Future<void> addUserToFirestore (UserModel userModel) async {
  await  _userCollectionRef.doc(userModel.userId).set(userModel.toJson()) ; 
 }

   Future<DocumentSnapshot> getCurrentUser(String uId) async {
     return await _userCollectionRef.doc(uId).get() ;  

  }

}