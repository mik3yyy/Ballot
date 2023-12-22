import 'package:ballot/authentication_screen/signin_screen/signin_screen.dart';
import 'package:ballot/global_comonents/custom_text_button.dart';
import 'package:ballot/settings/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static String id = "/onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Map<String, String>> onboardText = [
    {
      "title": "Welcome to BUVote",
      "body":
          "Empower your voice and participate in Babcock University elections with ease. Cast your vote and shape the future of your community."
    },
    {
      'title': 'Discover Our Features',
      'body':
          'Explore powerful features, including mobile voting, a user-friendly admin panel, and customizable election settings.',
    },
    {
      'title': "Discover Our Features",
      'body':
          'Explore powerful features, including mobile voting, a user-friendly admin panel, and customizable election settings.',
    }
  ];
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Scaffold(
            appBar: AppBar(actions: [
              CustomTextButton(
                text: "Skip",
                onPressed: () {},
              )
            ]),
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/onboarding/image${index + 1}.png",
                      ),
                      Constants.gap(height: 70),
                      Text(
                        onboardText[index]["title"]!,
                        style: Constants.Lato.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Constants.blue,
                        ),
                      ),
                      Constants.gap(height: 20),
                      Text(
                        onboardText[index]["body"]!,
                        textAlign: TextAlign.center,
                        style: Constants.Lato.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            bottomNavigationBar: Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: Constants.blue,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_pageController.page! > 1.0) {
                        Navigator.pushNamed(context, SignInScreen.id);
                      } else {
                        setState(() {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                          _currentIndex = _pageController.page!.round();
                        });
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Constants.blue,
                      radius: 30,
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Constants.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
