import 'package:application_project/utility/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double screen;

  final firebaseuser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('ข้อมูลผู้ใช้'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              prefix(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              nameTH(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              lastnameTh(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              nameEng(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              lastnameEng(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              idNumber(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              date(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              ethnicityandnationality(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              religion(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              telephone(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              educationalqualification(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              studyplandepartment(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              gPAX(),
              Divider(
                thickness: 3,
                endIndent: 0,
                color: Colors.grey,
              ),
              newButton(),
              newButton1(),
            ],
          ),
        ),
      ),
    );
  }

  Container newLogoProfile() {
    return Container(
      width: screen * 0.2,
      child: MyStyle().showLogo11(),
    );
  }

  Container newButton() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.40,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/editprofile'),
        child: Text('แก้ไขข้อมูล'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Container newButton1() {
    return Container(
      width: screen * 0.40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkresult');
        },
        child: Text('สถานะการสมัคร'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Container prefix() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle().titleH2("คำนำหน้า: ${data['02prefix']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("คำนำหน้า:"),
          );
        },
      ),
    );
  }

  Container nameTH() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle().titleH2("ชื่อ(ภาษาไทย): ${data['03nameTH']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("ชื่อ(ภาษาไทย):"),
          );
        },
      ),
    );
  }

  Container lastnameTh() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle()
                  .titleH2("นามสกุล(ภาษาไทย): ${data['04lastnameTh']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("นามสกุล(ภาษาไทย):"),
          );
        },
      ),
    );
  }

  Container nameEng() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle().titleH2("First name: ${data['05nameEng']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("First name:"),
          );
        },
      ),
    );
  }

  Container lastnameEng() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle().titleH2("Last name: ${data['06lastnameEng']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("Last name:"),
          );
        },
      ),
    );
  }

  Container idNumber() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        width: screen * 0.75,
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('user')
              .doc(firebaseuser!.uid)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Container(
                child: MyStyle()
                    .titleH2("รหัสบัตรประจำตัวประชาชน: ${data['07idNumber']}"),
              );
            }
            return Container(
              child: MyStyle().titleH2("รหัสบัตรประจำตัวประชาชน:"),
            );
          },
        ));
  }

  Container date() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle().titleH2("วันเกิด: ${data['08newDate']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("วันเกิด:"),
          );
        },
      ),
    );
  }

  Container ethnicityandnationality() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle().titleH2(
                  "เชื้อชาติ: ${data['09ethnicity']} สัญชาติ: ${data['10nationality']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("เชื้อชาติ: สัญชาติ:"),
          );
        },
      ),
    );
  }

  Container religion() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle().titleH2("ศาสนา: ${data['11religion']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("ศาสนา:"),
          );
        },
      ),
    );
  }

  Container telephone() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle()
                  .titleH2("เบอร์โทรศัพท์มมือถือ: ${data['12telephone']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("เบอร์โทรศัพท์มือถือ:"),
          );
        },
      ),
    );
  }

  Container educationalqualification() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle().titleH2(
                  "วุฒิการศึกษาที่จบ: ${data['13educationalqualification']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("วุฒิการศึกษาที่จบ:"),
          );
        },
      ),
    );
  }

  Container studyplandepartment() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child: MyStyle().titleH2(
                  "แผนการเรียน/แผนก: ${data['14studyplandepartment']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("แผนการเรียน/แผนก:"),
          );
        },
      ),
    );
  }

  Container gPAX() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(firebaseuser!.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              child:
                  MyStyle().titleH2("เกรดเฉลี่ยนสะสม(GPAX): ${data['15gPAX']}"),
            );
          }
          return Container(
            child: MyStyle().titleH2("เกรดเฉลี่ยนสะสม(GPAX):"),
          );
        },
      ),
    );
  }
}
