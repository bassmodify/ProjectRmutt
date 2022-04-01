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

  Future<List<Mapmajor>> getCalenders() async {
    final url = Uri.parse(
        "http://doc.oreg.rmutt.ac.th/OREGWebService/StudentProject.asmx");
    final _body = '''<?xml version="1.0" encoding="utf-8"?>
                      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
                      <soap:Body>
                      <MRegis_Major xmlns="http://tempuri.org/" />
                     </soap:Body>
                    </soap:Envelope>''';
    final resp = await http.post(
      url,
      headers: {
        "Content-Type": "text/xml; charset=utf-8",
        "SOAPAction": "http://tempuri.org/MRegis_Major"
      },
      body: _body,
    );
    if (resp.statusCode == 200) {
      var responseBody = resp.body;

      var parseXmlCalender = xml.XmlDocument.parse(responseBody).innerText;

      final decodeJson = jsonDecode(parseXmlCalender) as List;
      List<Mapmajor> data =
          decodeJson.map((e) => Mapmajor.fromJson(e)).toList();
      print(data);
      return data;
    } else {
      throw ("Something Error!");
    }
  }
}

class BranchesOpen extends StatefulWidget {
  BranchesOpen({Key? key}) : super(key: key);

  @override
  State<BranchesOpen> createState() => _BranchesOpenState();
}

class _BranchesOpenState extends State<BranchesOpen> {
  final mapProvider = MapProviderCalaender();
  late double screen;

  Future<List<Mapmajor>>? mapDataCalender;

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
        title: Text('สาขาที่เปิดรับสมัคร'),
      ),
      body: Container(
        child: FutureBuilder(
          future: mapDataCalender,
          builder:
              (BuildContext context, AsyncSnapshot<List<Mapmajor>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              final data = snapshot.data;
              return ListView(children: <Widget>[
                // itemBuilder: (context, index) {

                Column(
                  children: [
                    //เทคคาโทรนิกส์
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[15].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[15].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Flexible(
                          child: Text(
                            'รายละเอียดคุณสมบัติ ${data?[15].detail}',
                            style: TextStyle(fontSize: screen * 0.04),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[15].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[15].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //ไฟฟ้า
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[33].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[33].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[33].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[33].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[33].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //เครื่องกล
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        
                        Text(
                          'รหัสวิชา ${data?[35].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[35].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[35].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[35].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[35].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //โยธา
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[39].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[39].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[39].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[39].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[39].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //อิเล็ก
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[40].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[40].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[40].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[40].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[40].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //คอม
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[41].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[41].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[41].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[41].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[41].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //วัสดุ
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[42].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[42].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[42].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[42].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[42].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //อิเล็ก
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[45].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[45].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[45].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[45].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[45].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //อิเล็กอากาศยาน
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[47].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[47].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[47].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[47].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[47].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //อุตสาหการระบบการผลิต
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[49].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[49].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[49].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[49].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[49].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //อุตสาหการ
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[50].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[50].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[50].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[50].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[50].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //เครื่องกลระบบราง
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[51].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[51].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[51].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[51].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[51].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                    //อุตสาหการ
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'รหัสวิชา ${data?[52].majorCode}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'ชื่อสาขาวิชา ${data?[52].majorName}',
                          style: TextStyle(fontSize: screen * 0.05),
                        ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                         Flexible(
                          child:
                        Text(
                          'รายละเอียดคุณสมบัติ ${data?[52].detail}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                         ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'เกรด ${data?[52].gpax}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          'จำนวนรับสมัคร ${data?[52].amount}',
                          style: TextStyle(fontSize: screen * 0.04),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                      thickness: 5,
                    ),
                  ],
                ),
                //};
              ]);
            }
          },
        ),
      ),
    );
  }
}
