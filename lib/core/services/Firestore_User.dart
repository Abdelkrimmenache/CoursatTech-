



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corsatech_app/core/model/user_Model.dart';

class FirestoreUser {
 
 CollectionReference _userCollectionReference = FirebaseFirestore.instance.collection("User") ;

  Future<void> addUserToFirestore(UserModel userModel)async {
  await _userCollectionReference.doc(userModel.userId).set(userModel.toJson()) ;
 }

 Future<DocumentSnapshot> getCurrentUser (String uid) async {
  return await _userCollectionReference.doc(uid).get() ; 
 }

}