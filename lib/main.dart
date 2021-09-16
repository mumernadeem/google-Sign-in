import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wait/logged_in_widget.dart';
import 'package:wait/provider.dart';
import 'package:wait/sign_up_widget.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context)=>GoogleSignInProvider(),
        child:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            final provider =Provider.of<GoogleSignInProvider>(context,listen: false);
            if(provider.isSigningIn){
              return buildLoading();
            }
            else if(snapshot.hasData){
              return LoggedInWidget();
            }
            else{
              return SignUpWidget();
            }
            return SignUpWidget();
          },
        ),
      ),
    );
  }
  Widget buildLoading()=>Center(child: CircularProgressIndicator(),);
}
