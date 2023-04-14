import 'package:flutter/material.dart';


import 'login_form_background.dart';
import 'login_form_front.dart';

class LoginForm extends StatelessWidget {
 const  LoginForm({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
        height: height * 0.8,
        width: width * 0.8,
        child: Column(
          children: [
            SizedBox(height: height *0.1,),
            Text(
              'My\nGallery ',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: height *0.05,
                color: Color(0xff4a4a4a),
                fontWeight: FontWeight.w700,
                height: 1.1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: height *0.05),
              child: Stack(
                children: [
                  const LoginFormBackground(),
                  LoginFormFront()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
