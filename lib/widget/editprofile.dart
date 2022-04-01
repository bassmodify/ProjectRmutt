// import 'package:application_project/cart_model.dart';
// import 'package:application_project/sqflite.dart';
import 'package:application_project/utility/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:application_project/utility/my_style.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late double screen;

  String? newnameTh,
      newlastnameTh,
      newnameEng,
      newlastnameEng,
      newidNumber,
      newaddress,
      newethnicity,
      newnationality,
      newreligion,
      newtelephone,
      newstudyplandepartment,
      newgPAX,
      femail;
  String newprefix = 'คำนำหน้า';
  String neweducationalqualification = 'วุฒิการศึกษาที่จบ';
  String newday = 'วัน';
  String newmonth = 'เดือน';
  String newyear = 'ปี';
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
        title: Text('ข้อมูลผู้ใช้'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              newLogoProfile(),
              prefix(),
              nameTh(),
              lastnameTh(),
              nameEng(),
              lastnameEng(),
              idNumber(),
              address(),
              SizedBox(
                height: screen * 0.01,
              ),
              MyStyle().titleH2('วัน/เดือน/ปีเกิด'),
              datmonthyear(),
              ethnicity(),
              nationality(),
              religion(),
              telephone(),
              educationalqualification(),
              studyplandepartment(),
              gPAX(),
              newButton(),
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
        onPressed: () {
          if ((newnameTh?.isEmpty ?? true) ||
              (newlastnameTh?.isEmpty ?? true) ||
              (newnameEng?.isEmpty ?? true) ||
              (newlastnameEng?.isEmpty ?? true) ||
              (newidNumber?.isEmpty ?? true) ||
              (newaddress?.isEmpty ?? true) ||
              (newethnicity?.isEmpty ?? true) ||
              (newnationality?.isEmpty ?? true) ||
              (newreligion?.isEmpty ?? true) ||
              (newtelephone?.isEmpty ?? true) ||
              (newstudyplandepartment?.isEmpty ?? true) ||
              (newgPAX?.isEmpty ?? true)) {
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

  Container nameTh() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newnameTh = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ชื่อ(ภาษาไทย)',
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

  Container lastnameTh() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newlastnameTh = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'นามสกุล(ภาษาไทย)',
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

  Container nameEng() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newnameEng = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'First name',
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

  Container lastnameEng() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newlastnameEng = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'Last name',
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

  Container idNumber() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newidNumber = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'หมายเลขบัตรประชาชน',
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

  Container address() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newaddress = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ที่อยู่ตามทะเบียนบ้าน',
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

  Container ethnicity() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newethnicity = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'เชื้อชาติ',
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

  Container nationality() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newnationality = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'สัญชาติ',
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

  Container religion() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newreligion = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ศาสนา',
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

  Container telephone() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newtelephone = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'เบอร์โทรศัพท์มมือถือ',
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

  Container studyplandepartment() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newstudyplandepartment = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'แผนการเรียน/แผนก',
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

  Container gPAX() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => newgPAX = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'เกรดเฉลี่ยสะสม (GPAX)',
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

  Container prefix() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: screen * 0.75,
      decoration: BoxDecoration(
        border: Border.all(color: MyStyle().color2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        icon: const Icon(Icons.arrow_downward_rounded),
        isExpanded: true,
        value: newprefix,
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: MyStyle().color2, fontSize: 18.0),
        onChanged: (String? newValue) {
          setState(() {
            newprefix = newValue!;
          });
        },
        items: <String>['คำนำหน้า', 'นาย', 'นางสาว', 'นาง']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(
              child: Container(
                child: Text(value),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Container educationalqualification() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      decoration: BoxDecoration(
        border: Border.all(color: MyStyle().color2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: neweducationalqualification,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: MyStyle().color2, fontSize: 18.0),
        onChanged: (String? newValue) {
          setState(() {
            neweducationalqualification = newValue!;
          });
        },
        items: <String>['วุฒิการศึกษาที่จบ', 'ปวช', 'ปวส', 'กศน']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(child: Container(child: Text(value))),
          );
        }).toList(),
      ),
    );
  }

  Container datmonthyear() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: screen * 0.2,
              decoration: BoxDecoration(
                border: Border.all(color: MyStyle().color2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: newday,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: MyStyle().color2, fontSize: 18.0),
                onChanged: (String? newValue) {
                  setState(() {
                    newday = newValue!;
                  });
                },
                items: <String>[
                  'วัน',
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                  '9',
                  '10',
                  '11',
                  '12',
                  '13',
                  '14',
                  '15',
                  '16',
                  '17',
                  '18',
                  '19',
                  '20',
                  '21',
                  '22',
                  '23',
                  '24',
                  '25',
                  '26',
                  '27',
                  '28',
                  '29',
                  '30',
                  '31',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Container(child: Text(value))),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: screen * 0.40,
              decoration: BoxDecoration(
                border: Border.all(color: MyStyle().color2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: newmonth,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: MyStyle().color2, fontSize: 18.0),
                onChanged: (String? newValue) {
                  setState(() {
                    newmonth = newValue!;
                  });
                },
                items: <String>[
                  'เดือน',
                  'มกราคม',
                  'กุมภาพันธ์',
                  'มีนาคม',
                  'เมษายน ',
                  'พฤษภาคม',
                  'มิถุนายน',
                  'กรกฎาคม',
                  'สิงหาคม',
                  'กันยายน',
                  'ตุลาคม',
                  'พฤศจิกายน',
                  'ธันวาคม',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Container(child: Text(value))),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: screen * 0.30,
              decoration: BoxDecoration(
                border: Border.all(color: MyStyle().color2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: newyear,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: MyStyle().color2, fontSize: 18.0),
                onChanged: (String? newValue) {
                  setState(() {
                    newyear = newValue!;
                  });
                },
                items: <String>[
                  'ปี',
                  '2540',
                  '2541',
                  '2542',
                  '2543',
                  '2544',
                  '2545',
                  '2546',
                  '2547',
                  '2548',
                  '2549',
                  '2550'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Container(child: Text(value))),
                  );
                }).toList(),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) async {
      print('----------Firebase---------');
      await FirebaseFirestore.instance
          .collection("user")
          .doc(firebaseuser!.uid)
          .update({
        "01email": femail,
        "02prefix": newprefix,
        "03nameTH": newnameTh,
        "04lastnameTh": newlastnameTh,
        "05nameEng": newnameEng,
        "06lastnameEng": newlastnameEng,
        "07idNumber": newidNumber,
        "08newDate": "$newday /$newmonth /$newyear",
        "09ethnicity": newethnicity,
        "10nationality": newnationality,
        "11religion": newreligion,
        "12telephone": newtelephone,
        "13educationalqualification": neweducationalqualification,
        "14studyplandepartment": newstudyplandepartment,
        "15gPAX": newgPAX,
        "16address": newaddress,
      }).then((_) {
        print("success!");
        normalDialog(context, 'บันทึกข้อมูลเรียบร้อยแล้ว');
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
