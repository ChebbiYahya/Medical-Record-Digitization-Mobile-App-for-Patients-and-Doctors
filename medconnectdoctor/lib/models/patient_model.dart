import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNum;
  final String? password;

  const PatientModel({
    this.id,
    this.email,
    this.password,
    this.fullName,
    this.phoneNum,
  });
  PatientModel setId(String IdUser) {
    return PatientModel(
      id: IdUser,
      email: this.email,
      password: this.password,
      fullName: this.fullName,
      phoneNum: this.phoneNum,
    );
  }

  toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "phoneNum": phoneNum,
      "password": password,
    };
  }

  factory PatientModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PatientModel(
      id: document.id,
      email: data["email"],
      password: data["password"],
      fullName: data["fullName"],
      phoneNum: data["phoneNum"],
    );
  }
}
