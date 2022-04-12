import 'package:flutter/material.dart';

class OtherPages extends StatelessWidget {
  final String title;
  const OtherPages({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Text(title),
      ),
    );
  }
}
