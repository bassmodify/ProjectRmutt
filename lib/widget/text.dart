
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:application_project/utility/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Text1 extends StatefulWidget {
  const Text1({Key? key}) : super(key: key);

  @override
  _Text1State createState() => _Text1State();
}

class _Text1State extends State<Text1> {
  late double screen;

  String? femail;
  final firebaseuser = FirebaseAuth.instance.currentUser;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('เมนู'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              newLogomenu0(),
              newButton(),
              newLogomenu1(),
              newButton1(),
              newLogomenu2(),
              newButton2(),
              newButton3(),
            ],
          ),
        ),
      ),
    );
  }

  Container newLogomenu0() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo2(),
            ),
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo3(),
            ),
          ]),
        ],
      ),
    );
  }

  Container newLogomenu1() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo4(),
            ),
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo5(),
            ),
          ]),
        ],
      ),
    );
  }

  Container newLogomenu2() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo6(),
            ),
          ]),
        ],
      ),
    );
  }

  Container newButton() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.30,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/schedule'),
                child: Text('กำหนดการ'),
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              width: screen * 0.30,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/enroll'),
                child: Text('สมัครเรียน'),
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Container newButton1() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.30,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/contactus'),
                child: Text('ติดต่อเรา'),
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              width: screen * 0.30,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                child: Text('ข้อมมูลผู้ใช้'),
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Container newButton2() {
    return Container(
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/studentregistration'),
        child: Text('ขึ้นทะเบียนประวัตินักศึกษา'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Container newButton3() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () async {
          await Firebase.initializeApp().then((value) async {
            await FirebaseAuth.instance.signOut().then((value) =>
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false));
          });
        },
        child: Text('ออกจากระบบ'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  
}
