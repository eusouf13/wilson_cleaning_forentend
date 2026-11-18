import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../components/custom_royel_appbar/custom_royel_appbar.dart';

class BookingStep3Screen extends StatelessWidget {
  const BookingStep3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = (Get.arguments as Map<String, dynamic>?) ?? {};
    final serviceName = args['serviceName'] as String? ?? 'Mobile Car wash';
    final isBoatWash = serviceName == 'Boat wash';
    final isHouseWash = serviceName == 'House wash';
    final isFleetWash = serviceName == 'Fleet wash';

    final itemTitle = args['itemTitle'] as String? ??
        (isBoatWash
            ? 'Speed boat'
            : isHouseWash
                ? 'House wash - 2-Story Siding'
                : isFleetWash
                    ? 'Fleet wash'
                    : 'Deluxe mobile car wash');

    final itemDetail = args['itemDetail'] as String? ??
        (isBoatWash
            ? 'Boat size: 2.5m'
            : isHouseWash
                ? 'Washable size: 220 sq m'
                : isFleetWash
                    ? 'Fleet size: 5 vans'
                    : '2021 Toyota Highlander');

    final dateString =
        args['dateString'] as String? ?? 'Fri, Jun 21 • 12-2 PM';
    final address =
        args['address'] as String? ?? '112 W Main St, Washington, NC 27889';

    final imageUrl = args['image'] as String? ??
        (isBoatWash
            ? 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=600&auto=format&fit=crop'
            : isHouseWash
                ? 'https://images.unsplash.com/photo-1513694203232-719a280e022f?q=80&w=600&auto=format&fit=crop'
                : isFleetWash
                    ? 'https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?q=80&w=600&auto=format&fit=crop'
                    : 'https://images.unsplash.com/photo-1607860108855-64acf2078ed9?q=80&w=600&auto=format&fit=crop');

    final basePrice = args['basePrice'] as double? ??
        (isBoatWash
            ? 79.00
            : isHouseWash
                ? 89.00
                : isFleetWash
                    ? 149.00
                    : 79.00);
    final tax = args['tax'] as double? ??
        (isBoatWash
            ? 7.90
            : isHouseWash
                ? 8.90
                : isFleetWash
                    ? 14.90
                    : 7.21);
    final total = args['total'] as double? ??
        (isBoatWash
            ? 86.90
            : isHouseWash
                ? 97.90
                : isFleetWash
                    ? 163.90
                    : 110.21);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomRoyelAppbar(
        titleName: serviceName,
        leftIcon: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stepper Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'STEP 3 OF 3',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0284C7),
                      letterSpacing: 1.1,
                    ),
                  ),
                  Text(
                    'Review & pay',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // 3-Segment Stepper Line (all 3 active)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 3.5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0284C7),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Container(
                      height: 3.5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0284C7),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Container(
                      height: 3.5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0284C7),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Title
              const Text(
                'Review and pay',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 18),

              // Order Summary Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  children: [
                    // Service & Vehicle Info
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: 64,
                              width: 64,
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                  color: const Color(0xFF0F2642),
                                  child: const Icon(
                                    Icons.directions_car_rounded,
                                    color: Colors.white38,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  itemTitle,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  dateString,
                                  style: const TextStyle(
                                    fontSize: 12.5,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  itemDetail,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF94A3B8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(height: 1, color: Color(0xFFF1F5F9)),

                    // Service Address Row
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 20,
                            color: Color(0xFF0284C7),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  address.contains(',')
                                      ? address.split(',').first.trim()
                                      : address,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  address.contains(',')
                                      ? address
                                          .substring(address.indexOf(',') + 1)
                                          .trim()
                                      : 'Washington, NC 27889',
                                  style: const TextStyle(
                                    fontSize: 11.5,
                                    color: Color(0xFF94A3B8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Payment Section Header
              const Text(
                'Payment',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),

              // Saved Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.credit_card_rounded,
                        color: Color(0xFF0F2642),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '•••• 4242',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Expires 08/28',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFCBD5E1), width: 1.5),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Add a Card option
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.paymentMethodsScreen);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        color: Color(0xFF0284C7),
                        size: 22,
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add a Card',
                              style: TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Visa, Mastercard',
                              style: TextStyle(
                                fontSize: 11.5,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: Color(0xFF94A3B8),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Price Breakdown
              if (isBoatWash) ...[
                _buildPriceRow('Boat wash', '\$${basePrice.toStringAsFixed(2)}'),
                const SizedBox(height: 10),
                _buildPriceRow('Tax', '\$${tax.toStringAsFixed(2)}'),
              ] else if (isHouseWash) ...[
                _buildPriceRow('House wash', '\$${basePrice.toStringAsFixed(2)}'),
                const SizedBox(height: 10),
                _buildPriceRow('Tax', '\$${tax.toStringAsFixed(2)}'),
              ] else if (isFleetWash) ...[
                _buildPriceRow('Fleet wash', '\$${basePrice.toStringAsFixed(2)}'),
                const SizedBox(height: 10),
                _buildPriceRow('Tax', '\$${tax.toStringAsFixed(2)}'),
              ] else ...[
                _buildPriceRow('Deluxe package', '\$${basePrice.toStringAsFixed(2)}'),
                const SizedBox(height: 10),
                _buildPriceRow('Interior detail', '\$24.00'),
                const SizedBox(height: 10),
                _buildPriceRow('Tax', '\$${tax.toStringAsFixed(2)}'),
              ],

              const Divider(height: 24, color: Color(0xFFE2E8F0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  Text(
                    '\$${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Confirm and pay Button
              InkWell(
                onTap: () {
                  Get.offNamed(
                    AppRoutes.bookingSuccessScreen,
                    arguments: {
                      'itemTitle': itemTitle,
                      'dateString': dateString,
                      'serviceName': serviceName,
                    },
                  );
                },
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F2642),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Confirm and pay',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Secure payment note
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.verified_user_outlined,
                      size: 14,
                      color: Color(0xFF94A3B8),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Secure payment • Sample pricing',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF94A3B8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13.5,
            color: Color(0xFF64748B),
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}
