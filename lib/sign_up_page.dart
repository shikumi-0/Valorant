import 'package:flutter/material.dart';
import 'sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:toast/toast.dart';
import 'package:valorant/Components/sign_up_in_components.dart';

final FirebaseAuth mAuth = FirebaseAuth.instance;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFF3F3F3),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    CoverImage(imgPath: 'assets/images/902.jpg'),
                    ValorantTitle(),
                    _buildUsername(),
                    _buildEmail(),
                    _buildPassword(),
                    GestureDetector(
                      onTap: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        showToast("Successfully Registered",
                            gravity: Toast.BOTTOM,
                            duration: Toast.LENGTH_SHORT);

                        signUpWithEmailPassword();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Container(
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color(0xFFFF4554),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Color(0xFF1c252e),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Stack(
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Color(0xFF1c252e).withOpacity(0.8),
                                      size: 45,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 1.0),
                                      child: Icon(
                                        Icons.navigate_next,
                                        color: Color(0xFF1c252e),
                                        size: 55,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildUsername() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffE8F0FE),
        ),
        child: TextFormField(
          validator: (input) => input.isEmpty ? "*Required" : null,
          onSaved: (input) {
            userNameController.text = input;
          },
          decoration: InputDecoration(
            labelText: "Username",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Color(0xFFABB3C0),
                style: BorderStyle.solid,
              ),
            ),
            focusColor: Color(0xFFABB3C0),
            labelStyle: TextStyle(
                color: Color(0xFF6C7277),
                fontSize: 18,
                fontWeight: FontWeight.w600),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Color(0xFFABB3C0),
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffE8F0FE),
        ),
        child: TextFormField(
          controller: emailController,
          validator: (value) => !EmailValidator.validate(value)
              ? "Please enter a valid email"
              : null,
          onSaved: (input) {
            emailController.text = input;
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Color(0xFFABB3C0),
                style: BorderStyle.solid,
              ),
            ),
            focusColor: Color(0xFFABB3C0),
            labelStyle: TextStyle(
                color: Color(0xFF6C7277),
                fontSize: 18,
                fontWeight: FontWeight.w600),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Color(0xFFABB3C0),
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffE8F0FE),
        ),
        child: TextFormField(
          controller: passwordController,
          validator: (input) => input.isEmpty ? "*Required" : null,
          onSaved: (input) {
            passwordController.text = input;
          },
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Color(0xFFABB3C0),
                style: BorderStyle.solid,
              ),
            ),
            focusColor: Color(0xFFABB3C0),
            labelStyle: TextStyle(
                color: Color(0xFF6C7277),
                fontSize: 18,
                fontWeight: FontWeight.w600),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(
                color: Color(0xFFABB3C0),
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

  Future signUpWithEmailPassword() async {
    FirebaseUser user;
    try {
      user = (await mAuth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
    } catch (e) {
      print(e);
    }
  }
}
