import 'package:flutter/material.dart';

class CompareButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CompareButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.compare_arrows_rounded, color: Colors.white),
        onPressed: onPressed ?? () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Compare feature coming soon")),
          );
        },
        tooltip: "Compare",
      ),
    );
  }
}
