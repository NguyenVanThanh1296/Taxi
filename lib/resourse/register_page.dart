import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi/bloc/auth_bloc.dart';
import 'package:taxi/resourse/dialog/loading_dialog.dart';
import 'package:taxi/resourse/dialog/message_dialog.dart';
import 'package:taxi/resourse/home_page.dart';
import 'dart:developer' as dev;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc = AuthBloc();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    authBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff3277D8)),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 140),
              SizedBox(
                  height: 120,
                  width: 260,
                  child: Image.asset('assets/ic_car_red.png')),
              const SizedBox(height: 32),
              const Text(
                'Welcome Aboard!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sigup with iCab in simple step!',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              const SizedBox(height: 40),
              StreamBuilder(
                  stream: authBloc.nameStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _nameController,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: 'Name',
                          prefixIcon: SizedBox(
                            width: 50,
                            child: Image.asset('assets/ic_user_16x16.png'),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    );
                  }),
              const SizedBox(height: 16),
              StreamBuilder(
                  stream: authBloc.numberPhoneStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _phoneController,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: 'Phone Number',
                          prefixIcon: SizedBox(
                            width: 50,
                            child: Image.asset('assets/ic_phone_16x16.png'),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    );
                  }),
              const SizedBox(height: 16),
              StreamBuilder(
                  stream: authBloc.emailStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: 'Email',
                          prefixIcon: SizedBox(
                            width: 50,
                            child: Image.asset('assets/ic_email_16x16.png'),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    );
                  }),
              const SizedBox(height: 16),
              StreamBuilder(
                  stream: authBloc.passwordStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: 'Password',
                          prefixIcon: SizedBox(
                            width: 50,
                            child: Image.asset('assets/ic_password_16x16.png'),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFCED0D2), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                      onPressed: _onSignUpClick,
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                child: RichText(
                    text: TextSpan(
                  text: 'Already s user?',
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xff606470)),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                        text: ' Login now',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.blue))
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSignUpClick() {
    setState(() {
      var isValid = authBloc.isValid(
          _nameController.text,
          _emailController.text,
          _passwordController.text,
          _phoneController.text);

      if (isValid) {
        // Create user
        LoadingDialog.showLoadingDialog(context, "Loading...");
        authBloc.signUp(_emailController.text, _passwordController.text,
            _phoneController.text, _nameController.text, () {
          LoadingDialog.hideLoadingDialog(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }, (msg) {
              LoadingDialog.hideLoadingDialog(context);
              MessageDialog.showMessageDialog(context, "Sign-In", msg);
            });
      }
    });
  }
}
