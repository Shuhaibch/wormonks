import 'package:flutter/material.dart';

class CAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    // final dark = CHelperFuntions.isDarkMode(context);
    final width = MediaQuery.of(context).size.width;
    return CustomPaint(
      size: Size(
          width,
          (width * 0.633333333333334)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: CAppBarCustomPainter(),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Text(
                'Enquiry Form',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class CAppBarCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Triangle

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..color = Colors.red
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2090083, size.height * 0.0035571);
    path_1.lineTo(size.width * -0.0266833, size.height * -0.0593000);
    path_1.lineTo(size.width * 0.0023250, size.height * 0.9991857);
    path_1.lineTo(size.width * 0.2490083, size.height * 0.0035571);
    path_1.close();

    canvas.drawPath(path_1, paint_stroke_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
