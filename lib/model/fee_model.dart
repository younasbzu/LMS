// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeeModel {
  String? title;
  String? dueDate;
  String? ammount;
  String? challanNo;
  String? feeId;
  String? bankname;
  String? cardno;
  FeeModel({
    this.title,
    this.dueDate,
    this.ammount,
    this.challanNo,
    this.feeId,
    this.bankname,
    this.cardno,
  });

  FeeModel copyWith({
    String? title,
    String? dueDate,
    String? ammount,
    String? challanNo,
    String? feeId,
    String? bankname,
    String? cardno,
  }) {
    return FeeModel(
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      ammount: ammount ?? this.ammount,
      challanNo: challanNo ?? this.challanNo,
      feeId: feeId ?? this.feeId,
      bankname: bankname ?? this.bankname,
      cardno: cardno ?? this.cardno,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'dueDate': dueDate,
      'ammount': ammount,
      'challanNo': challanNo,
      'feeId': feeId,
      'bankname': bankname,
      'cardno': cardno,
    };
  }

  factory FeeModel.fromMap(Map<String, dynamic> map) {
    return FeeModel(
      title: map['title'] != null ? map['title'] as String : null,
      dueDate: map['dueDate'] != null ? map['dueDate'] as String : null,
      ammount: map['ammount'] != null ? map['ammount'] as String : null,
      challanNo: map['challanNo'] != null ? map['challanNo'] as String : null,
      feeId: map['feeId'] != null ? map['feeId'] as String : null,
      bankname: map['bankname'] != null ? map['bankname'] as String : null,
      cardno: map['cardno'] != null ? map['cardno'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeeModel.fromJson(String source) =>
      FeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FeeModel(title: $title, dueDate: $dueDate, ammount: $ammount, challanNo: $challanNo, feeId: $feeId, bankname: $bankname, cardno: $cardno)';
  }

  @override
  bool operator ==(covariant FeeModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.dueDate == dueDate &&
        other.ammount == ammount &&
        other.challanNo == challanNo &&
        other.feeId == feeId &&
        other.bankname == bankname &&
        other.cardno == cardno;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        dueDate.hashCode ^
        ammount.hashCode ^
        challanNo.hashCode ^
        feeId.hashCode ^
        bankname.hashCode ^
        cardno.hashCode;
  }
}
