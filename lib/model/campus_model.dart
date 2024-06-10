// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CampusModel {
  String? campusname;
  String? campusId;
  String? campusCity;
  String? adminName;
  String? adminId;
  CampusModel({
    this.campusname,
    this.campusId,
    this.campusCity,
    this.adminName,
    this.adminId,
  });

  CampusModel copyWith({
    String? campusname,
    String? campusId,
    String? campusCity,
    String? adminName,
    String? adminId,
  }) {
    return CampusModel(
      campusname: campusname ?? this.campusname,
      campusId: campusId ?? this.campusId,
      campusCity: campusCity ?? this.campusCity,
      adminName: adminName ?? this.adminName,
      adminId: adminId ?? this.adminId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'campusname': campusname,
      'campusId': campusId,
      'campusCity': campusCity,
      'adminName': adminName,
      'adminId': adminId,
    };
  }

  factory CampusModel.fromMap(Map<String, dynamic> map) {
    return CampusModel(
      campusname:
          map['campusname'] != null ? map['campusname'] as String : null,
      campusId: map['campusId'] != null ? map['campusId'] as String : null,
      campusCity:
          map['campusCity'] != null ? map['campusCity'] as String : null,
      adminName: map['adminName'] != null ? map['adminName'] as String : null,
      adminId: map['adminId'] != null ? map['adminId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CampusModel.fromJson(String source) =>
      CampusModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CampusModel(campusname: $campusname, campusId: $campusId, campusCity: $campusCity, adminName: $adminName, adminId: $adminId)';
  }

  @override
  bool operator ==(covariant CampusModel other) {
    if (identical(this, other)) return true;

    return other.campusname == campusname &&
        other.campusId == campusId &&
        other.campusCity == campusCity &&
        other.adminName == adminName &&
        other.adminId == adminId;
  }

  @override
  int get hashCode {
    return campusname.hashCode ^
        campusId.hashCode ^
        campusCity.hashCode ^
        adminName.hashCode ^
        adminId.hashCode;
  }
}
