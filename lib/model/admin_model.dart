// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminModel {
  String? adminEmail;
  String? adminpass;
  String? adminId;
  String? adminImage;
  String? adminName;
  String? adminNumber;
  String? addedBy;
  int? status;
  AdminModel({
    this.adminEmail,
    this.adminpass,
    this.adminId,
    this.adminImage,
    this.adminName,
    this.adminNumber,
    this.addedBy,
    this.status,
  });

  AdminModel copyWith({
    String? adminEmail,
    String? adminpass,
    String? adminId,
    String? adminImage,
    String? adminName,
    String? adminNumber,
    String? addedBy,
    int? status,
  }) {
    return AdminModel(
      adminEmail: adminEmail ?? this.adminEmail,
      adminpass: adminpass ?? this.adminpass,
      adminId: adminId ?? this.adminId,
      adminImage: adminImage ?? this.adminImage,
      adminName: adminName ?? this.adminName,
      adminNumber: adminNumber ?? this.adminNumber,
      addedBy: addedBy ?? this.addedBy,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adminEmail': adminEmail,
      'adminpass': adminpass,
      'adminId': adminId,
      'adminImage': adminImage,
      'adminName': adminName,
      'adminNumber': adminNumber,
      'addedBy': addedBy,
      'status': status,
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      adminEmail:
          map['adminEmail'] != null ? map['adminEmail'] as String : null,
      adminpass: map['adminpass'] != null ? map['adminpass'] as String : null,
      adminId: map['adminId'] != null ? map['adminId'] as String : null,
      adminImage:
          map['adminImage'] != null ? map['adminImage'] as String : null,
      adminName: map['adminName'] != null ? map['adminName'] as String : null,
      adminNumber:
          map['adminNumber'] != null ? map['adminNumber'] as String : null,
      addedBy: map['addedBy'] != null ? map['addedBy'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminModel.fromJson(String source) =>
      AdminModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminModel(adminEmail: $adminEmail, adminpass: $adminpass, adminId: $adminId, adminImage: $adminImage, adminName: $adminName, adminNumber: $adminNumber, addedBy: $addedBy, status: $status)';
  }

  @override
  bool operator ==(covariant AdminModel other) {
    if (identical(this, other)) return true;

    return other.adminEmail == adminEmail &&
        other.adminpass == adminpass &&
        other.adminId == adminId &&
        other.adminImage == adminImage &&
        other.adminName == adminName &&
        other.adminNumber == adminNumber &&
        other.addedBy == addedBy &&
        other.status == status;
  }

  @override
  int get hashCode {
    return adminEmail.hashCode ^
        adminpass.hashCode ^
        adminId.hashCode ^
        adminImage.hashCode ^
        adminName.hashCode ^
        adminNumber.hashCode ^
        addedBy.hashCode ^
        status.hashCode;
  }
}
