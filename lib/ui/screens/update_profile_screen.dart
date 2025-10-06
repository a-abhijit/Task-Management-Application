import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/appBar_widget.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../widgets/photo_picker_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailTEcontrol = TextEditingController();
  final TextEditingController _passTEcontrol = TextEditingController();
  final TextEditingController _firstNameTEcontrol = TextEditingController();
  final TextEditingController _lastNameTEcontrol = TextEditingController();
  final TextEditingController _mobileNoTEcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: ScreenBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Update Profile", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 30,),

              photo_picker(onTap: () {  },),
              SizedBox(height: 15,),

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
                    } else if (_emailTEcontrol.text.contains("@") == false) {
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
                  obscureText: true,
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
                  obscureText: true,
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
                  obscureText: true,
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
              FilledButton(onPressed: (){}, child: Text("Update"))
            ],
          ),
        ),
      ),
    );
  }


}


