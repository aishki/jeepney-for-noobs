import 'package:flutter/material.dart';
import 'package:jeepneyfornoobs_flutter/components/square_tile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'lib/assets/login_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  //Log in Text
                  children: [
                    SizedBox(height: 230),

                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    //Email and Password TextFields
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xFF898A8D),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color(0xFF898A8D),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 1.43,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),

                    //Forgot Password Text
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    //Login Button
                    Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: ShapeDecoration(
                        color: Color(0xFF000113),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 1.43,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),

                    //Or continue with Text
                    Center(child: Text('Or continue with')),
                    SizedBox(height: 15),

                    //Google and Apple Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: SquareTile(
                            imagePath: 'lib/assets/google_logo.png',
                            label: 'Google',
                          ),
                        ),
                        SizedBox(width: 13),
                        Expanded(
                          child: SquareTile(
                            imagePath: 'lib/assets/apple.png',
                            label: 'Apple',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    //Create Account Text
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: 'Don’t have an account? '),
                            TextSpan(
                              text: 'Create now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
