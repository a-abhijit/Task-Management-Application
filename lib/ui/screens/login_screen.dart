import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/screens/forgotpass_screen.dart';
import 'package:task_manager/ui/screens/navigation_bar_holder.dart';
import 'package:task_manager/ui/screens/signup_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                        "Get Started With",
                        style: Theme.of(context).textTheme.titleLarge
                        ),
                
                      SizedBox(height: 20),
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
                          decoration: InputDecoration(hintText: 'Password'),
                        ),
                      ),
                      SizedBox(height: 25),
                      FilledButton(
                        onPressed: () {
                          if(_formkey.currentState?.validate()==false){
                            return;
                          }

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationBarHolder()));
                        },
                        child: Icon(Icons.arrow_circle_right_outlined,size: 30,),
                
                      ),
                
                      SizedBox(height: 10),
                
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotpassScreen()));



                        },
                        child: Text("Forgot Password ?"),
                      ),
                
                
                      SizedBox(height: 25,),
                
                      RichText(
                        text: TextSpan(
                          text: "Don't have account?",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: " Sign up",
                              style: TextStyle(color: Colors.green),
                              recognizer: TapGestureRecognizer()..onTap = _onTabSignup,
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
  
  
  void _onTabSignup(){
    Navigator.pushReplacementNamed(context, '/signupscreen');
  }

  @override
  void dispose() {
    _emailTEcontrol.dispose();
    _passTEcontrol.dispose();
  }
}
