import 'package:flutter/material.dart';

class NikeShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                  color: Colors.black87,
              ),
            ),
          ),
          Center(
            child: Text('helloo'),
          )
        ],
      ),
    );
  }
}