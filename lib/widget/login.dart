import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double screen;
  bool statusRedEye = true;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              newLogo(),
              MyStyle().titleH1('แอปพลิเคชันระบบรับสมัคร และขึ้น'),
              MyStyle().titleH1('ทะเบียนประวัตินักศึกษาสำหรับรอบโคต้า'),
              MyStyle().titleH1('กรณีศึกษาคณะวิศวกรรมศาสตร์'),
              MyStyle().titleH1('มหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรี'),
              newUser(),
              newPasswrd(),
              newLogin(),
              newRegiter(),
              newForgotPassword(),
            ],
          ),
        ),
      ),
    );
  }

  Container newLogo() {
    return Container(
      width: screen * 0.4,
      child: MyStyle().showLogo(),
    );
  }

  Container newUser() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: screen * 0.75,
      child: TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().color2),
          hintText: 'User',
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

  Container newPasswrd() {
    return Container(
      margin: EdgeInsets.only(top: 16),
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
          hintText: 'Passwrd',
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

  Container newLogin() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('เข้าสู่ระบบ'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Container newRegiter() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/register'),
        child: Text('ลงทะเบียนเข้าสู่ระบบ'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  TextButton newForgotPassword() =>
      TextButton(onPressed: () => Navigator.pushNamed(context, '/forgot'), child: Text('ลืมรหัสผ่าน ?'));

}
