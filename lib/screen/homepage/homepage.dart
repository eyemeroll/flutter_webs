import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  var data;
  var onChanged;

  Homepage({this.data, this.onChanged});
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.blue,
    );
  }
}