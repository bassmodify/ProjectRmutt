// import 'package:application_project/utility/dialog.dart';
import 'package:application_project/utility/dialog.dart';
import 'package:application_project/utility/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Studentregistration1 extends StatefulWidget {
  const Studentregistration1({Key? key}) : super(key: key);

  @override
  _Studentregistration1State createState() => _Studentregistration1State();
}

class _Studentregistration1State extends State<Studentregistration1> {
  late double screen;

  String? newfathername,
      newmothername,
      newparentname,
      newcontactname,
      newcontacttheworkplace,
      newcontactnumber,
      newstudentwork,
      newdisabilityinformation,
      newparentssituation,
      newfatherstatus,
      newfatheroccupation,
      newmotherstatus,
      newmotheroccupation,
      newparentoccupationalinformation,
      newnumberofsiblings,
      newtalent,
      newgraduate,
      newaddress,
      femail;
  String newfatherincome = 'รายได้บิดา/ปี';
  String newmotherincome = 'รายได้มารดา/ปี';

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

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('กรอกข้อมูลขึ้นทะเบียนนักศึกษา'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              fathername(),
              mothername(),
              parentname(),
              SizedBox(
                height: screen * 0.01,
              ),
              MyStyle().titleH2('บุคคลที่สามารถติดต่อได้'),
              contactname(),
              address(),
              contacttheworkplace(),
              contactnumber(), //ผู้ปกครอง
              studentwork(),
              disabilityinformation(),
              SizedBox(
                height: screen * 0.01,
              ),
              MyStyle().titleH2('ข้อมูลส่วนตัวบิดา-มารดา'),
              parentssituation(),
              //บิดา
              fatherincome(),
              fatherstatus(),
              fatheroccupation(),
              //มารดา
              motherincome(),
              motherstatus(),
              motheroccupation(),
              //ผู้ปกครอง
              parentoccupationalinformation(),
              numberofsiblings(),
              talent(),
              graduate(),

              newButton(),
            ],
          ),
        ),
      ),
    );
  }

  Container newButton() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: screen * 0.40,
      child: ElevatedButton(
        onPressed: () {
          if ((newfathername?.isEmpty ?? true) ||
              (newmothername?.isEmpty ?? true) ||
              (newparentname?.isEmpty ?? true) ||
              (newcontactname?.isEmpty ?? true) ||
              (newcontacttheworkplace?.isEmpty ?? true) ||
              (newcontactnumber?.isEmpty ?? true) ||
              // (newstudentwork?.isEmpty ?? true) ||
              (newdisabilityinformation?.isEmpty ?? true) ||
              (newparentssituation?.isEmpty ?? true) ||
              (newfatherstatus?.isEmpty ?? true) ||
              (newfatheroccupation?.isEmpty ?? true) ||
              (newmotherstatus?.isEmpty ?? true) ||
              (newmotheroccupation?.isEmpty ?? true) ||
              (newparentoccupationalinformation?.isEmpty ?? true) ||
              (newnumberofsiblings?.isEmpty ?? true) ||
              (newtalent?.isEmpty ?? true) ||
              (newgraduate?.isEmpty ?? true)||
              (newaddress?.isEmpty ?? true)) {
            normalDialog(context, 'กรุณากรอกให้ครบถ้วน');
          } else {
             registerFirebase();
          }
        },
        child: Text('บันทึกข้อมูล'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

//บิดา
  Container fathername() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newfathername = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ชื่อ-นามสกุล บิดา',
          prefixIcon: Icon(
            Icons.drive_file_rename_outline,
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

//มมารดา
  Container mothername() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newmothername = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ชื่อ-นามสกุล มารดา',
          prefixIcon: Icon(
            Icons.drive_file_rename_outline,
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

//ผู้ปกครอง
  Container parentname() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newparentname = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ชื่อผู้ปกครอง',
          prefixIcon: Icon(
            Icons.drive_file_rename_outline,
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

//บุคคลที่สามมารถติดต่อได้
  Container contactname() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newcontactname = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ชื่อ-นามสกุล',
          prefixIcon: Icon(
            Icons.drive_file_rename_outline,
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

  Container address() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newaddress = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ที่อยู่คนที่ติดต่อได้',
          prefixIcon: Icon(
            Icons.credit_card,
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

  Container contacttheworkplace() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newcontacttheworkplace = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'สถานที่ทำงาน',
          prefixIcon: Icon(
            Icons.credit_card,
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

  Container contactnumber() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newcontactnumber = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'เบอร์โทรศัพท์',
          prefixIcon: Icon(
            Icons.credit_card,
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

//การทำงานของนักศึกษา
  Container studentwork() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newstudentwork = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'การทำงานของนักศึกษา(ถ้ามี)',
          prefixIcon: Icon(
            Icons.credit_card,
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

//ข้อมูลความพิการ
  Container disabilityinformation() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newdisabilityinformation = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ข้อมูลความพิการ',
          prefixIcon: Icon(
            Icons.credit_card,
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

//ข้อมมูลส่วนตัวบิดา-มมารดา
//สภานภาพบิดา-มารดา
  Container parentssituation() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newparentssituation = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'สภานภาพบิดา-มารดา',
          prefixIcon: Icon(
            Icons.credit_card,
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

//รายได้บิดา
  Container fatherincome() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      decoration: BoxDecoration(
        border: Border.all(color: MyStyle().color2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: newfatherincome,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: MyStyle().color2, fontSize: 18.0),
        onChanged: (String? newValue) {
          setState(() {
            newfatherincome = newValue!;
          });
        },
        items: <String>['รายได้บิดา/ปี', '100,000-150,000', '150,001-300,000', '300,001+']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Container(child: Text(value))),
          );
        }).toList(),
      ),
    );
  }

//สภานภาพบิดา
  Container fatherstatus() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newfatherstatus = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'สภานภาพบิดา',
          prefixIcon: Icon(
            Icons.credit_card,
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

//อาชีพบิดา
  Container fatheroccupation() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newfatheroccupation = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ข้อมูลอาชีพบิดา',
          prefixIcon: Icon(
            Icons.credit_card,
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

//รายได้มมารดา
  Container motherincome() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      decoration: BoxDecoration(
        border: Border.all(color: MyStyle().color2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: newmotherincome,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: MyStyle().color2, fontSize: 18.0),
        onChanged: (String? newValue) {
          setState(() {
            newmotherincome = newValue!;
          });
        },
        items: <String>['รายได้มารดา/ปี', '100,000-150,000', '150,001-300,000', '300,001+']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Container(child: Text(value))),
          );
        }).toList(),
      ),
    );
  }

//สภานภาพมารดา
  Container motherstatus() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newmotherstatus = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'สภานภาพมารดา',
          prefixIcon: Icon(
            Icons.credit_card,
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

//ข้อมูลอาชีพมารดา
  Container motheroccupation() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newmotheroccupation = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ข้อมูลอาชีพมารดา',
          prefixIcon: Icon(
            Icons.credit_card,
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

//ข้อมูลอาชีพผู้ปกครอง
  Container parentoccupationalinformation() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newparentoccupationalinformation = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ข้อมูลอาชีพผู้ปกครอง',
          prefixIcon: Icon(
            Icons.credit_card,
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

//จำนวนพี่น้องทั้งหมด
  Container numberofsiblings() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newnumberofsiblings = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'จำนวนพี่น้องทั้งหมด',
          prefixIcon: Icon(
            Icons.credit_card,
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

//ความสามารถพิเศษ
  Container talent() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newtalent = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ความถนัด/ความสามารถพิเศษ',
          prefixIcon: Icon(
            Icons.credit_card,
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

//สาขาที่สำเร็จการศึกษา
  Container graduate() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newgraduate = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'สาขาที่สำเร็จการศึกษา',
          prefixIcon: Icon(
            Icons.credit_card,
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

  Future<Null> registerFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().then((value) async {
      print('----------Firebase---------');
      await FirebaseFirestore.instance
          .collection("studentRegis")
          .doc(firebaseuser!.uid)
          .set({
        "01email": femail,
        "02fathername": newfathername,
        "03mothername": newmothername,
        "04parentname": newparentname,
        "05contactname": newcontactname,
        "06contacttheworkplace": newcontacttheworkplace,
        "07contactnumber": newcontactnumber,
        "08studentwork": newstudentwork,
        "09disabilityinformation": newdisabilityinformation,
        "10parentssituation": newparentssituation,
        "11fatherstatus": newfatherstatus,
        "12fatheroccupation": newfatheroccupation,
        "13motherstatus": newmotherstatus,
        "14motheroccupation": newmotheroccupation,
        "15parentoccupationalinformation": newparentoccupationalinformation,
        "16numberofsiblings": newnumberofsiblings,
        "17talent": newtalent,
        "18graduate": newgraduate,
        "19address": newaddress,
      }).then((_) {
        print("success!");
        normalDialog(context, 'บันทึกข้อมูลเรียบร้อยแล้ว');
        Future.delayed(
          Duration(seconds: 2),
          () {
            Navigator.pushNamed(context, '/checkRegis');
          },
        );
      });
    });
  }
}
