import 'package:get/get.dart';
import 'package:xpress_app/core/constant/routes.dart';
import 'package:xpress_app/core/middleware/my_middleware.dart';
import 'package:xpress_app/view/screens/app/checkout/checkout.dart';
import 'package:xpress_app/view/screens/app/drawer/menu/drawer.dart';
import 'package:xpress_app/view/screens/app/drawer/menu/widget/custom_drawer.dart';
import 'package:xpress_app/view/screens/app/drawer/FAQ/faq.dart';
import 'package:xpress_app/view/screens/app/drawer/about_us/about_us.dart';
import 'package:xpress_app/view/screens/app/drawer/contact_us/contact_us.dart';
import 'package:xpress_app/view/screens/app/drawer/contact_us/contact_us_1.dart';
import 'package:xpress_app/view/screens/app/drawer/privacy_policy/privacy_policy.dart';
import 'package:xpress_app/view/screens/app/drawer/terms/terms.dart';
import 'package:xpress_app/view/screens/app/home/home.dart';
import 'package:xpress_app/view/screens/app/main_screen.dart';
import 'package:xpress_app/view/screens/app/offers/offers.dart';
import 'package:xpress_app/view/screens/app/orders/my_orders/my_orders.dart';
import 'package:xpress_app/view/screens/app/orders/my_orders_details/my_orders_details.dart';
import 'package:xpress_app/view/screens/app/profile/editeProfile.dart';
import 'package:xpress_app/view/screens/app/profile/profile.dart';
import 'package:xpress_app/view/screens/app/search/search.dart';
import 'package:xpress_app/view/screens/auth/screens/change_password.dart';
import 'package:xpress_app/view/screens/auth/screens/forgotPassword.dart';
import 'package:xpress_app/view/screens/auth/screens/signIn.dart';
import 'package:xpress_app/view/screens/auth/screens/signUp.dart';
import 'package:xpress_app/view/screens/auth/screens/success_sign_up.dart';
import 'package:xpress_app/view/screens/city/citys_screen.dart';
import 'package:xpress_app/view/screens/on_bording/out_boarding_screen.dart';

import 'view/screens/auth/screens/language.dart';
import 'view/screens/welcome/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const SplashScreen(), middlewares: [
    MyMiddleware(),
  ]),
  GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoutes.lnag, page: () => const Language()),
  GetPage(name: AppRoutes.signIn, page: () => const SignIn()),
  GetPage(name: AppRoutes.signUp, page: () =>  SignUp()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OutBoardingScreen()),
  GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPassword()),
  GetPage(name: AppRoutes.home, page: () => const Home()),
  GetPage(name: AppRoutes.main_screen, page: () => const MainScreen()),
  GetPage(name: AppRoutes.editeProfile, page: () => const EditeProfile()),
  GetPage(name: AppRoutes.offers, page: () => const Offers()),
  GetPage(name: AppRoutes.checkout, page: () => const Checkout()),
  GetPage(name: AppRoutes.search, page: () => const Search()),
  GetPage(name: AppRoutes.profile, page: () => const Profile()),
  GetPage(name: AppRoutes.my_orders, page: () => const MyOrders()),
  GetPage(
      name: AppRoutes.my_orders_details, page: () => const MyOrdersDetails()),
  GetPage(name: AppRoutes.change_password, page: () => const ChangePassword()),
  GetPage(name: AppRoutes.about_us, page: () => const AboutUs()),
  GetPage(name: AppRoutes.contact_us, page: () => const Contactus()),
  GetPage(name: AppRoutes.contact_us_1, page: () => const ContactUs1()),
  GetPage(name: AppRoutes.faq, page: () => const FAQ()),
  GetPage(name: AppRoutes.terms, page: () => const Terms()),
  GetPage(name: AppRoutes.privacy_policy, page: () => const PrivacyPolicy()),
  GetPage(name: AppRoutes.drawer, page: () =>  MyDrawer()),
  GetPage(name: AppRoutes.city, page: () => const CitysScreen()),
  GetPage(name: AppRoutes.success_sign_up, page: () => const SuccessSignup()),
];
