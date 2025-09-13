import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/screens/pinverify_screen.dart';
import 'package:task_manager/ui/screens/signup_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import 'login_screen.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passTEcontrol = TextEditingController();
  final TextEditingController _emailTEcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Set New Password",
                          style: Theme.of(context).textTheme.titleLarge
                      ),

                      SizedBox(height: 20),
                      Container(
                        width: 350,

                        child: TextFormField(
                          controller: _emailTEcontrol,
                          decoration: InputDecoration(hintText: 'New Password'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email can't be empty";
                            }else if(_emailTEcontrol.text[0] != _emailTEcontrol.text[0].toLowerCase()){
                              return "Email must start with a lowercase";
                            }else if(
                            _emailTEcontrol.text.contains("@") == false
                            ){
                              return "Email must contain @";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 20),
                      Container(
                        width: 350,

                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password can't be empty";
                            }else if(_passTEcontrol.text.length<6){
                              return "Password must contain 6 characters";
                            }return null;
                          },
                          controller: _passTEcontrol,
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Confirm Password'),
                        ),
                      ),
                

                      SizedBox(height: 25),
                      FilledButton(
                        onPressed: () {
                          if(_formkey.currentState?.validate()==false){
                            return;
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PinVerifyScreen()));
                        },
                        child: Icon(Icons.arrow_circle_right_outlined),
                
                      ),
                
                      SizedBox(height: 25,),

                      RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                                text: " Sign in",
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()..onTap=_loginScreen
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _loginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

  @override
  void dispose() {
    _passTEcontrol.dispose();
    _passTEcontrol.dispose();
  }
}
