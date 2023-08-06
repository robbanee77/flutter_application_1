import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/components/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;

  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // gap between events
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        // decorate the lines
        beforeLineStyle: LineStyle(
            color: isPast
                ? Color(0xFF5ca4a9)
                : Color.fromARGB(255, 176, 229, 232)),
        // decorate the icon
        indicatorStyle: IndicatorStyle(
          width: 40,
          color:
              isPast ? Color(0xFF5ca4a9) : Color.fromARGB(255, 176, 234, 227),
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.white : Color.fromARGB(255, 251, 251, 251),
          ),
        ),
        // event card
        endChild: EventCard(
          isPast: isPast,
          child: eventCard,
        ),
      ),
    );
  }
}
