import 'package:application_project/map.dart';
import 'package:application_project/utility/my_style.dart';
// import 'package:application_project/widget/enroll.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml/xml.dart' as xml;

class CheckRegis extends StatefulWidget {
  const CheckRegis({Key? key}) : super(key: key);

  @override
  _CheckRegisState createState() => _CheckRegisState();
}

class _CheckRegisState extends State<CheckRegis> {
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
          title: Text('????????????????????????????????????'),
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
                    Text(
                      "??????????????????????????????????????????????????????????????????",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: idStudent2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "????????????????????????????????????????????????????????????????????????????????????????????? -",
                        helperText: "???????????????????????????????????????????????????????????????????????????",
                        
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
                              print(idNumberSend);
                            });
                            mapDataStatus.clear();
                            mapDataStatus.addAll(await getStatus());
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  if (mapDataStatus.isEmpty) {
                                    return AlertDialog(
                                      title: Center(child: Text("???????????????")),
                                      content: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          child: Center(
                                              child: Text("?????????????????????????????????"))),
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
                                              "????????????",
                                            ))),
                                      ],
                                    );
                                  } else {
                                    return AlertDialog(
                                      titlePadding: EdgeInsets.only(top: 0),
                                      title: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              child: Icon(Icons.cancel),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.2,
                                        child: Column(
                                          children: [
                                            Text(
                                              "???????????????",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                "???????????? ${mapDataStatus.first.firstnameth} ????????????????????? ${mapDataStatus.first.lastnameth}"),
                                            Text(
                                                "???????????????????????? ${mapDataStatus.first.majorCode}"),
                                            Text(
                                                "??????????????? ${mapDataStatus.first.status}"),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        (mapDataStatus.first.status == "????????????")
                                            ? ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: MyStyle().color2,
                                                ),
                                                onPressed: () {
                                                  Navigator.popAndPushNamed(
                                                      context,
                                                      '/studentregistration');
                                                },
                                                child: Center(
                                                    child: Text(
                                                  "????????????????????????????????????????????????????????????",
                                                )))
                                            : ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: MyStyle().color2,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Center(
                                                    child: Text(
                                                  "????????????",
                                                ))),
                                      ],
                                    );
                                  }
                                });
                          },
                          child: Text("?????????????????????"),
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
