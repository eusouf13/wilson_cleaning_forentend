import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/app_routes/app_routes.dart';
import '../../../../../utils/app_images/app_images.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/wilsons_logo.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      'tag': 'EASTERN NORTH CAROLINA',
      'title': 'We come to you.',
      'title1': 'We come ',
      'titleHighlight': 'to you.',
      'description':
          'Car wash, boat detailing, pressure washing, fuel and tire help—right at your location.',
      'buttonText': 'Next',
    },
    {
      'tag': 'SERVICE ON YOUR SCHEDULE',
      'title': 'Your day, uninterrupted.',
      'title1': 'Your day, ',
      'titleHighlight': 'uninterrupted.',
      'description':
          "Choose the service, location and time that work for you. We'll handle everything else.",
      'buttonText': 'Get started',
    },
  ];

  final List<String> _chips = [
    'Auto care',
    'Marine',
    'Home exterior',
    'Roadside',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(AppRoutes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Half: Car Wash Image with Header Overlay (Figma ratio)
          Expanded(
            flex: 42,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(34),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Detailing Image
                  CustomImage(
                    imageSrc: AppImages.onboarding,
                    fit: BoxFit.cover,
                    alignment: const Alignment(0.12, 0.0),
                    height: double.infinity,
                    width: double.infinity,
                  ),

                  // Figma Linear Gradient:
                  // linear-gradient(180deg, rgba(4, 20, 38, 0.58) 0%, rgba(4, 20, 38, 0.06) 48%, rgba(4, 20, 38, 0.4) 100%)
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x94041426), // 0.58
                          Color(0x0F041426), // 0.06
                          Color(0x66041426), // 0.40
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.48, 1.0],
                      ),
                    ),
                  ),

                  // Header bar: Logo + Skip Button (positioned at the top AppBar area)
                  Positioned(
                    top: -5,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const WilsonsLogo(
                                  size: 36,
                                  borderRadius: 8,
                                  borderWidth: 1.5,
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      "Wilson's",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        height: 1.06,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'MOBILE SERVICE',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontSize: 7,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 2.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Skip button (Figma exact: blur, border, 11px Inter bold)
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.loginScreen);
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0x1FFFFFFF), // rgba(255, 255, 255, 0.12)
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(0x4DFFFFFF), // rgba(255, 255, 255, 0.3)
                                    width: 1.05,
                                  ),
                                ),
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    height: 1.45,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Content & Actions (Figma proportional flex: 58)
          Expanded(
            flex: 58,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress Bar & Step Indicator (Figma exact colors: #13A8C8, #D2DCE3, #83909A)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                height: 4,
                                width: _currentIndex == 0 ? 40 : 16,
                                decoration: BoxDecoration(
                                  color: _currentIndex == 0
                                      ? const Color(0xFF13A8C8)
                                      : const Color(0xFFD2DCE3),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 6),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                height: 4,
                                width: _currentIndex == 1 ? 40 : 16,
                                decoration: BoxDecoration(
                                  color: _currentIndex == 1
                                      ? const Color(0xFF13A8C8)
                                      : const Color(0xFFD2DCE3),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '0${index + 1} / 02',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF83909A),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),

                      const Spacer(flex: 1),

                      // Section Tag (Figma exact: #13A8C8, 10px, weight 800, 1.5px letter spacing)
                      Text(
                        page['tag'] ?? '',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF13A8C8),
                          letterSpacing: 1.5,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Main Title (Figma exact: "We come" in dark, "to you." in #13A8C8)
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 34,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1.2,
                            height: 1.1,
                          ),
                          children: [
                            TextSpan(
                              text: page['title1'] ?? '',
                              style: const TextStyle(
                                color: Color(0xFF14212B),
                              ),
                            ),
                            TextSpan(
                              text: page['titleHighlight'] ?? '',
                              style: const TextStyle(
                                color: Color(0xFF13A8C8),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Description (Figma exact: 15px, weight 400, line-height 23px, color: #687782)
                      Text(
                        page['description'] ?? '',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF687782),
                          height: 1.45,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Service Category Chips (Figma exact: 10px, weight 700, color #53636F, border #DFE6EB)
                      Wrap(
                        spacing: 4,
                        runSpacing: 8,
                        children: _chips.map((chip) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFFDFE6EB),
                                width: 1.05,
                              ),
                            ),
                            child: Text(
                              chip,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 10,
                                color: Color(0xFF53636F),
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const Spacer(flex: 2),

                      // Action Button (Figma exact: height 54px, bg #0B2545, shadow rgba(11,37,69,0.2), text 14px bold #FFFFFF)
                      SafeArea(
                        top: false,
                        child: InkWell(
                          onTap: _onNext,
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            height: 52,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0B2545),
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x330B2545), // rgba(11, 37, 69, 0.20)
                                  offset: Offset(0, 10),
                                  blurRadius: 24,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  page['buttonText'] ?? '',
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
