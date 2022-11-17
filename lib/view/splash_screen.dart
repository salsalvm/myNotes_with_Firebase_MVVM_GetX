import 'package:my_notes_with_firebase_mvvm/res/asset/images.dart';
import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/view/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

late Size size;

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return SplashScreenView(
      navigateRoute: const ScreenLanding(),
      duration: 2000,
      imageSize: 250,
      imageSrc: KImages.splash,
      text: KString.myNotes,
      textType: TextType.ScaleAnimatedText,
      textStyle: KStyle.heading(),
    );
  }
}
