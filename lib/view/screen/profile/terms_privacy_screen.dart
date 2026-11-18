import 'package:flutter/material.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_royel_appbar/custom_royel_appbar.dart';

class TermsPrivacyScreen extends StatefulWidget {
  const TermsPrivacyScreen({super.key});

  @override
  State<TermsPrivacyScreen> createState() => _TermsPrivacyScreenState();
}

class _TermsPrivacyScreenState extends State<TermsPrivacyScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const CustomRoyelAppbar(
        titleName: 'Terms & Privacy',
        leftIcon: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Tabs
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: const Color(0xFF0F2642),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: const Color(0xFF64748B),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
                tabs: const [
                  Tab(text: 'Terms of Service'),
                  Tab(text: 'Privacy Policy'),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTermsContent(),
                  _buildPrivacyContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            title: '1. Service Scope',
            content:
                'We provide on-site mobile detailing, pressure washing, soft washing, and vehicle & boat cleaning services. All services are subject to weather conditions and location accessibility.',
          ),
          _buildInfoCard(
            title: '2. Appointments & Scheduling',
            content:
                'Appointments must be booked at least 24 hours in advance. If you need to reschedule or cancel, please provide a minimum of 12 hours notice to avoid a cancellation fee.',
          ),
          _buildInfoCard(
            title: '3. Pricing & Payments',
            content:
                'Estimates and pricing are based on vehicle size, condition, and service packages selected. Payment is processed upon job completion using our secure payment gateway.',
          ),
          _buildInfoCard(
            title: '4. Liability & Care',
            content:
                'Our certified specialists take the utmost care with your property and vehicles. Any pre-existing damage must be noted during the initial pre-service inspection walkaround.',
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            title: '1. Information We Collect',
            content:
                'We collect personal details such as your name, email address, phone number, service address, and vehicle information when you schedule a booking.',
          ),
          _buildInfoCard(
            title: '2. How We Use Your Data',
            content:
                'Your information is strictly used to dispatch service technicians, process payments, send service updates, and provide customer support.',
          ),
          _buildInfoCard(
            title: '3. Security of Data',
            content:
                'All sensitive payment and user information is encrypted using industry standard protocols. We never sell your personal data to third parties.',
          ),
          _buildInfoCard(
            title: '4. Your Rights',
            content:
                'You may request access to, correction of, or deletion of your personal account data at any time from the Profile Edit section.',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 13.5,
              color: Color(0xFF64748B),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

