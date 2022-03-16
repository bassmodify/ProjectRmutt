//import 'dart:html';

import 'package:application_project/utility/dialog.dart';
import 'package:application_project/utility/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double screen;
  bool statusRedEye = true;
  String? user, password, femail;
  int len = 0;

  final firebaseuser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    emailFirebase();
  }

  Future<Null> emailFirebase() async {
    await Firebase.initializeApp().then((value) async {
      FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          femail = event?.email;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              newLogo(),
              MyStyle().titleH1('แอปพลิเคชันระบบรับสมัคร และขึ้น'),
              MyStyle().titleH1('ทะเบียนประวัตินักศึกษาสำหรับรอบโคต้า'),
              MyStyle().titleH1('กรณีศึกษาคณะวิศวกรรมศาสตร์'),
              MyStyle().titleH1('มหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรี'),
              newUser(),
              newPasswrd(),
              newLogin(),
              newRegiter(),
              newForgotPassword(),
            ],
          ),
        ),
      ),
    );
  }

  Container newLogo() {
    return Container(
      width: screen * 0.4,
      child: MyStyle().showLogo(),
    );
  }

  Container newUser() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: screen * 0.75,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'User',
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

  Container newPasswrd() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => password = value.trim(),
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
          hintText: 'Passwrd',
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

  Container newLogin() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () {
          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            normalDialog(context, 'กรุณากรอกข้อมูลให้ถูกต้อง');
          } else {
            checkAuthen();
            //setFirebase();
          }
        },
        child: Text('เข้าสู่ระบบ'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Container newRegiter() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/register'),
        child: Text('ลงทะเบียนเข้าสู่ระบบ'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  TextButton newForgotPassword() => TextButton(
      onPressed: () => Navigator.pushNamed(context, '/forgot'),
      child: Text('ลืมรหัสผ่าน ?'));

  Future<Null> checkAuthen() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: user!, password: password!)
          .then((value) => Navigator.pushNamedAndRemoveUntil(
              context, '/menu', (route) => false))
          .catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }

  Future<Null> setFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().then((value) async {
      print('----------Firebase---------');
      await FirebaseFirestore.instance
          .collection("user")
          .doc(firebaseuser!.uid)
          .set({
        "01email": femail,
        "02prefix": "--",
        "03nameTH": "--",
        "04lastnameTh": "--",
        "05nameEng": "--",
        "06lastnameEng": "--",
        "07idNumber": "--",
        "08newDate": "--",
        "09ethnicity": "--",
        "10nationality": "--",
        "11religion": "--",
        "12telephone": "--",
        "13educationalqualification": "--",
        "14studyplandepartment": "--",
        "15gPAX": "--",
      }).then((_) {
        print("success!");
      });
    });
  }
}
