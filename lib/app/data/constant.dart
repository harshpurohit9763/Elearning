import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ConstantValues {
  var firebase = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;

}



class ConstantColors{
  final darkmode = Colors.black;
  final lightmode = Colors.white;
  final primarycolor = Colors.lightBlue[400];
  final secondarycolor = Colors.blueAccent;
}
