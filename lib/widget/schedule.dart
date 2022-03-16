
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
                       <MRegis_Calendar xmlns="http://tempuri.org/" />
                     </soap:Body>
                  </soap:Envelope>''';

  MapProvider() {
    this.getCalenders();
  }

  Future<List<MapCalenders>> getCalenders() async {
    final resp = await http.post(
      url,
      headers: {
        "Content-Type": "text/xml; charset=utf-8",
        "SOAPAction": "http://tempuri.org/MRegis_Calendar"
      },
      body: _body,
    );
    if (resp.statusCode == 200) {
      var responseBody = resp.body;

      var parseXml = xml.XmlDocument.parse(responseBody).innerText;

      final decodeJson = jsonDecode(parseXml) as List;
      List<MapCalenders> data =
          decodeJson.map((e) => MapCalenders.fromJson(e)).toList();
      print(data);
      return data;
    } else {
      throw ("Something Error!");
    }
  }
}

class Schedule extends StatefulWidget {
  Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final mapProvider = MapProvider();

  Future<List<MapCalenders>>? mapa;

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
              AsyncSnapshot<List<MapCalenders>> snapshot) {
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
                        Text('${data?[index].topic}'),
                        SizedBox(
                          height: 15,
                        ),
                        Text('วันเริ่มต้น ${data?[index].startdate}'),
                        SizedBox(
                          height: 15,
                        ),
                        Text('วันสิ้นสุด ${data?[index].stopdate}'),
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
