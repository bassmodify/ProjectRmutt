import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';


class Uploadregistrationdocuments extends StatefulWidget {
  const Uploadregistrationdocuments({Key? key}) : super(key: key);

  @override
  State<Uploadregistrationdocuments> createState() => _UploadregistrationdocumentsState();
}

class _UploadregistrationdocumentsState extends State<Uploadregistrationdocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text("อัพโหลดเอกสารขึ้นทะเบียนนักศึกษา"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "เอกสารในการขึ้นทะเบียนนักศึกษา",
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
              "ก่อนอัพโหลดหลักฐานการขึ้นทะเบียน",
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "เอกสารผลการเรียนฉบับสมบูรณ์",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var gradepapers = await FilePicker.platform.pickFiles();

                if (gradepapers != null) {
                  print(gradepapers.files.first.name);
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
              "รูปถ่ายหน้าตรงขนาด 1 นิ้ว",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var straightFacePhoto = await FilePicker.platform.pickFiles();

                if (straightFacePhoto != null) {
                  print(straightFacePhoto.files.first.name);
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
            Text("ไฟล์ jpg, png เท่านั้น"),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}