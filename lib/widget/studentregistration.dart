import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class StudentRegis extends StatefulWidget {
  const StudentRegis({Key? key}) : super(key: key);

  @override
  _StudentRegisState createState() => _StudentRegisState();
}

class _StudentRegisState extends State<StudentRegis> {
  late double screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('ขึ้นทะเบียนประวัตินักศึกษา'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItemStudentRegis(
                "กรอกข้อมูล", Icons.account_box_outlined),
            makeDashboardItemUploadRegis("อัพโหลดเอกสาร", Icons.upload_file),
            makeDashboardItemTReturnMenu("กลับไปที่เมนู", Icons.keyboard_return)
          ],
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
        onPressed: () => Navigator.pushNamed(context, '/studentregistration1'),
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
        onPressed: () =>
            Navigator.pushNamed(context, '/uploadregistrationdocuments'),
        child: Text('อัพโหลดเอกสารขึ้นทะเบียนประวัตินักศึกษา'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Card makeDashboardItemStudentRegis(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: (Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/studentregistration1');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      )),
    );
  }

  Card makeDashboardItemUploadRegis(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: (Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/uploadregistrationdocuments');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      )),
    );
  }

  Card makeDashboardItemTReturnMenu(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: (Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/menu', (route) => false);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      )),
    );
  }
}
