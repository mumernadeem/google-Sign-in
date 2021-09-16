import 'package:flutter/material.dart';
import 'package:wait/provider.dart';
import 'package:wait/google_signup_button.dart';
class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>buildSignUp();
  Widget buildSignUp()=>Column(
    children: [
      Spacer(),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: 175,
          child: Text(
            'Welcome Back To MyApp',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Spacer(),
      GoogleSignupButtonWidget(),
      SizedBox(height: 12,),
      Text('Login to Continue',style: TextStyle(
        fontSize: 16
      ),),
      Spacer(),
    ],
  );
}
