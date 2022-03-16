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
