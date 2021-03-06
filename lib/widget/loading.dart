
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.deepPurpleAccent),
      ),
    );
  }
}
