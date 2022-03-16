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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              newLogoProfile(),
              prefix(),
              nameTH(),
              lastnameTh(),
              nameEng(),
              lastnameEng(),
              idNumber(),
              date(),
              ethnicityandnationality(),
              religion(),
              telephone(),
              educationalqualification(),
              studyplandepartment(),
              gPAX(),
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
      margin: EdgeInsets.only(top: 40),
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
        onPressed: () {},
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
              child: MyStyle().titleH2(
                  "คำนำหน้า: ${data['02prefix']}"),
            );
          }
          return Text("loading");
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
              child: MyStyle().titleH2(
                  "ชื่อ(ภาษาไทย): ${data['03nameTH']}"),
            );
          }
          return Text("loading");
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
              child: MyStyle().titleH2(
                  "นามสกุล(ภาษาไทย): ${data['04lastnameTh']}"),
            );
          }
          return Text("loading");
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
              child: MyStyle().titleH2(
                  "First name: ${data['05nameEng']}"),
            );
          }
          return Text("loading");
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
              child: MyStyle().titleH2(
                  "Last name: ${data['06lastnameEng']}"),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

  Container  idNumber() {
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
                  "รหัสบัตรประจำตัวประชาชน: ${data['07idNumber']}"),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

  Container  date() {
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
                  "วันเกิด: ${data['08newDate']}"),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

  Container  ethnicityandnationality() {
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
          return Text("loading");
        },
      ),
    );
  }

  Container  religion() {
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
                  "ศาสนา: ${data['11religion']}"),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

  Container  telephone() {
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
                  "เบอร์โทรศัพท์มมือถือ: ${data['12telephone']}"),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

  Container  educationalqualification() {
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
          return Text("loading");
        },
      ),
    );
  }

  Container  studyplandepartment() {
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
          return Text("loading");
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
              child: MyStyle().titleH2(
                  "เกรดเฉลี่ยนสะสม(GPAX): ${data['15gPAX']}"),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

}


