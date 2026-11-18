import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WilsonsLogo extends StatelessWidget {
  final double size;
  final double borderRadius;
  final double borderWidth;

  const WilsonsLogo({
    super.key,
    this.size = 64,
    this.borderRadius = 12,
    this.borderWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: size,
        width: size,
        child: SvgPicture.asset(
          'assets/icons/logo.svg',
          width: size,
          height: size,
          fit: BoxFit.contain,
          placeholderBuilder: (context) => Image.asset(
            'assets/icons/logo.png',
            width: size,
            height: size,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.black,
              child: const Center(
                child: Text(
                  'W',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
