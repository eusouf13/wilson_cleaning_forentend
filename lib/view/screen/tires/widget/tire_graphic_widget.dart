import 'dart:math';
import 'package:flutter/material.dart';

class TireGraphicWidget extends StatelessWidget {
  final double size;
  final bool showBadge;
  final String badgeText;

  const TireGraphicWidget({
    super.key,
    this.size = 140,
    this.showBadge = false,
    this.badgeText = 'BEST MATCH',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _TirePainter(),
          ),
          if (showBadge)
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badgeText,
                  style: const TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TirePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2 * 0.95;

    // 1. Shadow
    final shadowPaint = Paint()
      ..color = const Color(0x22000000)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawCircle(center + const Offset(0, 4), outerRadius * 0.96, shadowPaint);

    // 2. Outer Tread Rubber
    final treadPaint = Paint()
      ..color = const Color(0xFF1E293B)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, outerRadius, treadPaint);

    // 3. Tread notches around circumference
    final notchPaint = Paint()
      ..color = const Color(0xFF334155)
      ..style = PaintingStyle.stroke
      ..strokeWidth = outerRadius * 0.12
      ..strokeCap = StrokeCap.round;

    const numSegments = 16;
    for (int i = 0; i < numSegments; i++) {
      final angle = (i * 2 * pi) / numSegments;
      final startRadius = outerRadius * 0.86;
      final endRadius = outerRadius * 0.96;
      final p1 = Offset(
        center.dx + startRadius * cos(angle),
        center.dy + startRadius * sin(angle),
      );
      final p2 = Offset(
        center.dx + endRadius * cos(angle),
        center.dy + endRadius * sin(angle),
      );
      canvas.drawLine(p1, p2, notchPaint);
    }

    // 4. Sidewall Ring
    final sidewallPaint = Paint()
      ..color = const Color(0xFF243042)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, outerRadius * 0.82, sidewallPaint);

    // Inner Sidewall Groove line
    final groovePaint = Paint()
      ..color = const Color(0xFF161E2E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(center, outerRadius * 0.76, groovePaint);
    canvas.drawCircle(center, outerRadius * 0.58, groovePaint);

    // 5. Rim Lip
    final rimLipPaint = Paint()
      ..color = const Color(0xFF0F172A)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, outerRadius * 0.56, rimLipPaint);

    // 6. Center Hub / Rim Hole (White wheel center as in screenshot)
    final centerHolePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, outerRadius * 0.50, centerHolePaint);

    // Subtle inner shadow on rim
    final innerShadowPaint = Paint()
      ..color = const Color(0x1A000000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, outerRadius * 0.49, innerShadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

