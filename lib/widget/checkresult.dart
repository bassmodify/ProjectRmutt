import 'package:application_project/map.dart';
import 'package:application_project/utility/my_style.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml/xml.dart' as xml;

class CheckResultStatus extends StatefulWidget {
  const CheckResultStatus({Key? key}) : super(key: key);

  @override
  _CheckResultStatusState createState() => _CheckResultStatusState();
}

class _CheckResultStatusState extends State<CheckResultStatus> {
  late double screen;
  var _formkey = GlobalKey<FormState>();
  StudentStatus? mystatus;
  TextEditingController idStudent2 = TextEditingController();
  List<MapStatusByAll> mapDataStatus = [];

  String? idNumberSend;
  Future<List<MapStatusByAll>> getStatus() async {
    final url = Uri.parse(
        "http://doc.oreg.rmutt.ac.th/OREGWebService/StudentProject.asmx");
    final _body = '''<?xml version="1.0" encoding="utf-8"?>
                      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
                        <soap:Body>
                          <MRegis_InterviewStatusByID xmlns="http://tempuri.org/">
                            <idcard>$idNumberSend</idcard>
                          </MRegis_InterviewStatusByID>
                        </soap:Body>
                      </soap:Envelope>''';
    final resp = await http.post(
      url,
      headers: {
        "Content-Type": "text/xml; charset=utf-8",
        "SOAPAction": "http://tempuri.org/MRegis_InterviewStatusByID"
      },
      body: _body,
    );
    if (resp.statusCode == 200) {
      var responseBody = resp.body;

      var parseXmlStatus = xml.XmlDocument.parse(responseBody).innerText;

      final decodeJson = jsonDecode(parseXmlStatus) as List;
      List<MapStatusByAll> dataStatus =
          decodeJson.map((e) => MapStatusByAll.fromJson(e)).toList();
      print(dataStatus);

      return dataStatus;
    } else {
      throw ("Something Error!");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyStyle().color2,
          title: Text('ตรวจสอบสถานะ'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                  key: _formkey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: idStudent2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "กรอกหมายเลขบัตรประชาชน",
                        labelStyle: TextStyle(fontSize: 20),
                        hintText: "ใส่หมายเลขบัตรประชาชนไม่ต้องใส่ -",
                      ),
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            mystatus =
                                StudentStatus(idStudent: idStudent2.text);

                            setState(() {
                              idNumberSend = idStudent2.text;
                            });
                            mapDataStatus.addAll(await getStatus());
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  if (mapDataStatus.isEmpty) {
                                    return AlertDialog(
                                      title: Center(child: Text("สถานะ")),
                                      content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          child: Center(
                                              child: Text("ไม่พบข้อมูล"))),
                                      actions: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: MyStyle().color2,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Center(
                                                child: Text(
                                              "ตกลง",
                                            ))),
                                      ],
                                    );
                                  } else {
                                    return AlertDialog(
                                      title: Center(child: Text("สถานะ")),
                                      content: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: Column(
                                          children: [
                                            Text(
                                                "ชื่อ ${mapDataStatus.first.firstnameth} นามสกุล ${mapDataStatus.first.lastnameth}"),
                                            Text(
                                                "รหัสสาขา ${mapDataStatus.first.majorCode}"),
                                            Text(
                                                "สถานะ ${mapDataStatus.first.status}"),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: MyStyle().color2,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Center(
                                                child: Text(
                                              "ตกลง",
                                            ))),
                                      ],
                                    );
                                  }
                                });
                          },
                          child: Text("ตรวจสอบ"),
                          style: ElevatedButton.styleFrom(
                            primary: MyStyle().color2,
                          ),
                        )),
                  ]),
            ),
          ),
        ));
  }
}

class StudentStatus {
  String? idStudent;

  StudentStatus({this.idStudent});
}
