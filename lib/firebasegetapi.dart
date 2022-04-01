import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseuser = FirebaseAuth.instance.currentUser;

class Ffff {
  Future<String> ghhh() async {
    FirebaseFirestore.instance
        .collection("user")
        .doc(firebaseuser?.uid)
        .get()
        .then((value) {
      var dddd = (value.data()?['07idNumber']);
      return (dddd);
    });
    return ("000");
  }
}

