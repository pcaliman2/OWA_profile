import 'package:owa_flutter/screens/landing_page.dart';
import 'package:owa_flutter/useful/is_desktop_from_context.dart';
import 'package:owa_flutter/useful/size_config.dart';
import 'package:flutter/material.dart';

class OWAApp extends StatelessWidget {
  const OWAApp({super.key});
  @override
  Widget build(BuildContext context) {
    /// Set your Figma frame size
    SizeConfig.init(
      context,
      figmaWidth: isDesktopFromContext(context) ? 1440 : 430,
      figmaHeight: isDesktopFromContext(context) ? 885 : 932,
    );
    // print("==============================");
    // print("width: ${MediaQuery.of(context).size.width}");
    // print("height: ${MediaQuery.of(context).size.height}");

    // print("SizeConfig.screenWidth: ${SizeConfig.screenWidth}");
    // print("SizeConfig.screenHeight: ${SizeConfig.screenHeight}");

    // print("SizeConfig.scaleWidth: ${SizeConfig.scaleWidth}");
    // print("SizeConfig.scaleHeight: ${SizeConfig.scaleHeight}");
    // print("==============================");

    return MaterialApp(
      title: 'OWA',
      theme: ThemeData(primarySwatch: Colors.brown, fontFamily: 'Inter'),
      home: const OWALandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
