import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class MenuEnroll extends StatefulWidget {
  const MenuEnroll({Key? key}) : super(key: key);

  @override
  _MenuEnrollState createState() => _MenuEnrollState();
}

class _MenuEnrollState extends State<MenuEnroll> {
  late double screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('สมัครเรียน'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItemBranchesOpen(
                "สาขาที่เปิดรับสมัคร", Icons.account_box_outlined),
            makeDashboardItemEnroll("สมัครเรียน", Icons.app_registration),
            makeDashboardItemUploadEnroll("อัพโหลดเอกสาร", Icons.upload_file),
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
            Navigator.pushNamed(context, '/uploadapplicationdocuments'),
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

  Card makeDashboardItemBranchesOpen(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: (Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/branchesOpen');
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

  Card makeDashboardItemUploadEnroll(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: (Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/uploadapplicationdocuments');
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

  Card makeDashboardItemEnroll(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: (Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/enrollst');
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
