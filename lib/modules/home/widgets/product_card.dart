import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String shopLogoUrl;
  final String title;
  final String price;
  final String oldPrice;
  final String cashback;
  final String shopName;
  final double rating;
  final bool inStock;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final VoidCallback? onCompare;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.shopLogoUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.cashback,
    required this.shopName,
    required this.rating,
    required this.inStock,
    this.onTap,
    this.onTapFavorite,
    this.onCompare,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Image + Favorite
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onTapFavorite,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.favorite_border, size: 18),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// Shop Logo + Shop Name (Left) — Rating & In Stock (Right)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Shop Logo + Name
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(shopLogoUrl),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      shopName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                const Spacer(),

                /// Rating + In Stock vertically aligned
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 2),
                        Text(
                          rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),


            const SizedBox(height: 2),

            /// Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 2),

            /// 💵 Price + Old Price
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  oldPrice,
                  style: const TextStyle(
                    fontSize: 13,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 2),

            /// 💵 in Stock
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: inStock ? Colors.green.shade100 : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    inStock ? 'In Stock' : 'Out of Stock',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: inStock ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                const Spacer(),
                GlobalButton(onPressed: onCompare),
              ],
            ),

            const SizedBox(height: 2),

            /// Cashback + Compare
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "$cashback Cashback",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                CompareButton(onPressed: onCompare),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


/// 🔁 Reusable Compare Button
class CompareButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CompareButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.compare_arrows_rounded, size: 20, color: Colors.deepPurple),
      tooltip: 'Compare',
    );
  }
}
/// 🔁 Reusable Global Button
class GlobalButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const GlobalButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.language, size: 20, color: Colors.deepPurple),
      tooltip: 'Search',
    );
  }
}
