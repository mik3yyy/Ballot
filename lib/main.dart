import 'package:ballot/screens/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import './provider/user_provider.dart';
import 'authentication_screen/signin_screen/signin_screen.dart';
import 'onboarding_screen/onboarding_screen.dart';
import 'provider/election_provider.dart';
import 'screens/election_screen.dart';
import 'screens/main_screen.dart';
import 'splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('ballot');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ElectionProvider()),
        // You can add more providers here in the future as needed.
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ballot App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: OnboardingScreen(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        OnboardingScreen.id: (context) => OnboardingScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        MainScreen.id: (context) => MainScreen(),
        HomeScreen.id: (context) => HomeScreen()
        // ElectionScreen.id: (context) => ElectionScreen(),
      },
    );
  }
}
