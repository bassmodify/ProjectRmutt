import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late double screen;

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
        onPressed: () {},
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
}