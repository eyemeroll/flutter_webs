import 'package:flutter/material.dart';
import 'package:website/common/colors.dart';
import 'package:website/common/style.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 60,
            color: Colors.white54,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 50, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Bikin",
                            style: boldLogoFont(),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Studio',
                                  style: lightLogoFont())
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text("Company", style: standardFont()),
                        ),
                        Expanded(
                          child: Text("About Us", style: standardFont()),
                        ),
                        Expanded(
                          child: Text("Services", style: standardFont()),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("", textAlign: TextAlign.right, style: standardFont()))
                ],
              ),
            ),
          );
  }
}