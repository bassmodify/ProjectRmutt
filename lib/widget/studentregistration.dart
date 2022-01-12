import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({ Key? key }) : super(key: key);

  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  late double screen;


  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('ขึ้นทะเบียนประวัตินักศึกษา'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              newLogoProfile(),
              newButton(),
              newLogoProfile1(),
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
      child: MyStyle().showLogo9(),
    );
  }

  Container newLogoProfile1() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: screen * 0.2,
      child: MyStyle().showLogo10(),
    );
  }

  Container newButton() {
    return Container(
      width: screen * 0.70,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('กรอกข้อมูลขึ้นทะเบียนประวัตินักศึกษา'),
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
      width: screen * 0.70,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('อัปโหลดเอการขึ้นทะเบียนประวัตินักศึกษา'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}