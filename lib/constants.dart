import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:untitled/controllers/auth.dart';
import 'package:untitled/views/screens/add_video_screen.dart';

final backgroundColor = Colors.black;
final buttonColor = Colors.red[400];
final borderColor = Colors.grey;

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
var authcontroller = AuthController.instance;

const pages = [
  Text("homescreen"),
  Text("videoscreen"),
  AddVideoScreen(),
  Text("profilescreen"),
  Text("profilescreen"),
];
