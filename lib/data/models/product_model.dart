class Product {
  final String id;
  final String title;
  final String img;
  final double price;
  final double? oldPrice;
  final double? discountPct;
  final String shop;
  final double? rating;
  final String url;

  Product({
    required this.id,
    required this.title,
    required this.img,
    required this.price,
    this.oldPrice,
    this.discountPct,
    required this.shop,
    this.rating,
    required this.url,
  });

  factory Product.fromMap(Map<String, dynamic> map, {required String id}) {
    final price = (map['price'] as num).toDouble();
    final oldPrice = map['oldPrice'] != null ? (map['oldPrice'] as num).toDouble() : null;
    double? discountPct;
    if (oldPrice != null && oldPrice > 0) {
      discountPct = ((oldPrice - price) / oldPrice) * 100;
    }
    return Product(
      id: id,
      title: map['title'] ?? '',
      img: map['imageUrl'] ?? '',
      price: price,
      oldPrice: oldPrice,
      discountPct: discountPct,
      shop: map['shop'] ?? 'Temu',
      rating: map['rating'] != null ? (map['rating'] as num).toDouble() : null,
      url: map['url'] ?? '',
    );
  }
}
