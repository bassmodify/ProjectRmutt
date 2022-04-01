import 'dart:convert';

List<MapCalenders> mapCalendersFromJson(String str) => List<MapCalenders>.from(
    json.decode(str).map((x) => MapCalenders.fromJson(x)));

String mapCalendersToJson(List<MapCalenders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MapCalenders {
  MapCalenders({
    this.id,
    this.topic,
    this.startdate,
    this.stopdate,
  });

  int? id;
  String? topic;
  String? startdate;
  String? stopdate;

  factory MapCalenders.fromJson(Map<String, dynamic> json) => MapCalenders(
        id: json["id"] == null ? null : json["id"],
        topic: json["topic"] == null ? null : json["topic"],
        startdate: json["startdate"] == null ? null : json["startdate"],
        stopdate: json["stopdate"] == null ? null : json["stopdate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "topic": topic == null ? null : topic,
        "startdate": startdate == null ? null : startdate,
        "stopdate": stopdate == null ? null : stopdate,
      };
}

List<MapStatusByAll> mapStatusByAllFromJson(String str) => List<MapStatusByAll>.from(json.decode(str).map((x) => MapStatusByAll.fromJson(x)));

String mapStatusByAllToJson(List<MapStatusByAll> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MapStatusByAll {
    MapStatusByAll({
        this.idcard,
        this.firstnameth,
        this.lastnameth,
        this.majorCode,
        this.status,
    });

    String? idcard;
    String? firstnameth;
    String? lastnameth;
    String? majorCode;
    String? status;

    factory MapStatusByAll.fromJson(Map<String, dynamic> json) => MapStatusByAll(
        idcard: json["idcard"] == null ? null : json["idcard"],
        firstnameth: json["firstnameth"] == null ? null : json["firstnameth"],
        lastnameth: json["lastnameth"] == null ? null : json["lastnameth"],
        majorCode: json["major_code"] == null ? null : json["major_code"],
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "idcard": idcard == null ? null : idcard,
        "firstnameth": firstnameth == null ? null : firstnameth,
        "lastnameth": lastnameth == null ? null : lastnameth,
        "major_code": majorCode == null ? null : majorCode,
        "status": status == null ? null : status,
    };
}

List<Mapmajor> mapmajorFromJson(String str) =>
    List<Mapmajor>.from(json.decode(str).map((x) => Mapmajor.fromJson(x)));

String mapmajorToJson(List<Mapmajor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mapmajor {
  Mapmajor({
    this.facultyCode,
    this.majorName,
    this.roundId,
    this.majorCode,
    this.eduProgramId,
    this.gpax,
    this.amount,
    this.detail,
    this.credit1,
    this.gpax1,
    this.credit2,
    this.gpax2,
    this.credit3,
    this.gpax3,
    this.credit4,
    this.gpax4,
    this.credit5,
    this.gpax5,
    this.credit6,
    this.gpax6,
    this.credit7,
    this.gpax7,
    this.credit8,
    this.gpax8,
    this.credit9,
    this.gpax9,
  });

  int? facultyCode;
  String? majorName;
  int? roundId;
  String? majorCode;
  int? eduProgramId;
  double? gpax;
  int? amount;
  String? detail;
  int? credit1;
  double? gpax1;
  int? credit2;
  double? gpax2;
  int? credit3;
  double? gpax3;
  int? credit4;
  double? gpax4;
  int? credit5;
  double? gpax5;
  int? credit6;
  double? gpax6;
  int? credit7;
  double? gpax7;
  int? credit8;
  double? gpax8;
  int? credit9;
  double? gpax9;

  factory Mapmajor.fromJson(Map<String, dynamic> json) => Mapmajor(
        facultyCode: json["faculty_code"] == null ? null : json["faculty_code"],
        majorName: json["major_name"] == null ? null : json["major_name"],
        roundId: json["round_id"] == null ? null : json["round_id"],
        majorCode: json["MAJOR_CODE"] == null ? null : json["MAJOR_CODE"],
        eduProgramId:
            json["edu_program_id"] == null ? null : json["edu_program_id"],
        gpax: json["GPAX"] == null ? null : json["GPAX"].toDouble(),
        amount: json["AMOUNT"] == null ? null : json["AMOUNT"],
        detail: json["DETAIL"] == null ? null : json["DETAIL"],
        credit1: json["credit1"] == null ? null : json["credit1"],
        gpax1: json["gpax1"] == null ? null : json["gpax1"],
        credit2: json["credit2"] == null ? null : json["credit2"],
        gpax2: json["gpax2"] == null ? null : json["gpax2"],
        credit3: json["credit3"] == null ? null : json["credit3"],
        gpax3: json["gpax3"] == null ? null : json["gpax3"],
        credit4: json["credit4"] == null ? null : json["credit4"],
        gpax4: json["gpax4"] == null ? null : json["gpax4"],
        credit5: json["credit5"] == null ? null : json["credit5"],
        gpax5: json["gpax5"] == null ? null : json["gpax5"],
        credit6: json["credit6"] == null ? null : json["credit6"],
        gpax6: json["gpax6"] == null ? null : json["gpax6"],
        credit7: json["credit7"] == null ? null : json["credit7"],
        gpax7: json["gpax7"] == null ? null : json["gpax7"],
        credit8: json["credit8"] == null ? null : json["credit8"],
        gpax8: json["gpax8"] == null ? null : json["gpax8"],
        credit9: json["credit9"] == null ? null : json["credit9"],
        gpax9: json["gpax9"] == null ? null : json["gpax9"],
      );

  Map<String, dynamic> toJson() => {
        "faculty_code": facultyCode == null ? null : facultyCode,
        "major_name": majorName == null ? null : majorName,
        "round_id": roundId == null ? null : roundId,
        "MAJOR_CODE": majorCode == null ? null : majorCode,
        "edu_program_id": eduProgramId == null ? null : eduProgramId,
        "GPAX": gpax == null ? null : gpax,
        "AMOUNT": amount == null ? null : amount,
        "DETAIL": detail == null ? null : detail,
        "credit1": credit1 == null ? null : credit1,
        "gpax1": gpax1 == null ? null : gpax1,
        "credit2": credit2 == null ? null : credit2,
        "gpax2": gpax2 == null ? null : gpax2,
        "credit3": credit3 == null ? null : credit3,
        "gpax3": gpax3 == null ? null : gpax3,
        "credit4": credit4 == null ? null : credit4,
        "gpax4": gpax4 == null ? null : gpax4,
        "credit5": credit5 == null ? null : credit5,
        "gpax5": gpax5 == null ? null : gpax5,
        "credit6": credit6 == null ? null : credit6,
        "gpax6": gpax6 == null ? null : gpax6,
        "credit7": credit7 == null ? null : credit7,
        "gpax7": gpax7 == null ? null : gpax7,
        "credit8": credit8 == null ? null : credit8,
        "gpax8": gpax8 == null ? null : gpax8,
        "credit9": credit9 == null ? null : credit9,
        "gpax9": gpax9 == null ? null : gpax9,
      };
}

