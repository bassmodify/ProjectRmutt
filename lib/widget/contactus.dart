import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  _ContactusState createState() => _ContactusState();
}
class _ContactusState extends State<Contactus> {

  late double screen;

  Container newLogo1() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: screen * 0.4,
      child: MyStyle().showLogo1(),
    );
  }

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
              MyStyle().titleH1('ที่อยู่ 39 หมู่ 1 ถนนรังสิต-นครนายก(คลองหก)'),
              MyStyle().titleH1('อำเภอธัญบุรี จังหวัดปทุมธานี 12110'),
              MyStyle().titleH1('E-mail : oreg@rmutt.ac.th'),
              MyStyle().titleH1('Phoe : 02-549-3690'),
              MyStyle().titleH1('(ห้อง Student Service Center)'),
              MyStyle().titleH1('Fax : 02-577-5028'),
              MyStyle().titleH1('คณะวิศวกรรมศาสตร์'),
              MyStyle().titleH1('มหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรี'),
              newLogo1(),
            ],
          ),
        ),
      ),
    );
  }
}
