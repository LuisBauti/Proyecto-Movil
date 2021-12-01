// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'shoes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:20.0, top: 20.0,right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  height: 40,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: shoes.length,
                    itemBuilder: (context, index){
                    final shoesItem = shoes[index]; 
                    return NikeShoesItem(shoesItem: shoesItem);
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: kToolbarHeight,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Icon(Icons.home),
                  ),
                   Expanded(
                    child: Icon(Icons.home),
                  ),
                   Expanded(
                    child: Icon(Icons.favorite_border),
                  ),
                   Expanded(
                    child: Icon(Icons.shopping_cart),
                  ),
                  Expanded(
                    child: Center(
                      child: CircleAvatar(
                        radius: 13,
                        backgroundImage: AssetImage('assets/usuario.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NikeShoesItem extends StatelessWidget {
  final NikeShoes ? shoesItem;

  const NikeShoesItem({
    Key? key, 
    this.shoesItem,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const itemHeight = 290.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),      
      child: SizedBox(
        height: itemHeight,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(shoesItem!.color!),                ),
                  
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                 height: itemHeight *0.6,
                child: FittedBox(
                  child: Text(
                    shoesItem!.modelNumber!.toString(),
                    style: TextStyle(
                      color:  Colors.black.withOpacity(0.05),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ),
            Positioned(
              top: 20,
              left: 100,
              height: itemHeight *0.65,
              child: Image.asset(
                shoesItem!.images!.first, 
                fit: BoxFit.contain, 
              ),
            ),
            // ignore: prefer_const_constructors
            Positioned(
              bottom: 20,
              left: 20,
              child: Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
            ),
            // ignore: prefer_const_constructors
            Positioned(
              bottom: 20,
              right: 20,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 25,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    shoesItem!.model!,
                    style: TextStyle(
                      color: Colors.grey,
                      
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${shoesItem!.oldPrice!.toInt().toString()}',
                    style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                
                  Text(
                    '\$${shoesItem!.currentPrice!.toInt().toString()}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ), 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}