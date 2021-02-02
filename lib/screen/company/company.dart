import 'package:flutter/material.dart';

class Company extends StatefulWidget {
    var data;
  var onChanged;

  Company({this.data, this.onChanged});
  @override
  _CompanyState createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  @override
  Widget build(BuildContext context) {
     return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.pink,
    );
  }
}