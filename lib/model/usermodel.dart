// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? pic;
  String? userId;
  String? number;
  String? name;
  String? fname;
  String? cnic;
  String? birthPlace;
  String? email;
  String? bloodgroup;
  String? campus;
  String? department;
  String? dob;
  String? gender;
  String? address;
  String? adminName;
  String? adminId;
  String? password;
  int? status;
  UserModel({
    this.pic,
    this.userId,
    this.number,
    this.name,
    this.fname,
    this.cnic,
    this.birthPlace,
    this.email,
    this.bloodgroup,
    this.campus,
    this.department,
    this.dob,
    this.gender,
    this.address,
    this.adminName,
    this.adminId,
    this.password,
    this.status,
  });

  UserModel copyWith({
    String? pic,
    String? userId,
    String? number,
    String? name,
    String? fname,
    String? cnic,
    String? birthPlace,
    String? email,
    String? bloodgroup,
    String? campus,
    String? department,
    String? dob,
    String? gender,
    String? address,
    String? adminName,
    String? adminId,
    String? password,
    int? status,
  }) {
    return UserModel(
      pic: pic ?? this.pic,
      userId: userId ?? this.userId,
      number: number ?? this.number,
      name: name ?? this.name,
      fname: fname ?? this.fname,
      cnic: cnic ?? this.cnic,
      birthPlace: birthPlace ?? this.birthPlace,
      email: email ?? this.email,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      campus: campus ?? this.campus,
      department: department ?? this.department,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      adminName: adminName ?? this.adminName,
      adminId: adminId ?? this.adminId,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pic': pic,
      'userId': userId,
      'number': number,
      'name': name,
      'fname': fname,
      'cnic': cnic,
      'birthPlace': birthPlace,
      'email': email,
      'bloodgroup': bloodgroup,
      'campus': campus,
      'department': department,
      'dob': dob,
      'gender': gender,
      'address': address,
      'adminName': adminName,
      'adminId': adminId,
      'password': password,
      'status': status,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      pic: map['pic'] != null ? map['pic'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      number: map['number'] != null ? map['number'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      fname: map['fname'] != null ? map['fname'] as String : null,
      cnic: map['cnic'] != null ? map['cnic'] as String : null,
      birthPlace:
          map['birthPlace'] != null ? map['birthPlace'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      bloodgroup:
          map['bloodgroup'] != null ? map['bloodgroup'] as String : null,
      campus: map['campus'] != null ? map['campus'] as String : null,
      department:
          map['department'] != null ? map['department'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      adminName: map['adminName'] != null ? map['adminName'] as String : null,
      adminId: map['adminId'] != null ? map['adminId'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(pic: $pic, userId: $userId, number: $number, name: $name, fname: $fname, cnic: $cnic, birthPlace: $birthPlace, email: $email, bloodgroup: $bloodgroup, campus: $campus, department: $department, dob: $dob, gender: $gender, address: $address, adminName: $adminName, adminId: $adminId, password: $password, status: $status)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.pic == pic &&
        other.userId == userId &&
        other.number == number &&
        other.name == name &&
        other.fname == fname &&
        other.cnic == cnic &&
        other.birthPlace == birthPlace &&
        other.email == email &&
        other.bloodgroup == bloodgroup &&
        other.campus == campus &&
        other.department == department &&
        other.dob == dob &&
        other.gender == gender &&
        other.address == address &&
        other.adminName == adminName &&
        other.adminId == adminId &&
        other.password == password &&
        other.status == status;
  }

  @override
  int get hashCode {
    return pic.hashCode ^
        userId.hashCode ^
        number.hashCode ^
        name.hashCode ^
        fname.hashCode ^
        cnic.hashCode ^
        birthPlace.hashCode ^
        email.hashCode ^
        bloodgroup.hashCode ^
        campus.hashCode ^
        department.hashCode ^
        dob.hashCode ^
        gender.hashCode ^
        address.hashCode ^
        adminName.hashCode ^
        adminId.hashCode ^
        password.hashCode ^
        status.hashCode;
  }
}
