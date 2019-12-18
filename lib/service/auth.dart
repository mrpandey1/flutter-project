import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_applatest/modals/user.dart';
import 'package:flutter_applatest/service/database.dart';

class AuthService
{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user !=null? User(uid:user.uid):null;
  }
  Stream<User> get user{
    return  _auth.onAuthStateChanged.map(_userFromFirebaseUser); 
  }
  //for anonymous sign in
  Future signInAnon() async
 {
    try{
        AuthResult result  = await _auth.signInAnonymously();
        FirebaseUser user=result.user;
        return _userFromFirebaseUser(user);
    }
    catch(e)
    {
              print(e.toString());
              return null;
    }
  }
  //Register with email password
  Future userRegisterWithEmailPssword(String email,String password) async
  {
    try{
    AuthResult result=await _auth.createUserWithEmailAndPassword(email:email,password: password);
    FirebaseUser user=result.user;
    await DatabaseService(uid: user.uid).updateUserData('New User','PUBG', 19); 
    return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      return null;
    }
  }
  //Sign in with email and password
  Future signInWithEmailPassword(String email,String password) async
  {
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email,password: password);
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e)
    {
      return null;
    }
  }
  //sign  out
  Future signOut() async
  {
      try{
        return await _auth.signOut();
      
      }catch(e)
      {
        return null;
      }
  }
}