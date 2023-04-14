import 'package:flutter/material.dart';
import 'package:task2/features/login/presentation/views/widgets/upper_lines.dart';

import 'background_3color_login.dart';
import 'login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: const [
        BackgroundThreeColorsLogin(),
        UpperLines(),
        Align(alignment: Alignment.center, child: LoginForm()),
      ],
    );
  }
}
