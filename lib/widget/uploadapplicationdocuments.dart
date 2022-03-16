import 'package:file_picker/file_picker.dart';
import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';

class Uploadapplicationdocuments extends StatefulWidget {
  Uploadapplicationdocuments({Key? key}) : super(key: key);

  @override
  State<Uploadapplicationdocuments> createState() =>
      _UploadapplicationdocumentsState();
}

class _UploadapplicationdocumentsState
    extends State<Uploadapplicationdocuments> {
  late double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('อัพโหลดเอกสารสมัครเรียน'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "เอกสารในการสมัคร",
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "ผู้สมัครจะต้องรับรองสำเนาถูกต้อง",
              style: TextStyle(color: Colors.red),
            ),
            Text(
              "ในหลักฐานการสมัครของตนเองทุกหน้า",
              style: TextStyle(color: Colors.red),
            ),
            Text(
              "ก่อนอัพโหลดหลักฐานการสมัคร",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "สำเนาบัตรประชาชน",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () async {
                var copyofIDcard = await FilePicker.platform.pickFiles();

                if (copyofIDcard != null) {
                  print(copyofIDcard.files.first.name);
                }
              },
              child: Text(
                "เลือกไฟล์",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: MyStyle().color3,
                side: BorderSide(width: 1, color: Colors.black),
              ),
            ),
            Text("ไฟล์ pdf เท่านั้น"),
            SizedBox(
              height: 15,
            ),
            Text(
              "เอกสารผลการเรียน",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var gradepapers5 = await FilePicker.platform.pickFiles();

                if (gradepapers5 != null) {
                  print(gradepapers5.files.first.name);
                }
              },
              child: Text(
                "เลือกไฟล์",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  primary: MyStyle().color3,
                  side: BorderSide(width: 1, color: Colors.black)),
            ),
            Text("ไฟล์ pdf เท่านั้น"),
            SizedBox(
              height: 15,
            ),
            Text(
              "สำเนาใบเปลี่ยนชื่อ สกุล (ถ้ามี)",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () async {
                var nameChange = await FilePicker.platform.pickFiles();

                if (nameChange != null) {
                  print(nameChange.files.first.name);
                }
              },
              child: Text(
                "เลือกไฟล์",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: MyStyle().color3,
                side: BorderSide(width: 1, color: Colors.black),
              ),
            ),
            Text("ไฟล์ pdf เท่านั้น"),
            SizedBox(
              height: 15,
            ),
            Text(
              "Portfolio (แฟ้มสะสมผลงาน)",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () async {
                var picked4 = await FilePicker.platform.pickFiles();

                if (picked4 != null) {
                  print(picked4.files.first.name);
                }
              },
              child: Text(
                "เลือกไฟล์",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: MyStyle().color3,
                side: BorderSide(width: 1, color: Colors.black),
              ),
            ),
            Text("ไฟล์ pdf เท่านั้น"),
          ],
        ),
      ),
    );
  }
}
