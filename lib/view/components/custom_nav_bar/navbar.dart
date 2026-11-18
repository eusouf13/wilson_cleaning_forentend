import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../custom_image/custom_image.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;

  const Navbar({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              iconSrc: AppIcons.home,
              label: 'Home',
              onTap: () {
                if (currentIndex != 0) {
                  Get.offAllNamed(AppRoutes.homeScreen);
                }
              },
            ),
            _buildNavItem(
              index: 1,
              iconSrc: AppIcons.services,
              label: 'Services',
              onTap: () {
                if (currentIndex != 1) {
                  Get.offAllNamed(AppRoutes.servicesScreen);
                }
              },
            ),
            _buildNavItem(
              index: 2,
              iconSrc: AppIcons.calender,
              label: 'Orders',
              onTap: () {
                if (currentIndex != 2) {
                  Get.offAllNamed(AppRoutes.ordersScreen);
                }
              },
            ),
            _buildNavItem(
              index: 3,
              iconSrc: AppIcons.user,
              label: 'Account',
              onTap: () {
                if (currentIndex != 3) {
                  Get.offAllNamed(AppRoutes.profileScreen);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconSrc,
    required String label,
    required VoidCallback onTap,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected ? const Color(0xFF0284C7) : const Color(0xFF64748B);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 3,
              width: 24,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF0284C7) : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 6),
            CustomImage(
              imageSrc: iconSrc,
              height: 22,
              width: 22,
              imageColor: color,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
