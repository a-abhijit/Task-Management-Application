import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/screens/resetpass_screen.dart';
import 'package:task_manager/ui/screens/signup_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class PinVerifyScreen extends StatefulWidget {
  const PinVerifyScreen({super.key});

  @override
  State<PinVerifyScreen> createState() => _PinVerifyScreenState();
}

class _PinVerifyScreenState extends State<PinVerifyScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _pinTEcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Hides keyboard when tapping outside
      },
      child: Scaffold(
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
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          "Enter the 6 digit verification pin sent to your email",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: PinCodeTextField(
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            keyboardType: TextInputType.phone,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              activeColor: Colors.green,
                              fieldHeight: 50,
                              fieldWidth: 40,
                            ),
                            animationDuration:
                            const Duration(milliseconds: 300),
                            backgroundColor: Colors.transparent,
                            controller: _pinTEcontrol,
                            appContext: context,
                          ),
                        ),
                        const SizedBox(height: 25),
                        FilledButton(
                          onPressed: () {
                            if (_formkey.currentState?.validate() == false) {
                              return;
                            }

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassScreen()));
                          },
                          child: const Text(
                            "Verify",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        RichText(
                          text: TextSpan(
                            text: "Already have an account?",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: " Sign in",
                                style: const TextStyle(color: Colors.green),
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
      ),
    );
  }

  void _loginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

  @override
  void dispose() {
    _pinTEcontrol.dispose();
    super.dispose();
  }
}
