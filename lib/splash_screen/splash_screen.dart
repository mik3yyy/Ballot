import 'package:ballot/onboarding_screen/onboarding_screen.dart';
import 'package:ballot/screens/Home%20Screen/home_screen.dart';
import 'package:ballot/settings/constants.dart';
import 'package:ballot/settings/hive.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = "/splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      if (HiveFunction.tokenExist()) {
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, OnboardingScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20448F),
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Constants.Montserrat.copyWith(
              fontSize: 40,
            ),
            children: [
              TextSpan(
                text: 'BU',
                style: Constants.Montserrat.copyWith(
                  color: Constants.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: "Vote",
                style: Constants.Montserrat.copyWith(
                  color: Constants.yellow,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
