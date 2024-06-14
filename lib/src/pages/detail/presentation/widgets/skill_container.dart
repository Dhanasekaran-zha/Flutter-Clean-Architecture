import 'package:flutter/material.dart';
import 'package:flutter_pokedex/src/constants/app_fonts.dart';

class SkillContainer extends StatelessWidget {
  final String title;
  final int value;
  const SkillContainer({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            padding: EdgeInsets.all(7),
            child: Text(title.toUpperCase(),style: TextStyle(
              fontWeight: AppFontWeight.SEMI_BOLD,
              fontSize: AppFontSize.XS
            ),),
          ),
          Expanded(
            child: SizedBox(
              height: 6,
              child: LinearProgressIndicator(
                value: value / 100,
                backgroundColor: Colors.blue.shade100,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
