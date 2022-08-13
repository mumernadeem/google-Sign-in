import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/src/fa_icon.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:wait/provider.dart';
class GoogleSignupButtonWidget extends StatelessWidget {
  const GoogleSignupButtonWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>Container(
    padding: EdgeInsets.all(4),
    child: OutlinedButton.icon(
      onPressed: (){
        final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
        provider.login();
      },
      icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
      label: Text('Sign in with Google',style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    ),
    ),
  );
}
