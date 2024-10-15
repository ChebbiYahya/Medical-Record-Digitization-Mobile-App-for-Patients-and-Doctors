import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medconnectdoctor/models/user_model.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
  }

//Create a user
  createUser(UserModel user) async {
    final docUser = _db.collection("Doctor").doc();
    user = user.setId(docUser.id);
    await docUser.set(user.toJson());
  }

//Sign Up
  Future<bool?> SignUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
  //Sign In

  Future<bool?> SignIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      print("succes");
      return true;
    } on FirebaseAuthException catch (e) {
      print("erreur");
      return false;
    }
  }

  //Forguet Password
  Future<bool?> ForguetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      print("succes");
      return true;
    } on FirebaseAuthException catch (e) {
      print("erreur");
      return false;
    }
  }

  //Logout
  Future<void> logout() async => await _auth.signOut();

  //Get User
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Doctor").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    return userData;
  }

  //Update User
  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("users").doc(user.id).update(user.toJson());
  }

  //add element to patient the list of doctor (list of patient)
  Future<void> addPatientToListOfDoctor(String userId, String element) async {
    try {
      final docRef = _db.collection("Doctor").doc(userId);
      await docRef.update({
        "listPatinet": FieldValue.arrayUnion([element]),
      });
    } catch (e) {
      print("Erreur lors de l'ajout de l'élément à la liste : $e");
      throw e;
    }
  }

  // return the list of patient of the doctor
  getListPatinetOfDoctor(String userId) async {
    try {
      final docSnapshot = await _db.collection("Doctor").doc(userId).get();
      if (docSnapshot.exists) {
        print("list from repo ${docSnapshot["listPatinet"]}");
        if (docSnapshot["listPatinet"] != []) {
          return docSnapshot["listPatinet"];
        } else {
          print(
              "La liste des patients est null pour l'utilisateur avec l'ID : $userId");
          return [];
        }
      } else {
        print(
            "Le document n'existe pas pour l'utilisateur avec l'ID : $userId");
        return [];
      }
    } catch (e) {
      print("Erreur lors de la récupération de la liste des patients : $e");
      throw e;
    }
  }
}
