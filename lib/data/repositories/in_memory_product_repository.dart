import 'dart:collection';

import '../../modules/home/data/dummy_products.dart';
import '../models/product_model.dart';

class InMemoryProductRepository {
  InMemoryProductRepository() {
    _products = List<Product>.generate(
      dummyProducts.length,
      (i) => Product.fromMap(dummyProducts[i], id: '$i'),
    );
  }

  late final List<Product> _products;

  List<Product> searchByKeyword(String query) {
    final lower = query.toLowerCase();
    return _products
        .where((p) => p.title.toLowerCase().contains(lower) || p.shop.toLowerCase().contains(lower))
        .toList();
  }

  List<Product> all() => UnmodifiableListView(_products);
}
