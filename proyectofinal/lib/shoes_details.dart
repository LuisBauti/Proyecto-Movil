import 'package:flutter/material.dart';

class NikeShoesDetails extends StatelessWidget {

  final ValueNotifier<bool> notifierButtonsVisible=ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_){
      notifierButtonsVisible.value=true;
    });
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          ValueListenableBuilder<bool>(
            valueListenable: notifierButtonsVisible,
            child:  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "btn1",
                        backgroundColor: Colors.white,
                        child: Icon(Icons.favorite, color: Colors.black,),
                        onPressed: (){}),
                      Spacer(),
                      FloatingActionButton(
                        heroTag: "btn2",
                        backgroundColor: Colors.black,
                        child: Icon(Icons.shopping_cart),
                        onPressed: (){}
                      ),
                      
                      
                    ],
                  ),
                ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds:200 ),
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight,
                child: child!,
              );
            }
          )
        ],),
    );
  }
}