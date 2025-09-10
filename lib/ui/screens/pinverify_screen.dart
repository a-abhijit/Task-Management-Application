import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/screens/signup_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class PinVerifyScreen extends StatefulWidget {
  const PinVerifyScreen({super.key});

  @override
  State<PinVerifyScreen> createState() => _PinVerifyScreenState();
}

class _PinVerifyScreenState extends State<PinVerifyScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailTEcontrol = TextEditingController();
  final TextEditingController _passTEcontrol = TextEditingController();

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
                        "Pin Verification",
                        style: Theme.of(context).textTheme.titleLarge
                        ),
                      Text("Enter the 6 digit verification pin sent to your email",style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(height: 30),
                      Container(
                        width: 350,
                
                        child: TextFormField(
                          controller: _emailTEcontrol,
                          decoration: InputDecoration(hintText: 'Email'),
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
                

                      SizedBox(height: 25),
                      FilledButton(
                        onPressed: () {
                          if(_formkey.currentState?.validate()==false){
                            return;
                          }




                        },
                        child: Icon(Icons.arrow_circle_right_outlined,size: 30,),
                
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


  void _loginScreen(){
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEcontrol.dispose();
    _passTEcontrol.dispose();
  }
}
