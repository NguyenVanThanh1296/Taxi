import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi/bloc/auth_bloc.dart';
import 'package:taxi/resourse/dialog/loading_dialog.dart';
import 'package:taxi/resourse/dialog/message_dialog.dart';
import 'package:taxi/resourse/home_page.dart';
import 'package:taxi/resourse/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  AuthBloc authBloc = AuthBloc();
  final TextEditingController _emailController = TextEditingController();
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
                  child: Image.asset('assets/ic_car_green.png')),
              const SizedBox(height: 32),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 8),
              const Text(
                'Login to continue using iCab!',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 146, 0, 20),
                child: TextField(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: SizedBox(
                          width: 50,
                          child: Image.asset('assets/ic_email_16x16.png')),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              TextField(
                style: const TextStyle(fontSize: 18, color: Colors.black),
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: SizedBox(
                        width: 50,
                        child: Image.asset('assets/ic_password_16x16.png')),
                    border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              Container(
                alignment: AlignmentDirectional.centerEnd,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                      onPressed: _onLoginClick,
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                child: RichText(
                    text: TextSpan(
                  text: 'New user? ',
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xff606470)),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                          },
                        text: 'Sign up for a new account',
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

  void _onLoginClick() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomePage()));
    /*setState(() {
      LoadingDialog.showLoadingDialog(context, "Loading...");
      authBloc.signIn(_emailController.text, _passwordController.text, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      }, (p0) {
        LoadingDialog.hideLoadingDialog(context);
        MessageDialog.showMessageDialog(
            context, "Sign In", 'Sign in fail, please try again');
      });
    });*/
  }
}
