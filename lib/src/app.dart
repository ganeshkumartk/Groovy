// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fitness/home/groovy_dashboard_screen.dart';
import 'fitness/splashscreen.dart';
import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class Groovy extends StatelessWidget {
  const Groovy({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            systemNavigationBarColor: Color(0xffF5F0E7),
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Color(0xffF5F0E7),
            statusBarIconBrightness: Brightness.dark,
          ),
          child: MaterialApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            title: 'Groovy',
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'app',
            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(
              useMaterial3: true,
              androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
              textTheme: GoogleFonts.cormorantTextTheme(
                Theme.of(context)
                    .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
              ),
            ),
            darkTheme: ThemeData(
              colorSchemeSeed: Colors.amber,
              useMaterial3: true,
              androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
              textTheme: GoogleFonts.cormorantTextTheme(
                Theme.of(context)
                    .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
              ),
            ),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SplashScreenView.routeName:
                      return const SplashScreenView();
                    case GroovyDashboardScreenView.routeName:
                      return const GroovyDashboardScreenView();
                    default:
                      return const SplashScreenView();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
