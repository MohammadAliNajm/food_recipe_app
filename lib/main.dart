import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipe_app/core/constants/Colors.dart';
import 'package:food_recipe_app/module_auth/sign_in/ui/screens/auth_pages.dart';
import 'package:food_recipe_app/module_auth/sign_in/ui/screens/sign_in_screen.dart';
import 'package:food_recipe_app/module_homepage/ui/screen/homepage_screen.dart';
import 'package:food_recipe_app/module_homepage/ui/screen/verify_email_screen.dart';
import 'package:food_recipe_app/module_splash/splash_screen.dart';
import 'package:injectable/injectable.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/di/di_config.dart';
import 'core/hive/hive_init.dart';
import 'core/utils/logger/logger.dart';
import 'firebase_options.dart';
import 'module_product_info/ui/screens/product_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HiveSetUp.init();
  // await Firebase.initializeApp();
  if (kIsWeb) {
  } else {
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // FlutterError.onError = (FlutterErrorDetails details) {
    //   FirebaseCrashlytics.instance.recordFlutterError(details);
    // };
  }
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    await runZonedGuarded(() {
      configureDependencies();
      // Your App Here
      runApp(getIt<MyApp>());
    }, (error, stackTrace) {
      new Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}
final navigatorKey = GlobalKey<NavigatorState>();
@injectable
class MyApp extends StatelessWidget {
   MyApp();
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(1700, name: 'XL')
          ]),
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: kiwiGreen,
      ),
      routes: {
        '/productInfo' : (context) => getIt<ProductInfoScreen>()
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
        body: SplashScreen()
       
        );
  }
}
