import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class Regiter3 extends StatefulWidget {
  const Regiter3({ Key? key }) : super(key: key);

  @override
  _Regiter3State createState() => _Regiter3State();
}

class _Regiter3State extends State<Regiter3> {
  late double screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('ลงทะเบียนเข้าสู่ระบบ(ต่อ)'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Educationalqualification(),
              studyplandepartment(),
              gPAX(),
              buttonregiter(),


            ],
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

  Container buttonregiter() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('สมัครสมาชิก'),
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