import 'package:flutter/material.dart';

class AnimatedCashbackBadge extends StatefulWidget {
  final String cashback;

  const AnimatedCashbackBadge({super.key, required this.cashback});

  @override
  State<AnimatedCashbackBadge> createState() => _AnimatedCashbackBadgeState();
}

class _AnimatedCashbackBadgeState extends State<AnimatedCashbackBadge>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.local_offer, size: 14, color: Colors.green),
            const SizedBox(width: 4),
            Text(
              widget.cashback,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
