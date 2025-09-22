
import 'package:flutter/material.dart';
class photo_picker extends StatelessWidget {
  const photo_picker({
    super.key, required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){

      },
      child: Container(
        height: 55,
        width: 350,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 55,
              width: 100,
              color: Colors.black38,
              child: Center(child: Text("Photo",style: TextStyle(color: Colors.white),),
              ),

            ),
            Expanded(child: Center(child: Text("No photo added")))
          ],

        ),

      ),
    );
  }
}