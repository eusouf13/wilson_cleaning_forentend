import 'package:flutter/material.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_royel_appbar/custom_royel_appbar.dart';
import '../../components/wilsons_logo.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const CustomRoyelAppbar(
        titleName: 'About us',
        leftIcon: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Banner Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFF0B1E34),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const WilsonsLogo(
                      size: 56,
                      borderRadius: 14,
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      "Wilson's Cleaning",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Mobile Detailing & Washing Specialists',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Our Mission Card
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Our Story & Mission',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Founded in Eastern North Carolina, Wilson's Cleaning brings top-tier detailing and surface washing right to your home, workplace, or marina. We combine state-of-the-art mobile units with biodegradable, surface-safe products to ensure your vehicles and boats look showroom fresh without the hassle of a traditional car wash visit.",
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Color(0xFF64748B),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Highlight stats row
              Row(
                children: [
                  Expanded(
                    child: _buildStatItem('500+', 'Vehicles Detailed'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatItem('4.9 ★', 'Client Rating'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatItem('100%', 'Mobile & On-site'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Contact & Service Area
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Service Hub',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _buildContactRow(
                      Icons.location_on_outlined,
                      'Headquarters: Washington, NC 27889',
                    ),
                    const SizedBox(height: 10),
                    _buildContactRow(
                      Icons.email_outlined,
                      'mobilecarservice@gmail.com',
                    ),
                    const SizedBox(height: 10),
                    _buildContactRow(
                      Icons.phone_outlined,
                      '+1 (252) 555-0199',
                    ),
                    const SizedBox(height: 10),
                    _buildContactRow(
                      Icons.schedule_outlined,
                      'Monday - Saturday: 8:00 AM - 6:00 PM',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String val, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Text(
            val,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0284C7),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF0284C7)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF475569),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

