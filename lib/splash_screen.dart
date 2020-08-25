import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1c252e),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200,
                width: 200,
                child: Shimmer.fromColors(
                    child: Image(image: AssetImage('assets/images/901.png')),
                    baseColor: Color(0xFFFF4554),
                    highlightColor: Color(0xFFc5002b).withOpacity(0.4)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
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
                    children: [SignInText(), IconStack()],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Sign in',
          style: TextStyle(
              color: Color(0xFF1c252e),
              fontSize: 25,
              fontWeight: FontWeight.w500)),
    );
  }
}

class IconStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Icon(Icons.remove,
              color: Color(0xFF1c252e).withOpacity(0.8), size: 45),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child:
                Icon(Icons.navigate_next, color: Color(0xFF1c252e), size: 55),
          ),
        ),
      ],
    );
  }
}
