// ignore_for_file: prefer_const_constructors
//@Dart=2.9
import 'package:flutter/material.dart';
import 'promo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Promo(),
    );
  }
}

class Promo extends StatelessWidget {
  final ValueNotifier<bool> notifierButtomBarVisible = ValueNotifier(true);
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
                    itemCount: nPromo.length,
                    itemBuilder: (context, index) {
                      final promoShoes = nPromo[index];
                      return NikeShoesPromo(
                        promoNike: promoShoes,
                        onTap: () {
                          (promoShoes);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NikeShoesPromo extends StatelessWidget {
  final NikePromo? promoNike;
  final VoidCallback? onTap;

  const NikeShoesPromo({Key? key, this.promoNike, this.onTap})
      : super(key: key);

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
                  tag: 'background_${promoNike!.modelPromo}',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(promoNike!.colorPromo!),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 'number_${promoNike?.modelPromo}',
                  child: SizedBox(
                      height: itemHeight * 0.6,
                      child: Material(
                        color: Colors.transparent,
                      )),
                ),
              ),
              Positioned(
                  bottom: 40,
                  left: 18,
                  height: itemHeight * 1.2,
                  child: Hero(
                    tag: 'image_${promoNike!.modelPromo}',
                    child: Image.asset(
                      promoNike!.promo.first,
                      fit: BoxFit.contain,
                    ),
                  )),
              Positioned(
                bottom: 20,
                left: 20,
                child: Icon(
                  Icons.hourglass_top,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Icon(
                  Icons.hourglass_bottom_outlined,
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
                      promoNike!.modelPromo,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      promoNike!.pricePromo,
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
