import 'package:application_project/utility/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Enroll extends StatefulWidget {
  const Enroll({Key? key}) : super(key: key);

  @override
  _EnrollState createState() => _EnrollState();
}

class _EnrollState extends State<Enroll> {
  late double screen;
  String newbranchesopenforapplications = 'สาขาที่เปิดรับสมัคร';
  final firebaseuser = FirebaseAuth.instance.currentUser;
  String? femail;

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('สมัครเรียน'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyStyle().titleH1('รอบโคต้า'),
              branchesopenforapplications(),
              buttonnext(),
              MyStyle().titleH1('อัปโหลดเอกสารสมัครเรียน'),
              buttonnext2(),
              MyStyle().titleH1('เอกสารค่าชำระ'),
              MyStyle().titleH1('ดาวน์โหลดเอกสารชำระค่าสมัครเรียน'),
              buttonnext1(),
            ],
          ),
        ),
      ),
    );
  }

  Container buttonnext() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () {
          setFirebase();
        },
        child: Text('ยืนยัน'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Container branchesopenforapplications() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: screen * 0.75,
      decoration: BoxDecoration(
        border: Border.all(color: MyStyle().color2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: newbranchesopenforapplications,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: MyStyle().color2, fontSize: 18.0),
        onChanged: (String? newValue) {
          setState(() {
            newbranchesopenforapplications = newValue!;
          });
        },
        items: <String>['สาขาที่เปิดรับสมัคร', 'ปวช', 'ปวส', 'กศน']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Container(child: Text(value))),
          );
        }).toList(),
      ),
    );
  }

  Container buttonnext1() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('ดาวโหลดเอกสารชำระเงินค่าสมัคร'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Container buttonnext2() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () =>
            Navigator.pushNamed(context, '/uploadapplicationdocuments'),
        child: Text('อัปโหลดเอกสารสมัครเรียน'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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
              child: MyStyle().titleH2("ชื่อ(ภาษาไทย): ${data['03nameTH']}"),
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
              child: MyStyle()
                  .titleH2("นามสกุล(ภาษาไทย): ${data['04lastnameTh']}"),
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
              child: MyStyle().titleH2("First name: ${data['05nameEng']}"),
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
              child: MyStyle().titleH2("Last name: ${data['06lastnameEng']}"),
            );
          }
          return Text("loading");
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
          return Text("loading");
        },
      ),
    );
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
          return Text("loading");
        },
      ),
    );
  }

  Container ethnicity() {
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
              child: MyStyle().titleH2("เชื้อชาติ: ${data['09ethnicity']}"),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

  Container nationality() {
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
              child: MyStyle().titleH2("{สัญชาติ: ${data['10nationality']}"),
            );
          }
          return Text("loading");
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
          return Text("loading");
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
          return Text("loading");
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
          return Text("loading");
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
              child:
                  MyStyle().titleH2("เกรดเฉลี่ยนสะสม(GPAX): ${data['15gPAX']}"),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

  Future<Null> setFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().then((value) async {
      print('----------Firebase---------');
      await FirebaseFirestore.instance
          .collection("studentEnroll")
          .doc(firebaseuser!.uid)
          .set({
        "01email": femail,
        "02prefix": prefix(),
        "03nameTH": nameTH(),
        "04lastnameTh": lastnameTh(),
        "05nameEng": nameEng(),
        "06lastnameEng": lastnameEng(),
        "07idNumber": idNumber(),
        "08newDate": date(),
        "09ethnicity": ethnicity(),
        "10nationality": nationality(),
        "11religion": religion(),
        "12telephone": telephone(),
        "13educationalqualification": educationalqualification(),
        "14studyplandepartment": studyplandepartment(),
        "15gPAX": gPAX(),
      }).then((_) {
        print("success!");
      });
    });
  }
}
