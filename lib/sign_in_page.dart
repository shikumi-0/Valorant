import 'package:flutter/material.dart';
import 'package:valorant/home_page.dart';
import 'package:valorant/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';
import 'package:valorant/Components/sign_up_in_components.dart';

final FirebaseAuth mAuth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  CoverImage(imgPath: 'assets/images/val.jpg'),
                  ValorantTitle(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffE8F0FE),
                      ),
                      child: TextFormField(
                        validator: (value) => !EmailValidator.validate(value)
                            ? "Please enter a valid email"
                            : null,
                        controller: emailController,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffE8F0FE),
                      ),
                      child:
                          PasswordField(passwordController: passwordController),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: GestureDetector(
                      onTap: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        signInWithEmailPassword();
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Raleway',
                                color: Color(0xFF1c252e),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF4554),
                                  borderRadius: BorderRadius.circular(30)),
                              height: 80,
                              width: 80,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white60,
                                      size: 45,
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(
                                        Icons.navigate_next,
                                        color: Colors.white,
                                        size: 55,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 40, 25, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: UnderlinedText(
                            text: 'Sign Up',
                          ),
                        ),
                        UnderlinedText(
                          text: 'Forget Password?',
                        ),
                      ],
                    ),
                  )
                ],
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

  Future signInWithEmailPassword() async {
    FirebaseUser user;
    try {
      user = (await mAuth.signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text))
          .user;

      // if user and password matches
      if (user != null) {
        print('signed in');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        showToast("Signed in!",
            gravity: Toast.BOTTOM, duration: Toast.LENGTH_LONG);
      }
    } catch (e) {
      print(e);
      // if user does not exist
      CupertinoAlertDialog dialog = new CupertinoAlertDialog(
        content: Text('Check your username and password'),
      );
      showDialog(
        context: context,
        child: dialog,
      );
    }
  }
}

class UnderlinedText extends StatelessWidget {
  final String text;
  UnderlinedText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xFF6C7277),
          decoration: TextDecoration.underline,
          fontSize: 23,
          fontWeight: FontWeight.w600,
          fontFamily: 'Raleway'),
    );
  }
}

class PasswordField extends StatelessWidget {
  PasswordField({@required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      validator: (input) => input.isEmpty ? "*Required" : null,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide:
              BorderSide(color: Color(0xFFABB3C0), style: BorderStyle.solid),
        ),
        focusColor: Color(0xFFABB3C0),
        labelStyle: TextStyle(
            color: Color(0xFF6C7277),
            fontSize: 18,
            fontWeight: FontWeight.w600),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide:
                BorderSide(color: Color(0xFFABB3C0), style: BorderStyle.solid)),
      ),
    );
  }
}
