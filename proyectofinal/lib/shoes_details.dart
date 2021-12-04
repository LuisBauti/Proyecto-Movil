// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyectofinal/shoes.dart';
import 'package:proyectofinal/shopping_cart.dart';

class NikeShoesDetails extends StatelessWidget {
  final NikeShoes shoes;
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  NikeShoesDetails({Key? key, required this.shoes}) : super(key: key);

  void _openShoppingCart(BuildContext context) async {
    notifierButtonsVisible.value = false;
    await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation1, __) {
          return FadeTransition(
            opacity: animation1,
            child: NikeShoppingCart(
              shoes: shoes,
            ),
          );
        }));
    notifierButtonsVisible.value = true;
  }

  Widget _buildCarousel(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Hero(
            tag: 'background_${shoes.model}',
            child: Container(
              color: Color(shoes.color),
            ),
          )),
          Positioned(
            left: 70,
            right: 70,
            top: 30,
            child: Hero(
              tag: 'number_${shoes.model}',
              child: Material(
                color: Colors.transparent,
                child: FittedBox(
                  child: Text(shoes.modelNumber.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.07),
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ),
          PageView.builder(
            itemCount: shoes.images?.length,
            itemBuilder: (context, index) {
              final tag = index == 0
                  ? 'image_${shoes.model}'
                  : 'image_${shoes.model}_$index';
              return Container(
                alignment: Alignment.center,
                child: Hero(
                  tag: tag,
                  child: Image.asset(
                    shoes.images![index],
                    height: 200,
                    width: 200,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  get child => null;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: 40,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildCarousel(context),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              shoes.model,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '\$${shoes.oldPrice.toInt().toString()}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '\$${shoes.currentPrice.toInt().toString()}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Tallas disponibles",
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _ShoeSizeItem(
                              text: "6",
                            ),
                            _ShoeSizeItem(
                              text: "7",
                            ),
                            _ShoeSizeItem(
                              text: "9",
                            ),
                            _ShoeSizeItem(
                              text: "10",
                            ),
                            _ShoeSizeItem(
                              text: "11",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Descripción",
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ]),
                )
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: notifierButtonsVisible,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    FloatingActionButton(
                        heroTag: "btn1",
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.black,
                        ),
                        onPressed: () {}),
                    Spacer(),
                    FloatingActionButton(
                        heroTag: "btn2",
                        backgroundColor: Colors.black,
                        child: Icon(Icons.shopping_cart),
                        onPressed: () {
                          _openShoppingCart(context);
                        }),
                  ],
                ),
              ),
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  left: 0,
                  right: 0,
                  bottom: value ? 0.0 : -kToolbarHeight * 1.5,
                  child: child!,
                );
              })
        ],
      ),
    );
  }
}

class _ShoeSizeItem extends StatelessWidget {
  final String? text;

  const _ShoeSizeItem({Key? key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        'US ${text}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}

class ShakeTransition extends StatelessWidget {
  const ShakeTransition(
      {Key? key,
      this.duration = const Duration(milliseconds: 900),
      this.offset = 140.0,
      this.axis = Axis.horizontal,
      required this.child})
      : super(key: key);
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      duration: duration,
      curve: Curves.elasticInOut,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
            offset: axis == Axis.horizontal
                ? Offset(value * offset, 0.0)
                : Offset(
                    0.0,
                    value * offset,
                  ));
      },
    );
  }
}
