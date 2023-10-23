import 'package:flutter/material.dart';
import 'package:gisa_app/config/color_palette.dart';

class ProgressBar extends StatelessWidget {
  final String index;
  const ProgressBar({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth / 20 * int.parse(index),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Palette.signitureGreen,
                    Palette.signitureGreen.withOpacity(0.6)
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned.fill(
              child: Padding(
            padding:
                const EdgeInsets.only(top: 3.0, bottom: 3, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                      text: index,
                      style: const TextStyle(shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 3,
                        )
                      ], color: Colors.white, fontWeight: FontWeight.bold),
                      children: const [
                        TextSpan(
                          text: '번',
                          style: TextStyle(shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 3,
                            )
                          ], color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
                const Icon(
                  Icons.flag_rounded,
                  color: Palette.signitureGreen,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
