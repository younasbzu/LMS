// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DepartmentModel {
  String? departname;
  String? departId;
  String? adminName;
  String? adminId;
  DepartmentModel({
    this.departname,
    this.departId,
    this.adminName,
    this.adminId,
  });

  DepartmentModel copyWith({
    String? departname,
    String? departId,
    String? adminName,
    String? adminId,
  }) {
    return DepartmentModel(
      departname: departname ?? this.departname,
      departId: departId ?? this.departId,
      adminName: adminName ?? this.adminName,
      adminId: adminId ?? this.adminId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'departname': departname,
      'departId': departId,
      'adminName': adminName,
      'adminId': adminId,
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
      departname:
          map['departname'] != null ? map['departname'] as String : null,
      departId: map['departId'] != null ? map['departId'] as String : null,
      adminName: map['adminName'] != null ? map['adminName'] as String : null,
      adminId: map['adminId'] != null ? map['adminId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DepartmentModel.fromJson(String source) =>
      DepartmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DepartmentModel(departname: $departname, departId: $departId, adminName: $adminName, adminId: $adminId)';
  }

  @override
  bool operator ==(covariant DepartmentModel other) {
    if (identical(this, other)) return true;

    return other.departname == departname &&
        other.departId == departId &&
        other.adminName == adminName &&
        other.adminId == adminId;
  }

  @override
  int get hashCode {
    return departname.hashCode ^
        departId.hashCode ^
        adminName.hashCode ^
        adminId.hashCode;
  }
}
