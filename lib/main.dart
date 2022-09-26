
import 'package:connection_notifier/connection_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import 'firebase_options.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseCacheManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return ConnectionNotifier(
        child: OKToast(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Food Delivery',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.grey[100]),
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [Locale("ar", "AE")],
            locale: const Locale("ar", "AE"),
            // home: const AdminScreen(),
            initialRoute: AppRoutes.welcome,
            getPages: AppRoutes.routes,
          ),
        ),
      );
    } else {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.grey[100]),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar", "AE")],
        locale: const Locale("ar", "AE"),
        // home: const AdminScreen(),
        initialRoute: AppRoutes.welcome,
        getPages: AppRoutes.routes,
      );
    }
  }
}
