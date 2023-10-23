import 'package:flutter/cupertino.dart';

class StickyNotes extends StatelessWidget {
  const StickyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 300,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = const Color(0xffefd675);
    path = Path();
    path.lineTo(size.width * 0.3, size.height * 0.02);
    path.cubicTo(size.width * 0.29, size.height * 0.02, size.width * 0.29,
        size.height, size.width * 0.29, size.height);
    path.cubicTo(size.width * 0.3, size.height * 1.02, size.width * 0.75,
        size.height * 1.02, size.width * 0.82, size.height * 1.02);
    path.cubicTo(size.width * 0.93, size.height * 1.02, size.width * 1.03,
        size.height, size.width * 1.14, size.height);
    path.cubicTo(size.width * 1.17, size.height, size.width * 1.28, size.height,
        size.width * 1.29, size.height);
    path.cubicTo(size.width * 1.29, size.height, size.width * 1.29,
        size.height * 0.03, size.width * 1.28, size.height * 0.02);
    path.cubicTo(size.width * 1.27, size.height * 0.02, size.width * 1.23,
        size.height * 0.02, size.width * 1.23, size.height * 0.02);
    path.cubicTo(size.width * 1.19, size.height * 0.02, size.width * 1.16,
        size.height * 0.02, size.width * 1.12, size.height * 0.02);
    path.cubicTo(size.width, size.height * 0.02, size.width * 0.85,
        size.height * 0.01, size.width * 0.71, size.height * 0.02);
    path.cubicTo(size.width * 0.6, size.height * 0.03, size.width * 0.49,
        size.height * 0.02, size.width * 0.38, size.height * 0.02);
    path.cubicTo(size.width * 0.35, size.height * 0.02, size.width * 0.32,
        size.height * 0.02, size.width * 0.3, size.height * 0.02);
    path.cubicTo(size.width * 0.3, size.height * 0.02, size.width * 0.3,
        size.height * 0.02, size.width * 0.3, size.height * 0.02);
    canvas.drawPath(path, paint);

