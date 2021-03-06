// ignore_for_file: prefer_const_constructors
//@Dart=2.9
import 'package:flutter/material.dart';
import 'package:proyectofinal/shoes_details.dart';
import 'shoes.dart';
import 'app.dart';
import 'mainPromo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MyAppForm(),
    );
  }
}

class Home extends StatelessWidget {
  final ValueNotifier<bool> notifierButtomBarVisible = ValueNotifier(true);

  void _onShoesPressed(NikeShoes shoes, BuildContext context) async {
    notifierButtomBarVisible.value = false;
    await Navigator.maybeOf(context)!.push(
      PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
        return FadeTransition(
          opacity: animation1,
          child: NikeShoesDetails(
            shoes: shoes,
          ),
        );
      }),
    );
    notifierButtomBarVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
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
                    itemBuilder: (context, index) {
                      final shoesItem = shoes[index];
                      return NikeShoesItem(
                        shoesItem: shoesItem,
                        onTap: () {
                          _onShoesPressed(shoesItem, context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: notifierButtomBarVisible,
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Expanded(
                      child: Icon(Icons.home),
                    ),
                    Expanded(
                      child: new IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Promo() ));
                          }),
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
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: 0,
                  right: 0,
                  bottom: value ? 0.0 : -kToolbarHeight,
                  height: kToolbarHeight,
                  child: child!,
                );
              }),
        ],
      ),
    );
  }
}

class NikeShoesItem extends StatelessWidget {
  final NikeShoes? shoesItem;
  final VoidCallback? onTap;

  const NikeShoesItem({Key? key, this.shoesItem, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 300.0;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned.fill(
                child: Hero(
                  tag: 'background_${shoesItem!.model}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(shoesItem!.color),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: 'number_${shoesItem!.model}',
                    child: SizedBox(
                        height: itemHeight * 0.6,
                        child: Material(
                          color: Colors.transparent,
                          child: FittedBox(
                            child: Text(
                              shoesItem!.modelNumber!.toString(),
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.05),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                  )),
              Positioned(
                  top: 10,
                  left: 100,
                  height: itemHeight * 0.65,
                  child: Hero(
                    tag: 'image_${shoesItem!.model}',
                    child: Image.asset(
                      shoesItem!.images!.first,
                      fit: BoxFit.contain,
                    ),
                  )),
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
                      shoesItem!.model,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${shoesItem!.oldPrice.toInt().toString()}',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$${shoesItem!.currentPrice.toInt().toString()}',
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
      ),
    );
  }
}
