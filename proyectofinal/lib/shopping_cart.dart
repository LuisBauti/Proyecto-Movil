// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
//@Dart=2.9

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proyectofinal/shoes.dart';

const _buttonSizeWidth = 250.0;
const _buttonSizeHeight = 60.0;
const _buttonCircularSize = 60.0;
const _finalImageSize = 30.0;
const _imageSize = 120.0;

class NikeShoppingCart extends StatefulWidget {
  final NikeShoes? shoes;

  const NikeShoppingCart({Key? key, @required this.shoes}) : super(key: key);

  @override
  State<NikeShoppingCart> createState() => _NikeShoppingCartState();
}

class _NikeShoppingCartState extends State<NikeShoppingCart>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animationResize;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animationResize = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Interval(
          0.0,
          0.2,
        ),
      ),
    );
    super.initState();
  }

  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Widget _builderPanel() {
    final size = MediaQuery.of(context).size;
    final currentImageSize = (_imageSize * _animationResize!.value)
        .clamp(_finalImageSize, _imageSize);
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(
            0.0,
            value * size.height * 0.6,
          ),
          child: child,
        );
      },
      child: Container(
        height: (size.height * 0.6 * _animationResize!.value)
            .clamp(_buttonCircularSize, size.height * 0.6),
        width: (size.width * _animationResize!.value)
            .clamp(_buttonCircularSize, size.width),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: _animationResize!.value == 1 ? Radius.circular(0) : Radius.circular(30),
              bottomRight: _animationResize!.value == 1 ? Radius.circular(0) : Radius.circular(30)
              ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: _animationResize!.value == 1 ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    widget.shoes!.images!.first,
                    height: currentImageSize,
                  ),
                  if (_animationResize!.value == 1) ...[
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          widget.shoes!.model,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '\$${widget.shoes!.currentPrice.toInt().toString()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) {
            final buttonSizeWidth =
                (_buttonSizeWidth * _animationResize!.value).clamp(
              _buttonCircularSize,
              _buttonSizeWidth,
            );

            final panelSizeWidth = (size.width * _animationResize!.value)
                .clamp(_buttonCircularSize, size.width);
            return Stack(
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
                Positioned.fill(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: size.height * 0.4,
                        width: panelSizeWidth,
                        left: size.width / 2 - panelSizeWidth / 2,
                        child: _builderPanel(),
                      ),
                      Positioned(
                        bottom: 40,
                        left: size.width / 2 - buttonSizeWidth / 2,
                        child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          tween: Tween(begin: 1.0, end: 0.0),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(
                                0.0,
                                value * size.height * 0.6,
                              ),
                              child: child,
                            );
                          },
                          child: InkWell(
                            onTap: () {
                              _controller!.forward();
                            },
                            child: Container(
                              width: buttonSizeWidth,
                              height:
                                  (_buttonSizeHeight * _animationResize!.value)
                                      .clamp(
                                _buttonCircularSize,
                                _buttonSizeHeight,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Expanded(
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                    ),
                                    if (_animationResize!.value == 1) ...[
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'AGREGAR AL CARRITO',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ]
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
