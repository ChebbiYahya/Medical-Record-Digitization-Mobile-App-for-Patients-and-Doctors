import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNum;
  final String? password;
  final String? specialite;
  final String? location;
  final List listPatinet;
  const UserModel({
    this.id,
    this.email,
    this.password,
    this.fullName,
    this.phoneNum,
    this.specialite,
    this.location,
    this.listPatinet = const [],
  });
  UserModel setId(String IdUser) {
    return UserModel(
      id: IdUser,
      email: this.email,
      password: this.password,
      fullName: this.fullName,
      phoneNum: this.phoneNum,
      specialite: this.specialite,
      location: this.location,
      listPatinet: this.listPatinet,
    );
  }

  toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "phoneNum": phoneNum,
      "password": password,
      "specialite": specialite,
      "location": location,
      "listPatinet": listPatinet,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["email"],
      password: data["password"],
      fullName: data["fullName"],
      phoneNum: data["phoneNum"],
      specialite: data["specialite"],
      location: data["location"],
      listPatinet: data["listPatinet"] ?? [],
    );
  }
}
