import 'package:flutter/material.dart';

import 'dart:core';

class RecentsPage extends StatefulWidget {
  

  final String title = "";

  @override
  _RecentsPageState createState() => _RecentsPageState();
}

class _RecentsPageState extends State<RecentsPage> {

  List<String> _recents = [];

  var _tapPosition;

  @override
  void initState() {
    super.initState();
    _tapPosition = Offset(0.0, 0.0);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(height: 25),
              Stack(
                children: <Widget>[
                  GestureDetector(
                     onTapDown: _storePosition,
                onTap: () {
                  print("long press of ");
                  _showPopupMenu();
                },
                   
                    child: Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Center(
                        child: Text(
                          "Recents",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 0),
                    child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Icon(
                            Icons.chevron_left,
                          ),
                        )),
                  ),
                ],
              ),
              Container(
                height: 15,
              ),
              Container(
                height: 2,
                color: Colors.blue,
              ),
              Container(
                height: 10,
              ),
              Flexible(
                child: ListView(
                  padding: EdgeInsets.all(15.0),
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: _getRecentTiles(),
                  ).toList(),
                ),
              ),
              Container(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getRecentTiles() {
    List<Widget> devices = [];
    String _dev;
    String _owner = "John Doe";

    if (_recents != null) {
      for (_dev in _recents.reversed) {
        if (_dev != null) {
          _dev = _dev.toUpperCase().trim();

            String serial = "12341234";

            devices.add(GestureDetector(
                onTapDown: _storePosition,
                onLongPress: () {
                  print("long press of $serial");
                  _showPopupMenu();
                },
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  
                  title: Text(
                    "$_owner",
                    maxLines: 1,
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text("Serial #: $serial"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                )));
        }
      }
    } else {
      devices.add(ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 20),
        title: Text(
          "No Recent Devices",
          maxLines: 1,
          style: TextStyle(fontSize: 20),
        ),
        subtitle:
            Text("Click the button to add a device"),
        onTap: () {
          print('add device');
        },
      ));
    }
    return devices;
  }

  _showPopupMenu() async {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          _tapPosition & Size(40, 40), // smaller rect, the touch area
          Offset.zero & overlay.size // Bigger rect, the entire screen
          ),
      items: [
        PopupMenuItem(
          child: Text("Show Usage"),
        ),
        PopupMenuItem(
          child: Text("Delete"),
        ),
      ],
      elevation: 8.0,
    );
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }
}