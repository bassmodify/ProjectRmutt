import 'package:application_project/map.dart';
import 'package:application_project/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml/xml.dart' as xml;

class MapProviderCalaender {
  MapProviderCalaender() {
    this.getCalenders();
  }

  Future<List<MapCalenders>> getCalenders() async {
    final url = Uri.parse(
        "http://doc.oreg.rmutt.ac.th/OREGWebService/StudentProject.asmx");
    final _body = '''<?xml version="1.0" encoding="utf-8"?>
                  <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
                    <soap:Body>
                       <MRegis_Calendar xmlns="http://tempuri.org/" />
                     </soap:Body>
                  </soap:Envelope>''';
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

      var parseXmlCalender = xml.XmlDocument.parse(responseBody).innerText;

      final decodeJson = jsonDecode(parseXmlCalender) as List;
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
  final mapProvider = MapProviderCalaender();
  late double screen;

  Future<List<MapCalenders>>? mapDataCalender;

  @override
  void initState() {
    super.initState();
    mapDataCalender = mapProvider.getCalenders();
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().color2,
        title: Text('กำหนดการ'),
      ),
      body: Container(
        child: FutureBuilder(
          future: mapDataCalender,
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
                  return Column(
                    children: [
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 60)),
                              Icon(
                                Icons.calendar_month,
                                size: screen*0.1,
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            '${data?[index].id} ${data?[index].topic}',
                            style: TextStyle(fontSize: screen*0.04),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 70)),
                          Text(
                            'วันที่ ${data?[index].startdate} - ${data?[index].stopdate}',
                            style: TextStyle(fontSize: screen*0.04),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        height: 25,
                        thickness: 5,
                      ),
                    ],
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