    // Path number 2

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.3, size.height * 0.02);
    path.cubicTo(size.width * 0.29, size.height * 0.02, size.width * 0.29,
        size.height, size.width * 0.29, size.height);
    path.cubicTo(size.width * 0.3, size.height * 1.02, size.width * 0.75,
        size.height * 1.02, size.width * 0.82, size.height * 1.02);
    path.cubicTo(size.width * 0.93, size.height * 1.02, size.width * 1.03,
        size.height, size.width * 1.14, size.height);
    path.cubicTo(size.width * 1.17, size.height, size.width * 1.28, size.height,
        size.width * 1.29, size.height);
    path.cubicTo(size.width * 1.29, size.height, size.width * 1.29,
        size.height * 0.03, size.width * 1.28, size.height * 0.02);
    path.cubicTo(size.width * 1.27, size.height * 0.02, size.width * 1.23,
        size.height * 0.02, size.width * 1.23, size.height * 0.02);
    path.cubicTo(size.width * 1.19, size.height * 0.02, size.width * 1.16,
        size.height * 0.02, size.width * 1.12, size.height * 0.02);
    path.cubicTo(size.width, size.height * 0.02, size.width * 0.85,
        size.height * 0.01, size.width * 0.71, size.height * 0.02);
    path.cubicTo(size.width * 0.6, size.height * 0.03, size.width * 0.49,
        size.height * 0.02, size.width * 0.38, size.height * 0.02);
    path.cubicTo(size.width * 0.35, size.height * 0.02, size.width * 0.32,
        size.height * 0.02, size.width * 0.3, size.height * 0.02);
    path.cubicTo(size.width * 0.3, size.height * 0.02, size.width * 0.3,
        size.height * 0.02, size.width * 0.3, size.height * 0.02);
    canvas.drawPath(path, paint);

    // Path number 3

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.57, size.height / 5);
    path.cubicTo(size.width * 0.71, size.height / 5, size.width,
        size.height / 5, size.width * 1.17, size.height / 5);
    canvas.drawPath(path, paint);

    // Path number 4

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.56, size.height * 0.32);
    path.cubicTo(size.width * 0.7, size.height * 0.31, size.width,
        size.height * 0.32, size.width * 1.16, size.height * 0.31);
    canvas.drawPath(path, paint);

    // Path number 5

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.57, size.height * 0.43);
    path.cubicTo(size.width * 0.7, size.height * 0.43, size.width,
        size.height * 0.44, size.width * 1.16, size.height * 0.43);
    canvas.drawPath(path, paint);

    // Path number 6

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.57, size.height * 0.54);
    path.cubicTo(size.width * 0.7, size.height * 0.54, size.width,
        size.height * 0.55, size.width * 1.17, size.height * 0.54);
    canvas.drawPath(path, paint);

    // Path number 7

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.58, size.height * 0.66);
    path.cubicTo(size.width * 0.71, size.height * 0.66, size.width,
        size.height * 0.66, size.width * 1.17, size.height * 0.66);
    canvas.drawPath(path, paint);

    // Path number 8

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.58, size.height * 0.78);
    path.cubicTo(size.width * 0.71, size.height * 0.78, size.width,
        size.height * 0.78, size.width * 1.17, size.height * 0.78);
    canvas.drawPath(path, paint);

    // Path number 9

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.58, size.height * 0.9);
    path.cubicTo(size.width * 0.71, size.height * 0.89, size.width,
        size.height * 0.9, size.width * 1.17, size.height * 0.89);
    canvas.drawPath(path, paint);

    // Path number 10

    paint.color = const Color(0xff869cc5);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.15);
    path.cubicTo(size.width * 0.4, size.height * 0.16, size.width * 0.4,
        size.height * 0.19, size.width * 0.41, size.height / 5);
    path.cubicTo(size.width * 0.41, size.height / 5, size.width * 0.49,
        size.height / 5, size.width / 2, size.height / 5);
    path.cubicTo(size.width * 0.51, size.height / 5, size.width * 0.51,
        size.height * 0.15, size.width / 2, size.height * 0.15);
    path.cubicTo(size.width / 2, size.height * 0.15, size.width * 0.42,
        size.height * 0.14, size.width * 0.41, size.height * 0.15);
    path.cubicTo(size.width * 0.41, size.height * 0.15, size.width * 0.41,
        size.height * 0.15, size.width * 0.41, size.height * 0.15);
    canvas.drawPath(path, paint);

    // Path number 11

    paint.color = const Color(0xff869cc5);
    path = Path();
    path.lineTo(size.width * 0.4, size.height * 0.26);
    path.cubicTo(size.width * 0.4, size.height * 0.27, size.width * 0.39,
        size.height * 0.31, size.width * 0.41, size.height * 0.32);
    path.cubicTo(size.width * 0.41, size.height * 0.32, size.width * 0.48,
        size.height * 0.32, size.width / 2, size.height * 0.31);
    path.cubicTo(size.width * 0.51, size.height * 0.31, size.width / 2,
        size.height * 0.26, size.width / 2, size.height * 0.26);
    path.cubicTo(size.width * 0.49, size.height * 0.26, size.width * 0.41,
        size.height / 4, size.width * 0.4, size.height * 0.26);
    path.cubicTo(size.width * 0.4, size.height * 0.26, size.width * 0.4,
        size.height * 0.26, size.width * 0.4, size.height * 0.26);
    canvas.drawPath(path, paint);

    // Path number 12

    paint.color = const Color(0xff869cc5);
    path = Path();
    path.lineTo(size.width * 0.4, size.height * 0.38);
    path.cubicTo(size.width * 0.4, size.height * 0.39, size.width * 0.39,
        size.height * 0.43, size.width * 0.41, size.height * 0.43);
    path.cubicTo(size.width * 0.41, size.height * 0.43, size.width * 0.48,
        size.height * 0.44, size.width / 2, size.height * 0.43);
    path.cubicTo(size.width * 0.51, size.height * 0.43, size.width / 2,
        size.height * 0.38, size.width / 2, size.height * 0.38);
    path.cubicTo(size.width / 2, size.height * 0.38, size.width * 0.42,
        size.height * 0.37, size.width * 0.4, size.height * 0.38);
    path.cubicTo(size.width * 0.4, size.height * 0.38, size.width * 0.4,
        size.height * 0.38, size.width * 0.4, size.height * 0.38);
    canvas.drawPath(path, paint);

    // Path number 13

    paint.color = const Color(0xff869cc5);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.49);
    path.cubicTo(size.width * 0.4, size.height / 2, size.width * 0.4,
        size.height * 0.54, size.width * 0.41, size.height * 0.54);
    path.cubicTo(size.width * 0.41, size.height * 0.54, size.width * 0.49,
        size.height * 0.55, size.width / 2, size.height * 0.54);
    path.cubicTo(size.width * 0.51, size.height * 0.54, size.width / 2,
        size.height * 0.49, size.width / 2, size.height * 0.49);
    path.cubicTo(size.width / 2, size.height * 0.49, size.width * 0.42,
        size.height * 0.48, size.width * 0.41, size.height * 0.49);
    path.cubicTo(size.width * 0.41, size.height * 0.49, size.width * 0.41,
        size.height * 0.49, size.width * 0.41, size.height * 0.49);
    canvas.drawPath(path, paint);

    // Path number 14

    paint.color = const Color(0xff869cc5);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.61);
    path.cubicTo(size.width * 0.41, size.height * 0.61, size.width * 0.4,
        size.height * 0.65, size.width * 0.42, size.height * 0.66);
    path.cubicTo(size.width * 0.42, size.height * 0.66, size.width * 0.49,
        size.height * 0.67, size.width * 0.51, size.height * 0.66);
    path.cubicTo(size.width * 0.52, size.height * 0.66, size.width * 0.51,
        size.height * 0.61, size.width * 0.51, size.height * 0.61);
    path.cubicTo(size.width / 2, size.height * 0.6, size.width * 0.43,
        size.height * 0.6, size.width * 0.41, size.height * 0.61);
    path.cubicTo(size.width * 0.41, size.height * 0.61, size.width * 0.41,
        size.height * 0.61, size.width * 0.41, size.height * 0.61);
    canvas.drawPath(path, paint);

    // Path number 15

    paint.color = const Color(0xff869cc5);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.72);
    path.cubicTo(size.width * 0.41, size.height * 0.73, size.width * 0.41,
        size.height * 0.77, size.width * 0.42, size.height * 0.78);
    path.cubicTo(size.width * 0.42, size.height * 0.78, size.width * 0.49,
        size.height * 0.79, size.width * 0.51, size.height * 0.78);
    path.cubicTo(size.width * 0.52, size.height * 0.77, size.width * 0.51,
        size.height * 0.73, size.width * 0.51, size.height * 0.72);
    path.cubicTo(size.width * 0.51, size.height * 0.72, size.width * 0.43,
        size.height * 0.71, size.width * 0.41, size.height * 0.72);
    path.cubicTo(size.width * 0.41, size.height * 0.72, size.width * 0.41,
        size.height * 0.72, size.width * 0.41, size.height * 0.72);
    canvas.drawPath(path, paint);

    // Path number 16

    paint.color = const Color(0xff869cc5);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.84);
    path.cubicTo(size.width * 0.41, size.height * 0.85, size.width * 0.41,
        size.height * 0.89, size.width * 0.42, size.height * 0.9);
    path.cubicTo(size.width * 0.42, size.height * 0.9, size.width * 0.49,
        size.height * 0.9, size.width * 0.51, size.height * 0.89);
    path.cubicTo(size.width * 0.52, size.height * 0.89, size.width * 0.51,
        size.height * 0.84, size.width * 0.51, size.height * 0.84);
    path.cubicTo(size.width * 0.51, size.height * 0.84, size.width * 0.43,
        size.height * 0.83, size.width * 0.41, size.height * 0.84);
    path.cubicTo(size.width * 0.41, size.height * 0.84, size.width * 0.41,
        size.height * 0.84, size.width * 0.41, size.height * 0.84);
    canvas.drawPath(path, paint);

    // Path number 17

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.15);
    path.cubicTo(size.width * 0.4, size.height * 0.16, size.width * 0.4,
        size.height * 0.19, size.width * 0.41, size.height / 5);
    path.cubicTo(size.width * 0.41, size.height / 5, size.width * 0.49,
        size.height / 5, size.width / 2, size.height / 5);
    path.cubicTo(size.width * 0.51, size.height / 5, size.width * 0.51,
        size.height * 0.15, size.width / 2, size.height * 0.15);
    path.cubicTo(size.width / 2, size.height * 0.15, size.width * 0.42,
        size.height * 0.14, size.width * 0.41, size.height * 0.15);
    path.cubicTo(size.width * 0.41, size.height * 0.15, size.width * 0.41,
        size.height * 0.15, size.width * 0.41, size.height * 0.15);
    canvas.drawPath(path, paint);

    // Path number 18

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.4, size.height * 0.26);
    path.cubicTo(size.width * 0.4, size.height * 0.27, size.width * 0.39,
        size.height * 0.31, size.width * 0.41, size.height * 0.32);
    path.cubicTo(size.width * 0.41, size.height * 0.32, size.width * 0.48,
        size.height * 0.32, size.width / 2, size.height * 0.31);
    path.cubicTo(size.width * 0.51, size.height * 0.31, size.width / 2,
        size.height * 0.26, size.width / 2, size.height * 0.26);
    path.cubicTo(size.width * 0.49, size.height * 0.26, size.width * 0.41,
        size.height / 4, size.width * 0.4, size.height * 0.26);
    path.cubicTo(size.width * 0.4, size.height * 0.26, size.width * 0.4,
        size.height * 0.26, size.width * 0.4, size.height * 0.26);
    canvas.drawPath(path, paint);

    // Path number 19

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.4, size.height * 0.38);
    path.cubicTo(size.width * 0.4, size.height * 0.39, size.width * 0.39,
        size.height * 0.43, size.width * 0.41, size.height * 0.43);
    path.cubicTo(size.width * 0.41, size.height * 0.43, size.width * 0.48,
        size.height * 0.44, size.width / 2, size.height * 0.43);
    path.cubicTo(size.width * 0.51, size.height * 0.43, size.width / 2,
        size.height * 0.38, size.width / 2, size.height * 0.38);
    path.cubicTo(size.width / 2, size.height * 0.38, size.width * 0.42,
        size.height * 0.37, size.width * 0.4, size.height * 0.38);
    path.cubicTo(size.width * 0.4, size.height * 0.38, size.width * 0.4,
        size.height * 0.38, size.width * 0.4, size.height * 0.38);
    canvas.drawPath(path, paint);

    // Path number 20

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.49);
    path.cubicTo(size.width * 0.4, size.height / 2, size.width * 0.4,
        size.height * 0.54, size.width * 0.41, size.height * 0.54);
    path.cubicTo(size.width * 0.41, size.height * 0.54, size.width * 0.49,
        size.height * 0.55, size.width / 2, size.height * 0.54);
    path.cubicTo(size.width * 0.51, size.height * 0.54, size.width / 2,
        size.height * 0.49, size.width / 2, size.height * 0.49);
    path.cubicTo(size.width / 2, size.height * 0.49, size.width * 0.42,
        size.height * 0.48, size.width * 0.41, size.height * 0.49);
    path.cubicTo(size.width * 0.41, size.height * 0.49, size.width * 0.41,
        size.height * 0.49, size.width * 0.41, size.height * 0.49);
    canvas.drawPath(path, paint);

    // Path number 21

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.61);
    path.cubicTo(size.width * 0.41, size.height * 0.61, size.width * 0.4,
        size.height * 0.65, size.width * 0.42, size.height * 0.66);
    path.cubicTo(size.width * 0.42, size.height * 0.66, size.width * 0.49,
        size.height * 0.67, size.width * 0.51, size.height * 0.66);
    path.cubicTo(size.width * 0.52, size.height * 0.66, size.width * 0.51,
        size.height * 0.61, size.width * 0.51, size.height * 0.61);
    path.cubicTo(size.width / 2, size.height * 0.6, size.width * 0.43,
        size.height * 0.6, size.width * 0.41, size.height * 0.61);
    path.cubicTo(size.width * 0.41, size.height * 0.61, size.width * 0.41,
        size.height * 0.61, size.width * 0.41, size.height * 0.61);
    canvas.drawPath(path, paint);

    // Path number 22

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.72);
    path.cubicTo(size.width * 0.41, size.height * 0.73, size.width * 0.41,
        size.height * 0.77, size.width * 0.42, size.height * 0.78);
    path.cubicTo(size.width * 0.42, size.height * 0.78, size.width * 0.49,
        size.height * 0.79, size.width * 0.51, size.height * 0.78);
    path.cubicTo(size.width * 0.52, size.height * 0.77, size.width * 0.51,
        size.height * 0.73, size.width * 0.51, size.height * 0.72);
    path.cubicTo(size.width * 0.51, size.height * 0.72, size.width * 0.43,
        size.height * 0.71, size.width * 0.41, size.height * 0.72);
    path.cubicTo(size.width * 0.41, size.height * 0.72, size.width * 0.41,
        size.height * 0.72, size.width * 0.41, size.height * 0.72);
    canvas.drawPath(path, paint);

    // Path number 23

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.41, size.height * 0.84);
    path.cubicTo(size.width * 0.41, size.height * 0.85, size.width * 0.41,
        size.height * 0.89, size.width * 0.42, size.height * 0.9);
    path.cubicTo(size.width * 0.42, size.height * 0.9, size.width * 0.49,
        size.height * 0.9, size.width * 0.51, size.height * 0.89);
    path.cubicTo(size.width * 0.52, size.height * 0.89, size.width * 0.51,
        size.height * 0.84, size.width * 0.51, size.height * 0.84);
    path.cubicTo(size.width * 0.51, size.height * 0.84, size.width * 0.43,
        size.height * 0.83, size.width * 0.41, size.height * 0.84);
    path.cubicTo(size.width * 0.41, size.height * 0.84, size.width * 0.41,
        size.height * 0.84, size.width * 0.41, size.height * 0.84);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
