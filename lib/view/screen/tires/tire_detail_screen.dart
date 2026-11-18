import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../components/custom_royel_appbar/custom_royel_appbar.dart';
import 'widget/tire_graphic_widget.dart';

class TireDetailScreen extends StatefulWidget {
  const TireDetailScreen({super.key});

  @override
  State<TireDetailScreen> createState() => _TireDetailScreenState();
}

class _TireDetailScreenState extends State<TireDetailScreen> {
  int _quantity = 4;
  late Map<String, dynamic> _tire;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      _tire = args;
    } else {
      _tire = {
        'brand': 'Michelin',
        'name': 'Defender2',
        'spec': '225/65R17',
        'fullSpec': '225/65R17 102H • All-season',
        'rating': '4.8 (81)',
        'price': 189,
        'isBestMatch': true,
        'warranty': '80,000 mi',
        'loadSpeed': '102H',
        'type': 'All-season',
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final price = (_tire['price'] as num?)?.toInt() ?? 189;
    final totalPrice = price * _quantity;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomRoyelAppbar(
        titleName: 'Tire services',
        leftIcon: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Hero Card
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const TireGraphicWidget(size: 175),
                        if (_tire['isBestMatch'] == true)
                          Positioned(
                            top: 14,
                            left: 14,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEA580C),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'BEST MATCH',
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),

                        // Dots indicator at bottom
                        Positioned(
                          bottom: 12,
                          child: Row(
                            children: [
                              Container(
                                width: 28,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F2642),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFCBD5E1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFCBD5E1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Brand
                  Text(
                    (_tire['brand'] as String? ?? 'MICHELIN').toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0284C7),
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Title
                  Text(
                    _tire['name'] as String? ?? 'Defender2',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2642),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Subtitle Spec
                  Text(
                    _tire['fullSpec'] as String? ??
                        '225/65R17 102H • All-season',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // 3 Spec Feature Boxes
                  Row(
                    children: [
                      Expanded(
                        child: _buildSpecBox(
                          icon: Icons.waves_rounded,
                          title: _tire['type'] as String? ?? 'All-season',
                          subtitle: 'Type',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSpecBox(
                          icon: Icons.shield_outlined,
                          title: _tire['warranty'] as String? ?? '80,000 mi',
                          subtitle: 'Warranty',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildSpecBox(
                          icon: Icons.bolt_rounded,
                          title: _tire['loadSpeed'] as String? ?? '102H',
                          subtitle: 'Load/speed',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  // Price & Quantity Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$$price',
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F2642),
                            ),
                          ),
                          const Text(
                            'per tire • sample',
                            style: TextStyle(
                              fontSize: 11.5,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),

                      // Quantity Stepper
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (_quantity > 1) {
                                setState(() {
                                  _quantity--;
                                });
                              }
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFCBD5E1),
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: Color(0xFF0F2642),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Text(
                              '$_quantity',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F2642),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFCBD5E1),
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Color(0xFF0F2642),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Expandable / Nav items
                  _buildNavItem('Full specifications'),
                  const Divider(color: Color(0xFFE2E8F0), height: 1),
                  _buildNavItem('Warranty & returns'),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Bottom Fixed Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: const Border(
                top: BorderSide(color: Color(0xFFE2E8F0)),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x06000000),
                  blurRadius: 10,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      AppRoutes.tireCheckoutScreen,
                      arguments: {
                        'tire': _tire,
                        'quantity': _quantity,
                        'totalPrice': totalPrice,
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F2642),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Add $_quantity to cart • \$$totalPrice',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecBox({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 22,
            color: const Color(0xFF0284C7),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F2642),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F2642),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: Color(0xFF64748B),
          ),
        ],
      ),
    );
  }
}
