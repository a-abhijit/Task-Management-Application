import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailTEcontrol = TextEditingController();
  final TextEditingController _passTEcontrol = TextEditingController();
  final TextEditingController _firstNameTEcontrol = TextEditingController();
  final TextEditingController _lastNameTEcontrol = TextEditingController();
  final TextEditingController _mobileNoTEcontrol = TextEditingController();

  bool progressLoadAnimation = false;

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
                        "Join With Us",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      SizedBox(height: 15),
                      Container(
                        width: 350,

                        child: TextFormField(
                          controller: _emailTEcontrol,
                          decoration: InputDecoration(hintText: 'Email'),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email can't be empty";
                            } else if (_emailTEcontrol.text[0] !=
                                _emailTEcontrol.text[0].toLowerCase()) {
                              return "Email must start with a lowercase";
                            } else if (_emailTEcontrol.text.contains("@") ==
                                false) {
                              return "Email must contain @";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 15),
                      Container(
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password can't be empty";
                            } else if (_passTEcontrol.text.length < 6) {
                              return "Password must contain 6 characters";
                            }
                            return null;
                          },
                          controller: _firstNameTEcontrol,
                          decoration: InputDecoration(hintText: 'First Name'),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password can't be empty";
                            } else if (_passTEcontrol.text.length < 6) {
                              return "Password must contain 6 characters";
                            }
                            return null;
                          },
                          controller: _lastNameTEcontrol,
                          decoration: InputDecoration(hintText: 'Last Name'),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password can't be empty";
                            } else if (_passTEcontrol.text.length < 6) {
                              return "Password must contain 6 characters";
                            }
                            return null;
                          },
                          controller: _mobileNoTEcontrol,
                          decoration: InputDecoration(hintText: 'Mobile No'),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password can't be empty";
                            } else if (_passTEcontrol.text.length < 6) {
                              return "Password must contain 6 characters";
                            }
                            return null;
                          },
                          controller: _passTEcontrol,
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Password'),
                        ),
                      ),
                      SizedBox(height: 15),
                       FilledButton(
                          onPressed: () {
                            _onTapSingUp();
                          },
                          child: Icon(Icons.arrow_circle_right_outlined),
                        ),


                      SizedBox(height: 25),

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
                              recognizer: TapGestureRecognizer()
                                ..onTap = _loginScreen,
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

  void _onTapSingUp(){
    if(_formkey.currentState!.validate()){
      signUP();
    }

}

  void _loginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  Future<void> signUP() async {
    progressLoadAnimation = true;
    setState(() {});

    Map<String, dynamic> jsonPostBody = {
      "email": _emailTEcontrol.text.trim(),
      "firstName": _firstNameTEcontrol.text.trim(),
      "lastName": _lastNameTEcontrol.text.trim(),
      "mobile": _mobileNoTEcontrol.text.trim(),
      "password": _passTEcontrol.text.trim(),
    };

    final ApiResponse response = await ApiCaller.postRequest(
      url: URLS.registrationURL,
      body: jsonPostBody,
    );
    if (response.isSuccess) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Success')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Not Success')));
    }
  }

  @override
  void dispose() {
    _emailTEcontrol.dispose();
    _passTEcontrol.dispose();
    _mobileNoTEcontrol.dispose();
    _firstNameTEcontrol.dispose();
    _lastNameTEcontrol.dispose();
  }
}
