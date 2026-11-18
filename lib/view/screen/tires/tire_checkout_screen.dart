import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../components/custom_royel_appbar/custom_royel_appbar.dart';
import 'widget/tire_graphic_widget.dart';

class TireCheckoutScreen extends StatefulWidget {
  const TireCheckoutScreen({super.key});

  @override
  State<TireCheckoutScreen> createState() => _TireCheckoutScreenState();
}

class _TireCheckoutScreenState extends State<TireCheckoutScreen> {
  late Map<String, dynamic> _tire;
  int _quantity = 4;
  int _fulfillmentIndex = 0; // 0: Mobile installation ($119), 1: Delivery only ($29)
  int _selectedDateIndex = 1; // 0: FRI 21, 1: SAT 22, 2: MON 24
  int _selectedTimeIndex = 1; // 0: 9-11 AM, 1: 12-2 PM, 2: 3-5 PM

  final List<Map<String, String>> _dates = [
    {'day': 'FRI', 'date': '21'},
    {'day': 'SAT', 'date': '22'},
    {'day': 'MON', 'date': '24'},
  ];

  final List<String> _times = [
    '9-11 AM',
    '12-2 PM',
    '3-5 PM',
  ];

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      _tire = args['tire'] as Map<String, dynamic>? ?? {
        'name': 'Defender2',
        'spec': '225/65R17',
        'price': 189,
      };
      _quantity = args['quantity'] as int? ?? 4;
    } else {
      _tire = {
        'name': 'Defender2',
        'spec': '225/65R17',
        'price': 189,
      };
      _quantity = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tirePrice = (_tire['price'] as num?)?.toDouble() ?? 189.0;
    final tiresTotal = tirePrice * _quantity;
    final fulfillmentFee = _fulfillmentIndex == 0 ? 119.0 : 29.0;
    const disposalFee = 24.0;
    final tax = (tiresTotal + fulfillmentFee + disposalFee) * 0.0825;
    final grandTotal = tiresTotal + fulfillmentFee + disposalFee + tax;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomRoyelAppbar(
        titleName: 'Shop tires',
        leftIcon: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cart Item Summary Card
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x06000000),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Thumbnail
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: TireGraphicWidget(size: 44),
                          ),
                        ),
                        const SizedBox(width: 14),

                        // Title, Subtitle, Price
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _tire['name'] as String? ?? 'Defender2',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F2642),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${_tire['spec'] ?? '225/65R17'} • Qty $_quantity',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${tiresTotal.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F2642),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Remove Icon
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            size: 18,
                            color: Color(0xFF94A3B8),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Fulfillment Section
                  const Text(
                    'Fulfillment',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2642),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Option 1: Mobile Installation
                  _buildFulfillmentOption(
                    index: 0,
                    title: 'Mobile installation',
                    subtitle: 'Mounting & balancing at your location.',
                    price: '+\$119',
                    badge: 'RECOMMENDED',
                  ),

                  const SizedBox(height: 10),

                  // Option 2: Delivery only
                  _buildFulfillmentOption(
                    index: 1,
                    title: 'Delivery only',
                    subtitle: 'Drop-off at your address.',
                    price: '+\$29',
                  ),

                  const SizedBox(height: 24),

                  // Installation Schedule Section
                  const Text(
                    'Installation schedule',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2642),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Dates Row
                  Row(
                    children: List.generate(_dates.length, (index) {
                      final isSelected = _selectedDateIndex == index;
                      final item = _dates[index];
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: index < _dates.length - 1 ? 10.0 : 0.0,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedDateIndex = index;
                              });
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF0F2642)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF0F2642)
                                      : const Color(0xFFE2E8F0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    item['day']!,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? Colors.white70
                                          : const Color(0xFF64748B),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['date']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected
                                          ? Colors.white
                                          : const Color(0xFF0F2642),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 12),

                  // Arrival window chips
                  Row(
                    children: List.generate(_times.length, (index) {
                      final isSelected = _selectedTimeIndex == index;
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: index < _times.length - 1 ? 10.0 : 0.0,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedTimeIndex = index;
                              });
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF0F2642)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF0F2642)
                                      : const Color(0xFFE2E8F0),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _times[index],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF334155),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // Installation address
                  const Text(
                    'Installation address',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2642),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: Color(0xFF64748B),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '112 W Main St, Washington, NC',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF0F2642),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Price breakdown Section
                  const Text(
                    'Price breakdown',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2642),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildPriceRow('$_quantity tires', '\$${tiresTotal.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  _buildPriceRow(
                    _fulfillmentIndex == 0 ? 'Mobile installation' : 'Delivery fee',
                    '\$${fulfillmentFee.toStringAsFixed(2)}',
                  ),
                  const SizedBox(height: 8),
                  _buildPriceRow('Disposal & recycling fee', '\$${disposalFee.toStringAsFixed(2)}'),
                  const SizedBox(height: 8),
                  _buildPriceRow('Estimated tax', '\$${tax.toStringAsFixed(2)}'),
                  const SizedBox(height: 10),
                  const Divider(color: Color(0xFFE2E8F0)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F2642),
                        ),
                      ),
                      Text(
                        '\$${grandTotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F2642),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // Bottom Bar
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
                    final selectedDate = _dates[_selectedDateIndex];
                    final arrivalStr = '${selectedDate['day']} • ${_times[_selectedTimeIndex]}';

                    Get.toNamed(
                      AppRoutes.tireBookingSuccessScreen,
                      arguments: {
                        'vehicle': '2021 Toyota Highlander',
                        'arrival': arrivalStr,
                        'serviceName': 'Tire Installation',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Checkout • \$${grandTotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFulfillmentOption({
    required int index,
    required String title,
    required String subtitle,
    required String price,
    String? badge,
  }) {
    final isSelected = _fulfillmentIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _fulfillmentIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF0F2642)
                : const Color(0xFFE2E8F0),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            // Radio circle
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF0F2642)
                      : const Color(0xFFCBD5E1),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF0F2642),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F2642),
                        ),
                      ),
                      if (badge != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            badge,
                            style: const TextStyle(
                              fontSize: 8.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD97706),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11.5,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),

            // Price
            Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F2642),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0F2642),
          ),
        ),
      ],
    );
  }
}
