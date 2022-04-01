import 'package:application_project/utility/dialog.dart';
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
              // SizedBox(
              //   height: screen * 0.07,
              // ),
              // Divider(
              //   thickness: 3,
              //   endIndent: 0,
              //   color: Colors.grey,
              // ),
              // SizedBox(
              //   height: screen * 0.07,
              // ),
              // MyStyle().titleH1('อัปโหลดเอกสารสมัครเรียน'),
              // buttonnext2(),
              // SizedBox(
              //   height: screen * 0.07,
              // ),
              // Divider(
              //   thickness: 3,
              //   endIndent: 0,
              //   color: Colors.grey,
              // ),
              // SizedBox(
              //   height: screen * 0.07,
              // ),
              // MyStyle().titleH1('เอกสารค่าชำระ'),
              // MyStyle().titleH1('ดาวน์โหลดเอกสารชำระค่าสมัครเรียน'),
              // buttonnext1(),
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
        items: <String>[
          'สาขาที่เปิดรับสมัคร',
          'วิศวกรรมโยธา',
          'วิศวกรรมไฟฟ้า',
          'วิศวกรรมเครื่องกล',
          'วิศวกรรมอุตสาหการ',
          'วิศวกรรมสิ่งทอ',
          'วิศวกรรมอิเล็กทรอนิกส์และโทรคมนาคม',
          'วิศวกรรมคอมพิวเตอร์',
          'วิศวกรรมเคมี',
          'วิศวกรรมวัสดุและโลหะการ',
          'วิศวกรรมเกษตร'
        ].map<DropdownMenuItem<String>>((String value) {
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

  Future<Null> setFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().then((value) async {
      print('----------Firebase---------');
      await FirebaseFirestore.instance
          .collection("studentEnroll")
          .doc(firebaseuser!.uid)
          .set({
        "01email": femail,
        "02branchesopenforapplications": newbranchesopenforapplications,
      }).then((_) {
        print("success!");
        normalDialog(context, 'ลงสมัครสาขาที่เลือกสำเร็จ');
        Future.delayed(
          Duration(seconds: 2),
          () {
            Navigator.pushNamed(context, '/menu');
          },
        );
      });
    });
  }
}
