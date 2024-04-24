import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String useremail = '';
  String username = '';
  String userimage = '';

  void getfirsestoredata() async {
    String email = '';
    String name = '';
    String image = '';
    final id = FirebaseAuth.instance.currentUser!.uid;
    try {
      final userdata = await FirebaseFirestore.instance
          .collection('User Data')
          .doc(id)
          .get();

      email = userdata.get('Email');
      name = userdata.get('Full name');
      image = userdata.get('image');
      //
      username = name;
      useremail = email;
      userimage = image;
      notifyListeners();

      // debugPrint(userdata.get('Email'));
    } catch (error) {
      // Handle the error as needed
    }
  }
}
