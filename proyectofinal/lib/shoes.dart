class NikeShoes {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String>? images;
  final int? modelNumber;
  final int color;
  NikeShoes(
      {required this.model,
      required this.oldPrice,
      required this.currentPrice,
      this.images,
      this.modelNumber,
      required this.color});
}

final shoes = <NikeShoes>[
  NikeShoes(
    model: 'AIR MAX 90 EZ BLACK',
    currentPrice: 150,
    oldPrice: 300,
    images: [
      'assets/image1.1.png',
      'assets/image1.2.png',
      'assets/image1.3.png'
    ],
    modelNumber: 90,
    color: 0xFFF6F6F6,
  ),
  NikeShoes(
    model: 'Air Max 270 GOLD',
    currentPrice: 160,
    oldPrice: 320,
    images: [
      'assets/image2.1.png',
      'assets/image2.2.png',
      'assets/image2.3.png'
    ],
    modelNumber: 270,
    color: 0xfffef8e3,
  ),
  NikeShoes(
    model: 'Air Max 270 RED',
    currentPrice: 90,
    oldPrice: 150,
    images: [
      'assets/image3.1.png',
      'assets/image3.2.png',
      'assets/image3.3.png'
    ],
    modelNumber: 95,
    color: 0xfffee8e3,
  ),
  NikeShoes(
    model: 'Team Hustle Quick 98',
    currentPrice: 205.97,
    oldPrice: 300,
    images: [
      'assets/image4.1.png',
      'assets/image4.2.png',
      'assets/image4.3.png'
    ],
    modelNumber: 98,
    color: 0xffe3f3fe,
  ),
];
