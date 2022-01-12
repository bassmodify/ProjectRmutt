import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({ Key? key }) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  late double screen;


  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('กำหนดการ'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              newLogo7(),
              MyStyle().titleH1('กำหนดการสำคัญต่างๆ'),
              MyStyle().titleH1('ของทางมหาลัย'),
            ],
          ),
        ),
      ),
    );
  }

  Container newLogo7() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: screen * 0.2,
      child: MyStyle().showLogo7(),
    );
  }
}