import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingInProvider with ChangeNotifier {
  //Capturar el numero de telefono para el registro y el codigo
  String _phone = '';
  String verifyId = '';
  String verificationCode = '';
  String code = '';

  //Validacion de roles que escoja el usuario
  String _rolUser = '';
  bool _now = false;

  //Datos de usuario
  String jobTitle = '';
  String surname = '';
  String interest = '';
  String email = '';
  String compagy = '';
  String webSite = '';
  String address = '';
  String numberPhone = '';

  String get rolUser => _rolUser;
  bool get now => _now;

  set rolUser(String rol) {
    _rolUser = rol;
  }

  set now(bool now) {
    _now = now;
    notifyListeners();
  }

  set phone(String phone) {
    _phone = phone;
    //notifyListeners();
  }

  //MEtodo para mandar el codigo al telefono ingresado
  Future sendPhone(BuildContext context) async {
    if (_phone.isEmpty) return;
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: _phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException authException) {
          print("exception $authException");
        },
        codeSent: (String verificationId, int? resendCode) {
          verificationCode = verificationId;
          verifyId = verificationId;

          Navigator.pushNamed(context, 'codePage');
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationCode = verificationId;
          verifyId = verificationId;
          notifyListeners();
        },
        timeout: const Duration(seconds: 2),
      );
    } catch (e) {
      print(e);
    }
  }

  //Metodo para validar el codigo
  Future validateCode(BuildContext context) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      var credential = PhoneAuthProvider.credential(
        verificationId: verifyId,
        smsCode: code,
      );
      await auth.signInWithCredential(credential);
      Navigator.pushReplacementNamed(context, 'skilsPage');
    } catch (e) {
      print(e);
    }
  }

  //Metodo para mandar a guardar los datos del registro
  Future enviarRegistroPro(BuildContext context) async {
    if (_rolUser != 'PROFESSIONAL') {
      if (jobTitle.isEmpty || email.isEmpty || surname.isEmpty || interest.isEmpty || address.isEmpty || numberPhone.isEmpty) return;
    }
    if (jobTitle.isEmpty || email.isEmpty || compagy.isEmpty || webSite.isEmpty || address.isEmpty || numberPhone.isEmpty) return;

    try {
      final db = FirebaseFirestore.instance;
      final user = <String, dynamic>{
        "jobTitle": jobTitle,
        "email": email,
        "compagny": compagy,
        "webSite": webSite,
        "address": address,
        "phoneNumer": numberPhone,
        "rol": _rolUser,
        "name": jobTitle,
        "surname": surname,
        "interest": interest,
      };
      await db.collection("users").add(user);
      Navigator.pushNamedAndRemoveUntil(context, 'perfilUser', (route) => false);
    } catch (e) {
      print('Error mandar Datos: $e');
    }
  }
}
