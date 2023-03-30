/*import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home/storypots_dashboard_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';

/// Displays detailed information about a SampleItem.
class TermsAndConditionsScreenView extends StatelessWidget {
  const TermsAndConditionsScreenView({Key? key}) : super(key: key);

  static const routeName = '/terms_and_conditions';

  static const String tocText = ''' 

# Data we don't collect 

1. We do not ask for a login. Logins lead to personal data. We are not collecting that.

2. You may optionally provide name and email which the company might use for contacting you regarding your feedback. This information will not be shared with any external party.

3. We uniquely identify the device you are using but not you. If you use multiple devices then we don't anything to aggregate your data across multiple devices.

4. We do not link any Personal Identifiable Information (PII) with your device identifier.

5. Your personal data is not going to be connected to other data sets.

# Data we process 

We process some data to get to learn more about you - Country, City, Device model, OS, Browser, Service provider. (You can find a more detailed list in our privacy policy).

# How we use your data 

We use this minimal data for -

1. Analysing and improving your reading experience.

2. Complying with laws and protecting the rights or safety of StoryPots users.

3. Creating reports using anonymous aggregated data for statistical and analytical purposes. The app uses Google Analytics enhanced demographics and interests reporting (Google Signals) for understanding its users better.

We just need your consent to peek into it to learn about you from it. For the stories, of course.

# Writer's Stories 

The stories on StoryPots are the Intellectual Property of the Writers. Please do not use these stories to write your own book, script or a film. Even writing a story "substantially similar" to something you read here is not acceptable. Sharing is encouraged, of course.

# Usage 

You may use these stories only to impress, engage or introduce something. Not to monetize. Heck, we haven't done it ourselves yet. It'd be ironic if you beat us to it. (And even if we did monetise some of it one day, you would still not be permitted to.)

# To Do or Not To Do 

You are allowed and in fact encouraged to use the app. You are not allowed to reverse-engineer the app, disassemble it in any way to find out how it works, find out any weaknesses or security vulnerabilities in it. Sorry, but these are things we need to make clear. If you encounter any suspected security vulnerability or flaw in the app, please report it to us by email on [support@storypots.app](mailto:support@storypots.app) as soon as you can.

You are not allowed to use the StoryPots service by any means other than the apps we are providing on official app stores for general use. For instance, you are not permitted to write your own software which will connect to the StoryPots server, fetch stories and other data from them, and display stories on your software's screen.

You are not allowed to replicate our stories onto any other data storage system or transmit them to any other system for processing or consumption in any manner. You are allowed to store or share the stories only as per the features provided in our app.

# Get in Touch 

If you find any story objectionable for any reason, please report the story to us by "sharing" it, then selecting your favourite email app on your phone, then sending us the story by email to [support@storypots.app](mailto:support@storypots.app), with a note telling us why you felt this story is objectionable.

We promise to revert to each such email we receive. We take these things very seriously. Alternatively, you can also tell us via feedback on the app.


___We're sure you agree. You're a good human being, after all :)___''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffF5F0E7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 28, bottom: 18),
            child: Text(
              'Say I do',
              style: GoogleFonts.numans(
                textStyle: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Scrollbar(
                child: Markdown(
                  data: tocText,
                  styleSheet: MarkdownStyleSheet().copyWith(
                    h1: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    p: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints.tightFor(width: 300, height: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.restorablePushNamed(
                      context,
                      StoryPotsDashboardScreenView.routeName,
                    );
                  },
                  child: const Text(
                    'Accept & Continue',
                    style: TextStyle(
                      color: Color.fromARGB(255, 82, 65, 35),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
