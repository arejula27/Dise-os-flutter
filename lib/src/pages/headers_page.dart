import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _diagonalHeader();
  }
}

Widget _squareHeader() {
  return Scaffold(
    body: Container(
        width: double.infinity, height: 300, color: const Color(0xff615aab)),
  );
}

Widget _roundedSquareHeader() {
  const double radius = 50;
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
          color: Color(0xff615aab)),
      width: double.infinity,
      height: 300,
    ),
  );
}

Widget _diagonalHeader() {
  return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _diagonal(),
      ),
    ),
  );
}

class _diagonal extends CustomPainter {
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //this is our pencil
    final pencil = Paint();
    pencil.color = const Color(0xff615aab);
    pencil.style = PaintingStyle.fill; //stroke bordes ;fill todo
    pencil.strokeWidth = 5;

    final path = Path();

    //dibujar con el lapiz el recorrido de path
    //moveTo lo mueve sin pintar, lineTo lo mueve pintando

    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, pencil);
  }
}
