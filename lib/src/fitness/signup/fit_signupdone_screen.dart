import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../home/groovy_dashboard_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';

/// Displays detailed information about a SampleItem.
class FitSignupDoneScreenView extends StatelessWidget {
  const FitSignupDoneScreenView({Key? key}) : super(key: key);

  static const routeName = 'fit_signupdone';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF198FB3), Colors.white],
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF198FB3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 120,),
              Image.network(
                'https://i.ibb.co/W01gZgW/img-6.png',
                semanticLabel: 'Yoga Illustration',
                //height: 350,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    'You are ready to go!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28).add(const EdgeInsets.only(top: 40)),
                child: const Center(
                  child: Text(
                    'Thanks for taking your time to create account with us. Now this is the fun part, let’s explore the app.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              InkWell(
                onTap: () {
                  Navigator.restorablePushNamed(
                    context,
                    GroovyDashboardScreenView.routeName,
                  );
                },
                child: Container(
                  width: 220,
                  height: 57,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x05000000),
                        blurRadius: 2.21,
                        offset: Offset(0, 2.77),
                      ),
                      BoxShadow(
                        color: Color(0x07000000),
                        blurRadius: 5.32,
                        offset: Offset(0, 6.65),
                      ),
                      BoxShadow(
                        color: Color(0x08000000),
                        blurRadius: 10.02,
                        offset: Offset(0, 12.52),
                      ),
                      BoxShadow(
                        color: Color(0x0a000000),
                        blurRadius: 17.87,
                        offset: Offset(0, 22.34),
                      ),
                      BoxShadow(
                        color: Color(0x0c000000),
                        blurRadius: 33.42,
                        offset: Offset(0, 41.78),
                      ),
                      BoxShadow(
                        color: Color(0x11000000),
                        blurRadius: 80,
                        offset: Offset(0, 100),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 130,
                        height: 27,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Get Started',
                              style: TextStyle(
                                color: Color(0xff198FB3),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              width: 12,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                                color: Color(0xff198FB3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {}
                        ),
                        const TextSpan(
                          text: ' & ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {}
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
