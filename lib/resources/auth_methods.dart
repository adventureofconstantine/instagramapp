import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/material.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'package:instagramapp/resources/storage_methods.dart';
import'package:instagramapp/screens/signup_screen.dart';
import'package:instagramapp/utils/utils.dart';

class AuthMethods{
  final FirebaseAuth _auth= FirebaseAuth.instance;  //creating the instance for FirebaseAuth
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
 Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file ,
  })async{
   String res="Some error occured";
   try{
     if(email.isNotEmpty||password.isNotEmpty||username.isNotEmpty||bio.isNotEmpty||file!=null){
       //register user
       UserCredential cred=await _auth.createUserWithEmailAndPassword(email: email, password: password);

       print(cred.user!.uid);

      String photoUrl =await  StorageMethods().uploadImageToStorage('profilePics',file, false);



       //add user to our database
      await _firestore.collection("users").doc(cred.user!.uid).set({
         "username":username,
         "uid":cred.user!.uid,
         "email":email,
         "bio":bio,
         "followers":[],
         "following":[],
         "photoUrl":photoUrl,
       });
      // await _firestore.collection("users").add({
        // "username":username,
        // "uid":cred.user!.uid,
        // "email":email,
        // "bio":bio,
        // "followers":[],
         //"following":[],
       //  });
       res="success";
     }
   }catch(err){
     res=err.toString();
   }
   return res;
 }
}
