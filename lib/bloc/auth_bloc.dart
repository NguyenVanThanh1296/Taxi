import 'dart:async';

import 'package:taxi/fire_base/fire_base_auth.dart';

class AuthBloc {
  final _firebaseAuth = FireAuth();

  final StreamController _nameController = StreamController();
  final StreamController _emailController = StreamController();
  final StreamController _passwordController = StreamController();
  final StreamController _numberPhoneController = StreamController();

  Stream get nameStream => _nameController.stream;

  Stream get emailStream => _emailController.stream;

  Stream get passwordStream => _passwordController.stream;

  Stream get numberPhoneStream => _numberPhoneController.stream;

  bool isValid(String name, String email, String password, String phone) {
    if (name.isEmpty) {
      _nameController.sink.addError('Nhap ten');
      return false;
    }
    _nameController.sink.add('OK');

    if (phone.isEmpty) {
      _numberPhoneController.sink.addError('Nhap phone');
      return false;
    }
    _numberPhoneController.sink.add('OK');

    if (email.isEmpty) {
      _emailController.sink.addError('Nhap email');
      return false;
    }
    _emailController.sink.add('OK');

    if (password.isEmpty || password.length < 6) {
      _passwordController.sink.addError('Password phai co du 6 ki tu');
      return false;
    }
    _passwordController.sink.add('OK');

    return true;
  }

  void signUp(String email, String password, String phone, String name,
      Function onSuccess, Function(String) onRegisterError) {
    _firebaseAuth.signUp(
        email, password, name, phone, onSuccess, onRegisterError);
  }

  void signIn(String email, String password, Function onSuccess,
      Function(String) onRegisterError){
    _firebaseAuth.signIn(email, password, onSuccess, onRegisterError);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _numberPhoneController.close();
    _passwordController.close();
  }
}
