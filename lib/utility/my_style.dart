import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


//เก็บโลโกและสี
class MyStyle {
  Color color1 = Color(0xffe2c092);
  Color color2 = Color(0xff990000);
  Color color3 = Color(0xffC0C0C0);

  Widget showLogoProfilt() => Image.asset('images/logoprofilt.png');
  Widget showLogo() => Image.asset('images/logo.png');
  Widget showLogo1() => Image.asset('images/logo1.png');
  Widget showLogo2() => Image.asset('images/logo2.png');
  Widget showLogo3() => Image.asset('images/logo3.png');
  Widget showLogo4() => Image.asset('images/logo4.png');
  Widget showLogo5() => Image.asset('images/logo5.png');
  Widget showLogo6() => Image.asset('images/logo6.png');
  Widget showLogo7() => Image.asset('images/logo7.png');
  Widget showLogo8() => Image.asset('images/logo8.png');
  Widget showLogo9() => Image.asset('images/logo9.png');
  Widget showLogo10() => Image.asset('images/logo10.png');
  Widget showLogo11() => Image.asset('images/logoprofile.png');

  Widget titleH1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget titleH2(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );

  MyStyle();
}

//ตัวแปรที่ใช้เก็บค่า
class SaveValue {
  String? nameTh,
      lastnameTh,
      nameEng,
      lastnameEng,
      idNumber,
      ethnicity,
      nationality,
      religion,
      telephone;
}

//วันเดือนปีเกิด
class ButtonHeaderWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;

  const ButtonHeaderWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HeaderWidget(
        title: title,
        child: ButtonWidget(
          text: text,
          onClicked: onClicked,
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
          primary: Colors.white,
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        onPressed: onClicked,
      );
}

class HeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const HeaderWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );
}

//ตัวแสดงวันเดือนปีเกิด
class NewDate extends StatefulWidget {
  const NewDate({Key? key}) : super(key: key);

  get date => null;

  @override
  _NewDateState createState() => _NewDateState();
}

class _NewDateState extends State<NewDate> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return 'วัน/เดือน/ปีเกิด';
    } else {
      return DateFormat('MM/dd/yyyy').format(date!);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Date',
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}


