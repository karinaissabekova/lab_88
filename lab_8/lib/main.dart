import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'constants/colors.dart';
import 'constants/text_styles_value.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 8',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void changeLanguage(BuildContext context) {
    if (context.locale.languageCode == 'en') {
      context.setLocale(const Locale('ru'));
    } else {
      context.setLocale(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('hello'.tr()),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Text(
          'welcome'.tr(),
          style: AppTextStyles.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeLanguage(context),
        child: const Icon(Icons.language),
      ),
    );
  }
}