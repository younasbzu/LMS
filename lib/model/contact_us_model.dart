// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactModel {
  String? name;
  String? email;
  String? depart;
  String? msg;
  String? id;
  ContactModel({
    this.name,
    this.email,
    this.depart,
    this.msg,
    this.id,
  });

  ContactModel copyWith({
    String? name,
    String? email,
    String? depart,
    String? msg,
    String? id,
  }) {
    return ContactModel(
      name: name ?? this.name,
      email: email ?? this.email,
      depart: depart ?? this.depart,
      msg: msg ?? this.msg,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'depart': depart,
      'msg': msg,
      'id': id,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      depart: map['depart'] != null ? map['depart'] as String : null,
      msg: map['msg'] != null ? map['msg'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContactModel(name: $name, email: $email, depart: $depart, msg: $msg, id: $id)';
  }

  @override
  bool operator ==(covariant ContactModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.depart == depart &&
        other.msg == msg &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        depart.hashCode ^
        msg.hashCode ^
        id.hashCode;
  }
}
