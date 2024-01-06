import 'package:ballot/settings/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';
import '../../model/user_model.dart';
import '../../screens/main_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String id = "/signin";
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  auth() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      var res = await _googleSignIn.signIn();
      print(res);

      // Create a UserModel instance
      UserModel user = UserModel(
        displayName: res?.displayName ?? 'N/A',
        email: res!.email,
        id: res.id,
        photoUrl: res.photoUrl,
        serverAuthCode: res.serverAuthCode,
      );

      // Set user in the provider
      Provider.of<UserProvider>(context, listen: false).setUser(user);

      // push to the home screen
      Navigator.pushReplacementNamed(context, MainScreen.id);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Constants.gap(height: 100),
              Text(
                "Start Your\nVoting Today",
                style: Constants.Lato.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: Constants.blue,
                ),
              ),
              Constants.gap(height: 20),
              Text(
                "Kindly sign in with your Babcock email address",
                style: Constants.Lato.copyWith(
                  color: Constants.grey,
                ),
              ),
              Constants.gap(height: 20),
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  auth();
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 64,
                  decoration: BoxDecoration(color: Color(0xFF4285F4)),
                  child: Row(
                    children: [
                      Image.asset("assets/images/auth/google.png"),
                      Constants.gap(width: 20),
                      Text(
                        "Sign in with Google",
                        style: Constants.Roboto.copyWith(
                          color: Constants.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
