import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';
import '../../../data/repositories/in_memory_product_repository.dart';

class SearchController extends GetxController {
  final queryCtrl = TextEditingController();
  final results = <Product>[].obs;
  final isSearching = false.obs;
  final repo = InMemoryProductRepository();

  void runSearch() {
    final query = queryCtrl.text.trim();
    if (query.isEmpty) {
      results.clear();
      return;
    }
    isSearching.value = true;
    results.assignAll(repo.searchByKeyword(query));
    isSearching.value = false;
  }

  @override
  void onClose() {
    queryCtrl.dispose();
    super.onClose();
  }
}
