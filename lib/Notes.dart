import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _switchValue = false;

    return Scaffold(
        //backgroundColor: Colors.white,
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/minion.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Switch(value: _switchValue, onChanged: (bool newValue) {}),
          ToggleSwitch(
            minWidth: 50.0,
            cornerRadius: 20.0,
            initialLabelIndex: 1,
            totalSwitches: 2,
            customIcons: [
              Icon(
                Icons.night_shelter,
              ),
              Icon(Icons.light_mode),
            ],
            radiusStyle: true,
            onToggle: (index) {
              print('hola');
            },
          ),
        ],
      ),
    ));
  }
}
