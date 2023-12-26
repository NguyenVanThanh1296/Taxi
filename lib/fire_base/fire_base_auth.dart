import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String password, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      // Success
      if (user.user != null) {
        _createUser(user.user!.uid, name, phone, onSuccess, onRegisterError);
      }
    }).catchError((err) {
      _onSignInErr(err.code, onRegisterError);
    });
  }

  void signIn(String email, String password, Function onSuccess,
      Function(String) onSignInError) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      onSuccess();
    }).catchError((error) {
      onSignInError('Sign in fail. Please try again!!!');
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess,
      Function(String) onRegisterError) {
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("user");
    ref
        .child(userId)
        .set(user)
        .then((user) => {
              // Success
              onSuccess()
            })
        .catchError((err) {
      onRegisterError('Sing up fail, Please try again!!!');
    });
  }

  void _onSignInErr(String code, Function(String) onRegisterError) {
    switch (code) {
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onRegisterError('Invalid email');
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onRegisterError('Email has exist');
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError('The password is not strong enough');
        break;
      default:
        onRegisterError('Sign up fail, please try again!!!!');
        break;
    }
  }
}
