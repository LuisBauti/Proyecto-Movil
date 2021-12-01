

class NikeShoes{
  final String ? model;
  final double ? oldPrice;
  final double ? currentPrice;
  final List<String> ? images;
  final int ? modelNumber;
  final int ? color;
  NikeShoes({
    this.model,
    this.oldPrice,
    this.currentPrice,
    this.images,
    this.modelNumber,
    this.color
  });
  
}

final shoes=<NikeShoes>[
  NikeShoes(
    model: 'Air Force 1 07 LV8',
    currentPrice: 125,
    oldPrice: 250,
    images: [ 'assets/image1.1.png',
              'assets/image1.2.png',
              'assets/image1.3.png'],
    modelNumber: 90,
    color: 0xFFF6F6F6,
  ),
  NikeShoes(
    model: 'Air Max 270',
    currentPrice: 160,
    oldPrice: 320,
    images: [ 'assets/image2.1.png',
              'assets/image2.2.png',
              'assets/image2.3.png'],
    modelNumber: 270,
    color: 0xfffef8e3,
  ),
  NikeShoes(
    model: 'Air Force 1 LV8',
    currentPrice: 90,
    oldPrice: 150,
    images: [ 'assets/image3.1.png',
              'assets/image3.2.png',
              'assets/image3.3.png'],
    modelNumber: 108,
    color: 0xfffee8e3,
  ),
  NikeShoes(
    model: 'Team Hustle Quick 3',
    currentPrice: 47.97,
    oldPrice: 50,
    images: [ 'assets/image4.1.png',
              'assets/image4.2.png',
              'assets/image4.3.png'],
    modelNumber: 03,
    color: 0xffe3f3fe,
  ),
];