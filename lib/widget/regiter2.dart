import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class Regiter2 extends StatefulWidget {
  const Regiter2({ Key? key }) : super(key: key);

  @override
  _Regiter2State createState() => _Regiter2State();
}

class _Regiter2State extends State<Regiter2> {
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
         

              buttonnext()

            ],
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
        onPressed: () => Navigator.pushNamed(context, '/register3'),
        child: Text('ถัดไป'),
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