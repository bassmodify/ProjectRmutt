import 'package:flutter/material.dart';

class MyStyle {
  Color color1 = Color(0xffe2c092);
  Color color2 = Color(0xffdd0808);

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

  MyStyle();
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'คำนำหน้า';
  late double screen;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['คำนำหน้า', 'นาย', 'นางสาว', 'นาง']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


class Educationalqualification extends StatefulWidget {
  const Educationalqualification({Key? key}) : super(key: key);

  @override
  State<Educationalqualification> createState() => _EducationalqualificationState();
}
class _EducationalqualificationState extends State<Educationalqualification> {
  String dropdownValue = 'วุฒิการศึกษาที่จบ';
  late double screen;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['วุฒิการศึกษาที่จบ', 'ปวช', 'ปวส', 'กศน']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
