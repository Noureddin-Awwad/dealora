import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/widgets/product_card.dart';
import '../controllers/search_controller.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.queryCtrl,
                    decoration: const InputDecoration(
                      hintText: 'Describe the product…',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: controller.runSearch,
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isSearching.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.results.isEmpty) {
                return const Center(child: Text('No results yet'));
              }
              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.results.length,
                itemBuilder: (context, index) {
                  final p = controller.results[index];
                  return ProductCard(
                    imageUrl: p.img,
                    shopLogoUrl: 'https://logo.clearbit.com/temu.com',
                    title: p.title,
                    price: '\$${p.price.toStringAsFixed(2)}',
                    oldPrice: p.oldPrice != null ? '\$${p.oldPrice!.toStringAsFixed(2)}' : '',
                    cashback: p.discountPct != null ? '${p.discountPct!.round()}%' : '',
                    shopName: p.shop,
                    rating: p.rating ?? 0,
                    inStock: true,
                    onTap: () {}, // TODO: handle product tap
                    onTapFavorite: () {}, // TODO: handle favorite
                    onCompare: () {}, // TODO: handle compare
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
