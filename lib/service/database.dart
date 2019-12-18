import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applatest/modals/brewmodel.dart';
import 'package:flutter_applatest/modals/user.dart';
import 'package:flutter_applatest/screens/brew.dart';
class DatabaseService
{
  final String uid;
  DatabaseService({this.uid});
  //collection ie firebase collection reference
  final CollectionReference brewCollection=Firestore.instance.collection('Details');
  Future updateUserData(String name,String color,int age) async
  {
    return await brewCollection.document(uid).setData({
      'name':name,
      'color':color,
      'age':age,
    });
  }
  //brewList from snapshots
  List<BrewModel> _brewListFromSnapshot(QuerySnapshot snapshot)
{
  return snapshot.documents.map((doc)
  {
    return BrewModel(
      name: doc.data['name'] ?? '',
      color: doc.data['color'] ?? '',
      age: doc.data['age'] ?? 0
    );
  }).toList();
}
//userdata snapshot
UserData _userDataFromSnapshot(DocumentSnapshot snapshot)
{
  return UserData(color:snapshot.data['color'],
  age: snapshot.data['age'],
  uid: uid,
  name: snapshot.data['name']  
  );
}
//stream for data snapshots
Stream<UserData>  get userData{
  return brewCollection.document(uid).snapshots()
  .map(_userDataFromSnapshot);
}

  Stream<List<BrewModel>> get details
  {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

}