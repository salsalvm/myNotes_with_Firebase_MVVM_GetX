import 'package:flutter/material.dart';
import 'package:my_notes_with_firebase_mvvm/res/asset/images.dart';
import 'package:my_notes_with_firebase_mvvm/res/strings.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';
import 'package:my_notes_with_firebase_mvvm/utils/routes/routes_name.dart';
import 'package:my_notes_with_firebase_mvvm/view/splash_screen.dart';
import 'package:my_notes_with_firebase_mvvm/view/widgets/action_button.dart';

import '../res/colors.dart';

class ScreenLanding extends StatelessWidget {
  const ScreenLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.kWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 400,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(KImages.backgroundLanding),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  width: 80,
                  height: 200,
                  child: Container(
                    decoration: const BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(KImages.light1))),
                  ),
                ),
                Positioned(
                  left: 140,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: const BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(KImages.light2))),
                  ),
                ),
                Positioned(
                  right: 40,
                  top: 40,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: const BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(KImages.clock))),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Text(KString.light,
                          style: KStyle.heading(color: KColors.kWhite)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActionButton(
                      color: KColors.kWhite.withOpacity(0.8),
                      buttonWidth: size.width * 0.43,
                      buttonHeight: size.height * 0.05,
                      widget: Text(KString.login, style: KStyle.title()),
                      onTap: () {
                        Navigator.pushNamed(context, KRoutesName.login);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ActionButton(
                      color: KColors.kWhite.withOpacity(0.8),
                      buttonWidth: size.width * 0.43,
                      buttonHeight: size.height * 0.05,
                      widget: Text(KString.signup, style: KStyle.title()),
                      onTap: () {
                        Navigator.pushNamed(context, KRoutesName.signup);
                      },
                    ),
                  ],
                ),
                ActionButton(
                  color: KColors.kWhite.withOpacity(0.8),
                  buttonWidth: size.width,
                  buttonHeight: size.height * 0.07,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                            image: AssetImage(KImages.googleLogo),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(KString.googleAuthButton, style: KStyle.title()),
                    ],
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
