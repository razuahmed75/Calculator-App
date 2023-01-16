import 'package:Calculator/screens/home/body.dart';
import 'package:Calculator/screens/home/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height.toString());
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          // calculator header
          HeaderSection(),

          // calculator body
          HomePageBody(),
        ],
      ),
    );
  }
}
