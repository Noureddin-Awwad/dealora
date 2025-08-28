import 'package:flutter/material.dart';

class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final double rating;
  final int reviewCount;
  final double distanceKm;
  final double pricePerNight;
  final List<IconData> amenities; // e.g. [Icons.wifi, Icons.pool, Icons.local_parking]
  final VoidCallback? onTapBook;

  const HotelCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.rating,
    required this.reviewCount,
    required this.distanceKm,
    required this.pricePerNight,
    this.amenities = const [],
    this.onTapBook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 245,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0,4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + Distance
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${distanceKm.toStringAsFixed(1)} km',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 4),
                // Location
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                // Rating + reviews
                Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.amber.shade600),
                    const SizedBox(width: 2),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '($reviewCount reviews)',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                // Amenities icons
                Row(
                  children: amenities.map((iconData) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(iconData, size: 18, color: Colors.grey.shade600),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 12),
                // Price & Book button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${pricePerNight.toStringAsFixed(0)}/night',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onTapBook,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                      ),
                      child: const Text('Book'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
