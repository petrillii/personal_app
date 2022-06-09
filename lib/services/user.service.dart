import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserService {
  Future getLoggedInfoUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    QuerySnapshot snap =
        await FirebaseFirestore.instance.collection('usuarios').get();
    if (user == null) {
      return;
    } else {
      for (var document in snap.docs) {
        if (document.get('uid') == uid) {
          return document.get('dados');
        }
      }
    }
  }
}
