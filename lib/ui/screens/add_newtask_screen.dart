import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/appBar_widget.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class AddNewtaskScreen extends StatefulWidget {
  const AddNewtaskScreen({super.key});

  @override
  State<AddNewtaskScreen> createState() => _AddNewtaskScreenState();
}

class _AddNewtaskScreenState extends State<AddNewtaskScreen> {
  final TextEditingController SubController = TextEditingController();
  final TextEditingController DescriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text("Add New Task", style: TextTheme.of(context).titleLarge),
                  SizedBox(height: 20),
                  Container(
                    width: 380,
                    child: TextFormField(
                      controller: SubController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "Subject"),
                    ),
                  ),

                  SizedBox(height: 15),
                  Container(
                    width: 380,

                    child: TextFormField(
                      controller: DescriptionController,
                      maxLines: 7,
                      decoration: InputDecoration(hintText: "Description"),
                    ),
                  ),

SizedBox(height: 20,),
FilledButton(onPressed: (){}, child: Text("Add Item"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    SubController.dispose();
    DescriptionController.dispose();

  }
}
