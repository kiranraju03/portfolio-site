import 'package:flutter/material.dart';
import 'package:flutter_portfolio/components/header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Header(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
