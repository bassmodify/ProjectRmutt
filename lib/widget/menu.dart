import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late double screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('ติดต่อเรา'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              newLogomenu0(),
              newButton(),
              newLogomenu1(),
              newButton1(),
              newLogomenu2(),
              newButton2(),
              newButton3(),
            ],
          ),
        ),
      ),
    );
  }

  Container newLogomenu0() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo2(),              
            ),
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo3(),
            ),
          ]),
        ],
      ),
    );
  }

  Container newLogomenu1() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo4(),
            ),
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo5(),
            ),
          ]),
        ],
      ),
    );
  }

  Container newLogomenu2() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.2,
              child: MyStyle().showLogo6(),
            ),
          ]),
        ],
      ),
    );
  }

  Container newButton() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.30,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/schedule'),
                child: Text('กำหนดการ'),
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              width: screen * 0.30,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('สมัครเรียน'),
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Container newButton1() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: screen * 0.30,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/contactus'),
                child: Text('ติดต่อเรา'),
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Container(
              width: screen * 0.30,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                child: Text('ข้อมมูลผู้ใช้'),
                style: ElevatedButton.styleFrom(
                  primary: MyStyle().color2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Container newButton2() {
    return Container(
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/studentregistration'),
        child: Text('ขึ้นทะเบียนประวัตินักศึกษา'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Container newButton3() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: screen * 0.60,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('ออกจากระบบ'),
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
