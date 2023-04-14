import 'package:flutter/cupertino.dart';

import '../resources_manager/style_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.errorMessage}) : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text( errorMessage, style: StyleManager.style18, ),);
  }
}
