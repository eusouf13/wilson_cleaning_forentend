import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';

class ServiceAreaScreen extends StatefulWidget {
  const ServiceAreaScreen({super.key});

  @override
  State<ServiceAreaScreen> createState() => _ServiceAreaScreenState();
}

class _ServiceAreaScreenState extends State<ServiceAreaScreen> {
  final TextEditingController _addressController =
      TextEditingController(text: '112 W Main St, Washington, NC');

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _onAddAddress() {
    Get.offAllNamed(AppRoutes.homeScreen);
    Get.snackbar(
      'Address Saved',
      'Service address updated to ${_addressController.text}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TopBar: Back Button + "Service area" (Figma exact)
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    borderRadius: BorderRadius.circular(21),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFDFE6EB),
                          width: 1.03,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF0B2545),
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Service area',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF14212B),
                      height: 1.05,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Map Preview Card (Figma exact: #DCE9E7, radius 20px, height 205px)
              Container(
                height: 205,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFDCE9E7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Stylized map cross line overlay matching Figma
                    CustomPaint(
                      size: const Size(double.infinity, 205),
                      painter: _MapRoadsPainter(),
                    ),

                    // Center Location Pin & Text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0B2545),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4.13,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Serving Eastern NC',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF14212B),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Washington · Greenville · New Bern',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF687782),
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Question Heading (Figma exact: 28px, weight 400, letterSpacing -0.8px, #14212B)
              const Text(
                'Do we come to you?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF14212B),
                  letterSpacing: -0.8,
                  height: 1.15,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle (Figma exact: 15px, weight 400, #687782, line-height 23px)
              const Text(
                'Enter the address where you’ll usually need service.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF687782),
                  height: 1.53,
                ),
              ),

              const SizedBox(height: 24),

              // Service address label (Figma exact: 12px, weight 700, #14212B)
              const Text(
                'Service address',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF14212B),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 7),

              // Address input field (Figma exact: height 52px, radius 12px, border #DFE6EB, text #8A969F)
              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFDFE6EB),
                    width: 1.03,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFF687782),
                      size: 19,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _addressController,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF14212B),
                        ),
                        decoration: const InputDecoration(
                          hintText: '112 W Main St, Washington, NC',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8A969F),
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Add my address button (Figma exact: height 52px, bg #0B2545, radius 12px, text 14px bold #FFFFFF)
              SafeArea(
                top: false,
                child: InkWell(
                  onTap: _onAddAddress,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 52,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B2545),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Add my address',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapRoadsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.65)
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke;

    final path1 = Path()
      ..moveTo(0, size.height * 0.2)
      ..lineTo(size.width, size.height * 0.8);
    canvas.drawPath(path1, paint);

    final path2 = Path()
      ..moveTo(0, size.height * 0.8)
      ..lineTo(size.width, size.height * 0.2);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
