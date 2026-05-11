import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'config/theme.dart';
import 'config/routes.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const FixwayApp()));
}

class FixwayApp extends StatelessWidget {
  const FixwayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fixway',
      theme: AppTheme.lightTheme,
      // هاد السطر مهم بزاف باش يخدم الـ Real-time مزيان مع العبارات ديال الـ Preview
      useInheritedMediaQuery: true,

      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,

      // هادو اللي كيربطو الـ App مع الـ Plugin
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
