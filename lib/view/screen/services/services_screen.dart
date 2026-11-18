import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../components/custom_image/custom_image.dart';
import '../../components/custom_nav_bar/navbar.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  final List<Map<String, String>> _services = const [
    {
      'title': 'Mobile Car Wash',
      'price': 'From \$49',
      'image': AppImages.carWash,
    },
    {
      'title': 'Boat Wash',
      'price': 'From \$149',
      'image': AppImages.boatWash,
    },
    {
      'title': 'House wash',
      'price': 'From \$89',
      'image': AppImages.houseWash,
    },
    {
      'title': 'Fleet wash',
      'price': 'From \$149',
      'image': AppImages.fleetWash,
    },
    {
      'title': 'Fuel Delivery',
      'price': 'From \$149',
      'image': AppImages.fuelDelivery,
    },
    {
      'title': 'Tire Services',
      'price': 'From \$99',
      'image': AppImages.tireServices,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
       

              const SizedBox(height: 20),
              const Text(
                'Services that comes to you',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'At home, work, the dock or marina.',
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xFF64748B),
                ),
              ),

              const SizedBox(height: 20),

              // 2-Column Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.88,
                ),
                itemBuilder: (context, index) {
                  final service = _services[index];
                  return InkWell(
                    onTap: () {
                      if (service['title'] == 'Boat Wash') {
                        Get.toNamed(AppRoutes.boatWashBookingScreen);
                      } else if (service['title'] == 'House wash') {
                        Get.toNamed(AppRoutes.houseWashBookingScreen);
                      } else if (service['title'] == 'Fleet wash') {
                        Get.toNamed(AppRoutes.fleetWashBookingScreen);
                      } else if (service['title'] == 'Fuel Delivery') {
                        Get.toNamed(AppRoutes.fuelDeliveryBookingScreen);
                      } else if (service['title'] == 'Tire Services' ||
                          service['title'] == 'Tire services') {
                        Get.toNamed(AppRoutes.tireServicesHubScreen);
                      } else {
                        Get.toNamed(AppRoutes.serviceDetailScreen);
                      }
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x08000000),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Service Image
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(17),
                              ),
                              child: CustomImage(
                                imageSrc: service['image']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),

                          // Titles
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service['title']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  service['price']!,
                                  style: const TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0284C7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 1),
    );
  }
}
