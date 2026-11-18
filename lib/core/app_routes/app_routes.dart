import 'package:get/get.dart';
import '../../view/screen/splash/splash_screen.dart';
import '../../view/screen/Auth/onboarding/screen/onboarding_screen.dart';
import '../../view/screen/Auth/login/screen/login_screen.dart';
import '../../view/screen/Auth/verification/verification_screen.dart';
import '../../view/screen/service_area/service_area_screen.dart';
import '../../view/screen/home/home_screen.dart';
import '../../view/screen/services/services_screen.dart';
import '../../view/screen/services/service_detail_screen.dart';
import '../../view/screen/booking/booking_step1_screen.dart';
import '../../view/screen/booking/booking_step2_screen.dart';
import '../../view/screen/booking/booking_step3_screen.dart';
import '../../view/screen/booking/booking_success_screen.dart';
import '../../view/screen/booking/boat_wash_booking_screen.dart';
import '../../view/screen/booking/house_wash_booking_screen.dart';
import '../../view/screen/booking/fleet_wash_booking_screen.dart';
import '../../view/screen/booking/fuel_delivery_booking_screen.dart';
import '../../view/screen/booking/fuel_delivery_success_screen.dart';
import '../../view/screen/tires/tire_services_hub_screen.dart';
import '../../view/screen/tires/shop_tires_screen.dart';
import '../../view/screen/tires/tire_detail_screen.dart';
import '../../view/screen/tires/tire_checkout_screen.dart';
import '../../view/screen/tires/tire_booking_success_screen.dart';
import '../../view/screen/orders/orders_screen.dart';
import '../../view/screen/orders/order_detail_rating_screen.dart';
import '../../view/screen/orders/completed_work_screen.dart';
import '../../view/screen/orders/photo_viewer_screen.dart';
import '../../view/screen/profile/profile_screen.dart';
import '../../view/screen/profile/profile_edit_screen.dart';
import '../../view/screen/profile/change_password_screen.dart';
import '../../view/screen/profile/help_support_screen.dart';
import '../../view/screen/profile/terms_privacy_screen.dart';
import '../../view/screen/profile/about_us_screen.dart';
import '../../view/screen/profile/vehicles_boats_screen.dart';
import '../../view/screen/profile/payment_methods_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String verificationScreen = '/verificationScreen';
  static const String serviceAreaScreen = '/serviceAreaScreen';
  static const String homeScreen = '/homeScreen';
  static const String servicesScreen = '/servicesScreen';
  static const String serviceDetailScreen = '/serviceDetailScreen';
  static const String bookingStep1Screen = '/bookingStep1Screen';
  static const String bookingStep2Screen = '/bookingStep2Screen';
  static const String bookingStep3Screen = '/bookingStep3Screen';
  static const String bookingSuccessScreen = '/bookingSuccessScreen';
  static const String boatWashBookingScreen = '/boatWashBookingScreen';
  static const String houseWashBookingScreen = '/houseWashBookingScreen';
  static const String fleetWashBookingScreen = '/fleetWashBookingScreen';
  static const String fuelDeliveryBookingScreen = '/fuelDeliveryBookingScreen';
  static const String fuelDeliverySuccessScreen = '/fuelDeliverySuccessScreen';
  static const String tireServicesHubScreen = '/tireServicesHubScreen';
  static const String shopTiresScreen = '/shopTiresScreen';
  static const String tireDetailScreen = '/tireDetailScreen';
  static const String tireCheckoutScreen = '/tireCheckoutScreen';
  static const String tireBookingSuccessScreen = '/tireBookingSuccessScreen';
  static const String ordersScreen = '/ordersScreen';
  static const String orderDetailRatingScreen = '/orderDetailRatingScreen';
  static const String completedWorkScreen = '/completedWorkScreen';
  static const String photoViewerScreen = '/photoViewerScreen';
  static const String profileScreen = '/profileScreen';
  static const String profileEditScreen = '/profileEditScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String helpSupportScreen = '/helpSupportScreen';
  static const String termsPrivacyScreen = '/termsPrivacyScreen';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String vehiclesBoatsScreen = '/vehiclesBoatsScreen';
  static const String paymentMethodsScreen = '/paymentMethodsScreen';

  // Navigation compatibility routes
  static const String favoritesScreen = '/favoritesScreen';
  static const String giveScreen = '/giveScreen';
  static const String inboxScreen = '/inboxScreen';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: verificationScreen, page: () => const VerificationScreen()),
    GetPage(name: serviceAreaScreen, page: () => const ServiceAreaScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: servicesScreen, page: () => const ServicesScreen()),
    GetPage(name: serviceDetailScreen, page: () => const ServiceDetailScreen()),
    GetPage(name: bookingStep1Screen, page: () => const BookingStep1Screen()),
    GetPage(name: bookingStep2Screen, page: () => const BookingStep2Screen()),
    GetPage(name: bookingStep3Screen, page: () => const BookingStep3Screen()),
    GetPage(name: bookingSuccessScreen, page: () => const BookingSuccessScreen()),
    GetPage(name: boatWashBookingScreen, page: () => const BoatWashBookingScreen()),
    GetPage(name: houseWashBookingScreen, page: () => const HouseWashBookingScreen()),
    GetPage(name: fleetWashBookingScreen, page: () => const FleetWashBookingScreen()),
    GetPage(name: fuelDeliveryBookingScreen, page: () => const FuelDeliveryBookingScreen()),
    GetPage(name: fuelDeliverySuccessScreen, page: () => const FuelDeliverySuccessScreen()),
    GetPage(name: tireServicesHubScreen, page: () => const TireServicesHubScreen()),
    GetPage(name: shopTiresScreen, page: () => const ShopTiresScreen()),
    GetPage(name: tireDetailScreen, page: () => const TireDetailScreen()),
    GetPage(name: tireCheckoutScreen, page: () => const TireCheckoutScreen()),
    GetPage(name: tireBookingSuccessScreen, page: () => const TireBookingSuccessScreen()),
    GetPage(name: ordersScreen, page: () => const OrdersScreen()),
    GetPage(name: orderDetailRatingScreen, page: () => const OrderDetailRatingScreen()),
    GetPage(name: completedWorkScreen, page: () => const CompletedWorkScreen()),
    GetPage(name: photoViewerScreen, page: () => const PhotoViewerScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: profileEditScreen, page: () => const ProfileEditScreen()),
    GetPage(name: changePasswordScreen, page: () => const ChangePasswordScreen()),
    GetPage(name: helpSupportScreen, page: () => const HelpSupportScreen()),
    GetPage(name: termsPrivacyScreen, page: () => const TermsPrivacyScreen()),
    GetPage(name: aboutUsScreen, page: () => const AboutUsScreen()),
    GetPage(name: vehiclesBoatsScreen, page: () => const VehiclesBoatsScreen()),
    GetPage(name: paymentMethodsScreen, page: () => const PaymentMethodsScreen()),
    
    // Fallbacks
    GetPage(name: favoritesScreen, page: () => const ServicesScreen()),
    GetPage(name: giveScreen, page: () => const OrdersScreen()),
    GetPage(name: inboxScreen, page: () => const HomeScreen()),
  ];
}
