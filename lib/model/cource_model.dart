// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CourceModel {
  String? title;
  String? cHourse;
  String? courceId;
  int? smester;
  CourceModel({
    this.title,
    this.cHourse,
    this.courceId,
    this.smester,
  });

  CourceModel copyWith({
    String? title,
    String? cHourse,
    String? courceId,
    int? smester,
  }) {
    return CourceModel(
      title: title ?? this.title,
      cHourse: cHourse ?? this.cHourse,
      courceId: courceId ?? this.courceId,
      smester: smester ?? this.smester,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'cHourse': cHourse,
      'courceId': courceId,
      'smester': smester,
    };
  }

  factory CourceModel.fromMap(Map<String, dynamic> map) {
    return CourceModel(
      title: map['title'] != null ? map['title'] as String : null,
      cHourse: map['cHourse'] != null ? map['cHourse'] as String : null,
      courceId: map['courceId'] != null ? map['courceId'] as String : null,
      smester: map['smester'] != null ? map['smester'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourceModel.fromJson(String source) =>
      CourceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourceModel(title: $title, cHourse: $cHourse, courceId: $courceId, smester: $smester)';
  }

  @override
  bool operator ==(covariant CourceModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.cHourse == cHourse &&
        other.courceId == courceId &&
        other.smester == smester;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        cHourse.hashCode ^
        courceId.hashCode ^
        smester.hashCode;
  }
}
