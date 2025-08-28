import 'package:flutter/material.dart';

import '../../../core/shared/widgets/compare_button.dart';

class FlightCard extends StatefulWidget {
  final String departureCity;
  final String arrivalCity;
  final String flightTime;
  final String flightDate;
  final String airlineLogo;
  final String airlineName;     // ✨ new
  final String websiteName;     // ✨ new
  final String flightClass;
  final String price;
  final String cashback;
  final VoidCallback? onTap;

  const FlightCard({
    super.key,
    required this.departureCity,
    required this.arrivalCity,
    required this.flightTime,
    required this.flightDate,
    required this.airlineLogo,
    required this.airlineName,   // ✨ new
    required this.websiteName,   // ✨ new
    required this.price,
    required this.cashback,
    this.onTap,
    required this.flightClass,
  });

  @override
  State<FlightCard> createState() => _FlightCardState();
}

class _FlightCardState extends State<FlightCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _slide = Tween<Offset>(
      begin: const Offset(0.5, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 335,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.indigo.shade100, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ✨ Website Section (at the top)
            Row(
              children: [
                // Website Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.websiteName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // ✨ Class Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.flightClass,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// Logo + Airline Name + Price + Cashback
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Logo
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(widget.airlineLogo),
                    backgroundColor: Colors.white,
                  ),
                ),

                const SizedBox(width: 10),

                /// Airline Name with ellipsis
                Expanded(
                  child: Text(
                    widget.airlineName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),

                const SizedBox(height: 5,),

                /// Price + Cashback
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        widget.price,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    SlideTransition(
                      position: _slide,
                      child: FadeTransition(
                        opacity: _fade,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "${widget.cashback} Cashback",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),


            const SizedBox(height: 16),

            /// Route
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _cityBox(widget.departureCity),
                const SizedBox(width: 6),
                const Icon(Icons.flight_takeoff_rounded, color: Colors.deepPurple),
                const SizedBox(width: 6),
                _cityBox(widget.arrivalCity),
              ],
            ),

            const SizedBox(height: 16),

            /// Time + Date + Button Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(widget.flightTime, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                    const SizedBox(width: 12),
                    const Icon(Icons.date_range_rounded, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(widget.flightDate, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
                Row(
                  children: [
                    CompareButton(
                      onPressed: () {
                        // Navigate to comparison screen or logic
                        print("Compare clicked");
                      },
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.language, color: Colors.white),
                        onPressed: () {
                          // TODO: Open website
                        },
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cityBox(String city) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.indigo.shade600,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        city,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
