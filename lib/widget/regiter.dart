import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';


class Regiter extends StatefulWidget {
  const Regiter({Key? key}) : super(key: key);

  @override
  _RegiterState createState() => _RegiterState();
}

class _RegiterState extends State<Regiter> {
  late double screen;
  bool statusRedEye = true;
  bool statusRedEye2 = true;
 
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('ลงทะเบียนเข้าสู่ระบบ'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              email(),
              password(),
              password2(),
              buttonnext(),

            ],
          ),
        ),
      ),
    );
  }

  Container email() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'อีเมล',
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

  Container password() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
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
          hintText: 'รหัสผ่าน',
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

  Container password2() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        obscureText: statusRedEye2,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                statusRedEye2 = !statusRedEye2;
              });
            },
            icon: statusRedEye2
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.remove_red_eye_outlined),
          ),
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'ยืนยันรหัสผ่านอีกครั้ง',
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

  Container buttonnext() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/register1'),
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


