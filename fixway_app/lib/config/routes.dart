import 'package:flutter/material.dart';

// Screens will be imported here as they are created
import '../features/onboarding/screens/splash_screen.dart';
import '../features/onboarding/screens/welcome_screen.dart';
import '../features/auth/screens/signup_name_screen.dart';
import '../features/auth/screens/signup_phone_screen.dart';
import '../features/auth/screens/otp_verification_screen.dart';
import '../features/auth/screens/signup_password_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/forgot_password_phone_screen.dart';
import '../features/auth/screens/forgot_password_otp_screen.dart';
import '../features/auth/screens/forgot_password_new_password_screen.dart';
// import '../features/home/screens/home_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signupName = '/signup/name';
  static const String signupPhone = '/signup/phone';
  static const String signupOtp = '/signup/otp';
  static const String signupPassword = '/signup/password';
  static const String forgotPasswordPhone = '/forgot-password/phone';
  static const String forgotPasswordOtp = '/forgot-password/otp';
  static const String forgotPasswordNew = '/forgot-password/new';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signupName:
        return MaterialPageRoute(builder: (_) => const SignupNameScreen());
      case signupPhone:
        return MaterialPageRoute(builder: (_) => const SignupPhoneScreen());
      case signupOtp:
        return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());
      case signupPassword:
        return MaterialPageRoute(builder: (_) => const SignupPasswordScreen());
      case forgotPasswordPhone:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPhoneScreen());
      case forgotPasswordOtp:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordOtpScreen());
      case forgotPasswordNew:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordNewPasswordScreen());
      case home:
        // return MaterialPageRoute(builder: (_) => const HomeScreen());
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Home'))));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
