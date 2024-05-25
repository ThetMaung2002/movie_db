import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_db/widgets/ui/text_ui.dart';

class RatingStarUI extends StatelessWidget {
  const RatingStarUI({super.key, required this.rate});

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextUI(
          label: rate.toString(),
          fontWeight: FontWeight.w600,
          color: Colors.grey[300],
        ),
        RatingBar.builder(
          itemSize: 10,
          initialRating: rate,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            if (kDebugMode) print(rating);
          },
        ),
      ],
    );
  }
}
