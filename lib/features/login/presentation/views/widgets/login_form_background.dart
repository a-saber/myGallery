import 'package:flutter/material.dart';

class LoginFormBackground extends StatelessWidget {
  const LoginFormBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height*0.45,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              Expanded(
                child: Row(
                  children:
                  [
                    Expanded(child: Image.asset('assets/Group 21.png')),
                    const SizedBox(width: 30,),
                    Expanded(child: Image.asset('assets/Group 19.png')),
                  ],
                ),
              ),
              // const Spacer(),
              Expanded(
                child: Image.asset('assets/Group 20.png',
                ),
              ),
            ],
          ),
        )
    );
  }
}
