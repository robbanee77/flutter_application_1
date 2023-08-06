import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final child;
  const EventCard({
    super.key,
    required this.isPast,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isPast ? Color(0xFF5ca4a9) : Color.fromARGB(255, 176, 234, 227),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
