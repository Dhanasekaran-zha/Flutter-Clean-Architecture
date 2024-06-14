import 'package:flutter/material.dart';
import 'package:flutter_pokedex/src/constants/app_fonts.dart';

class HeightWeightView extends StatelessWidget {
  final String title;
  final String value;
  const HeightWeightView({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: AppFontWeight.SEMI_BOLD,
                    fontSize: AppFontSize.XL),
              ),
              Text(
                value,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: AppFontWeight.REGULAR,
                    fontSize: AppFontSize.XL),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              title == 'Height' ? Icons.height : Icons.scale,
              size: AppFontSize.XXXL,
            ),
          )
        ],
      ),
    );
  }
}
