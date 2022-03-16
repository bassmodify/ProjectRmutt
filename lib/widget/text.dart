
import 'package:application_project/map.dart';
import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml/xml.dart' as xml;

class MapProvider {
  final url = Uri.parse(
      "http://doc.oreg.rmutt.ac.th/OREGWebService/StudentProject.asmx");
  final _body = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <MRegis_InterviewStatusByID xmlns="http://tempuri.org/">
      <idcard>1849901640921</idcard>
    </MRegis_InterviewStatusByID>
  </soap:Body>
</soap:Envelope>''';

  MapProvider() {
    this.getCalenders();
  }

  Future<List<MapStatusByAll>> getCalenders() async {
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

      var parseXml = xml.XmlDocument.parse(responseBody).innerText;

      final decodeJson = jsonDecode(parseXml) as List;
      List<MapStatusByAll> data =
          decodeJson.map((e) => MapStatusByAll.fromJson(e)).toList();
      print(data);
      return data;
    } else {
      throw ("Something Error!");
    }
  }
}

class Schedule1 extends StatefulWidget {
  Schedule1({Key? key}) : super(key: key);

  @override
  State<Schedule1> createState() => _Schedule1State();
}

class _Schedule1State extends State<Schedule1> {
  final mapProvider = MapProvider();

  Future<List<MapStatusByAll>>? mapa;

  @override
  void initState() {
    super.initState();
    mapa = mapProvider.getCalenders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('กำหนดการ'),
      ),
      body: Container(
        child: FutureBuilder(
          future: mapa,
          builder: (BuildContext context,
              AsyncSnapshot<List<MapStatusByAll>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              final data = snapshot.data;
              return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text('รหัส ${data?[index].idcard}'),
                        SizedBox(
                          height: 15,
                        ),
                        Text('ชื่อ ${data?[index].firstnameth}'),
                        SizedBox(
                          height: 15,
                        ),
                        Text('สถานะ ${data?[index].status}'),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
