import 'package:application_project/utility/dialog.dart';
import 'package:application_project/utility/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Regiter extends StatefulWidget {
  const Regiter({Key? key}) : super(key: key);

  @override
  _RegiterState createState() => _RegiterState();
}

class _RegiterState extends State<Regiter> {
  late double screen;
  bool statusRedEye = true;
  bool statusRedEye2 = true;
  String? newemail, newpassword, newrepassword, femail;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('ลงทะเบียนเข้าสู่ระบบ'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              email(),
              password(),
              password2(),
              buttonnext(),
            ],
          ),
        ),
      ),
    );
  }

  Container email() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => newemail = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'อีเมล',
          prefixIcon: Icon(
            Icons.email,
            color: MyStyle().color2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().color2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().color2),
          ),
        ),
      ),
    );
  }

  Container password() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newpassword = value.trim(),
        obscureText: statusRedEye,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                statusRedEye = !statusRedEye;
              });
            },
            icon: statusRedEye
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.remove_red_eye_outlined),
          ),
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'รหัสผ่าน',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: MyStyle().color2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().color2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().color2),
          ),
        ),
      ),
    );
  }

  Container password2() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newrepassword = value.trim(),
        obscureText: statusRedEye2,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                statusRedEye2 = !statusRedEye2;
              });
            },
            icon: statusRedEye2
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.remove_red_eye_outlined),
          ),
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ยืนยันรหัสผ่านอีกครั้ง',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: MyStyle().color2,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().color2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: MyStyle().color2),
          ),
        ),
      ),
    );
  }

  Container buttonnext() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () {
          print(
              'name = $newemail, password = $newpassword, repassword = $newrepassword');

          if ((newemail?.isEmpty ?? true) ||
              (newpassword?.isEmpty ?? true) ||
              (newrepassword?.isEmpty ?? true) ||
              (newpassword != newrepassword)) {
            print('Have Space');
            normalDialog(context, 'กรุณากรอกข้อมูลให้ถูกต้อง');
          } else {
            print('No Space');
            registerFirebase();
            
          }
        },
        child: Text('ลงทะเบียน'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) async {
      print('----------Firebase---------');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: newemail!, password: newpassword!)
          .then((value) async {
        print('ลงทะเบียนสำเร็จ');
        normalDialog(context, 'ลงะเบียนสำเร็จ');
        Future.delayed(
          Duration(seconds: 2),
          () {
            Navigator.pushNamed(context, '/login');
          },
        );
      }).catchError((ddddd) {
        normalDialog(context, ddddd.message);
      });
    });
  }


}
