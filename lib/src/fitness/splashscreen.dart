import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/widgets/bottomsheets/signup_bottom_sheets.dart';

//import 'terms_and_conditions_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';

/// Displays detailed information about a SampleItem.
class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xffF5F0E7),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 160,
              left: -120,
              child: Image.asset(
                'assets/images/SplashPot.png',
                scale: 2.2,
              ),
            ),
            const Positioned(
              top: 520,
              left: 180,
              child: Text(
                'Groovy',
                style: TextStyle(fontSize: 64),
              ),
            ),
            Positioned(
              bottom: 120,
              child: RichText(
                text: TextSpan(
                    text: 'so what if you can\nhear the colors? try it  ',
                    style: GoogleFonts.cormorant(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 24),
                    ),
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              enableDrag: true,
                              isDismissible: true,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              // shape: const RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.vertical(
                              //     top: Radius.circular(30),
                              //   ),
                              // ),
                              // clipBehavior: Clip.antiAliasWithSaveLayer,
                              context: context,
                              builder: (context) {
                                return BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                  child: const SignUpBottomModalScreen(),
                                );
                              },
                            );
                          },
                          child:
                              const Icon(Icons.trending_flat_sharp, size: 24),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ));
  }
}
