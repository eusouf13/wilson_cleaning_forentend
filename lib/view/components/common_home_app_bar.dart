import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_colors/app_colors.dart';
import 'wilsons_logo.dart';

class CommonHomeAppBar extends StatelessWidget {
  final String? welcomeTag;
  const CommonHomeAppBar({
    super.key,
    this.welcomeTag = 'WELCOME BACK',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top Wilson's Cleaning Brand Header + Address Pill
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Wilson's Cleaning Logo & Subtitle
            Row(
              children: [
                const WilsonsLogo(
                  size: 38,
                  borderRadius: 8,
                  borderWidth: 2,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Wilson's Cleaning",
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      'Mobile Service',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

         ],
        ),
      ],
    );
  }
}
