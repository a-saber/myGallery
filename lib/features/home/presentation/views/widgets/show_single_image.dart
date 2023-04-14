import 'package:flutter/material.dart';

class ShowSingleImage extends StatelessWidget {
  const ShowSingleImage({Key? key, required this.url}) : super(key: key);

  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Center(child: Image.network(url,fit: BoxFit.fill,)),
    );
  }
}
