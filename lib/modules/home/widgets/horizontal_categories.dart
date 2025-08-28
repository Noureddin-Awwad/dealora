import 'package:flutter/material.dart';

class HorizontalCategoryStories extends StatelessWidget {
  final List<CategoryModel> categories;
  final void Function(CategoryModel)? onTap;

  const HorizontalCategoryStories({
    super.key,
    required this.categories,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => onTap?.call(category),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(category.imageUrl),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(height: 6),
                Text(
                  category.title,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryModel {
  final String title;
  final String imageUrl;

  CategoryModel({
    required this.title,
    required this.imageUrl,
  });
}
