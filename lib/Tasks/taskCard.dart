import 'package:flutter/material.dart';

class taskCard extends StatelessWidget {
  final String title;
  final String state;

  taskCard({
    Key? key,
    required this.title,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(children: <Widget>[
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20),
            ),
            Text(state,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).primaryColor,
                    fontSize: 15))
          ],
        ))
      ]),
    );
  }
}
