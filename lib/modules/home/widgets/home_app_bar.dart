import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealoraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int favoritesCount;
  final int notificationsCount;

  const DealoraAppBar({
    super.key,
    this.favoritesCount = 2,
    this.notificationsCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.8,
      centerTitle: false,
      title: const Text(
        'Dealora',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () => Get.toNamed('/search'),
        ),
        _buildBadge(
          icon: Icons.favorite_border,
          count: favoritesCount,
          onTap: () {},
        ),
        _buildBadge(
          icon: Icons.notifications_none,
          count: notificationsCount,
          onTap: () {},
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _buildBadge({
    required IconData icon,
    required int count,
    required VoidCallback onTap,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: onTap,
        ),
        if (count > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
