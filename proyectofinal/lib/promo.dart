class NikePromo {
  final String modelPromo;
  final String pricePromo;
  final List<String> promo;
  final int? colorPromo;
  final int? numberPromo;
  NikePromo({
    required this.modelPromo,
    required this.pricePromo,
    required this.promo,
    this.colorPromo,
    this.numberPromo,
  });
}

final nPromo = <NikePromo>[
  NikePromo(
    modelPromo: 'AIR FORCE 01 TEARAWAY',
    pricePromo: 'Proximamente',
    promo: [
      'assets/promo1.png',
    ],
    numberPromo: 01,
    colorPromo: 0xFFF6F6F6,
  ),
  NikePromo(
    modelPromo: 'AIR ZOOM PRGASUS 38 SHIELD',
    pricePromo: 'Proximamente',
    promo: [
      'assets/promo2.png',
    ],
    numberPromo: 38,
    colorPromo: 0xFFF6F6F6,
  ),
  NikePromo(
    modelPromo: 'FREE METCON 04',
    pricePromo: 'Proximamente',
    promo: [
      'assets/promo3.png',
    ],
    numberPromo: 01,
    colorPromo: 0xFFF6F6F6,
  ),
];
