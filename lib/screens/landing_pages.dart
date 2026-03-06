import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/is_desktop_from_context.dart';
import 'package:owa_flutter/widgets/bridge_section.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/widgets/discover_section.dart';
import 'package:owa_flutter/widgets/discover_section_mobile.dart';
import 'package:owa_flutter/widgets/events_section.dart';
import 'package:owa_flutter/widgets/events_section_mobile.dart';
import 'package:owa_flutter/widgets/follow_us_section.dart';
import 'package:owa_flutter/widgets/footer_section.dart';
import 'package:owa_flutter/widgets/hero_section.dart';
import 'package:owa_flutter/widgets/info_section.dart';
import 'package:owa_flutter/widgets/memberships_section.dart';
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/widgets/memberships_section_mobile.dart';
import 'package:owa_flutter/widgets/follow_us_section_mobile.dart';
import 'package:owa_flutter/widgets/mobile_footer.dart';
import 'package:owa_flutter/widgets/therapies_section.dart';
import 'package:owa_flutter/widgets/therapies_section_mobile.dart';

class OWALandingPage extends StatefulWidget {
  const OWALandingPage({super.key});

  @override
  State<OWALandingPage> createState() => _OWALandingPageState();
}

class _OWALandingPageState extends State<OWALandingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool isDesktop = isDesktopFromContext(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colors.backgroundColor,
      // Add drawer only for mobile
      drawer: !isDesktop ? const OWADrawer() : null,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children:
                  isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
            ),
          ),

          // Hamburger menu button for mobile
          if (!isDesktop) _buildHamburgerMenu(),
        ],
      ),
    );
  }

  Widget _buildHamburgerMenu() {
    return Positioned(
      top: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 28),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDesktopLayout() {
    return [
      /// Hero Section
      const HeroSection(),

      InfoSection(key: UniqueKey()),

      _buildDivider(),

      OWADiscoverSection(key: UniqueKey()),

      _buildDivider(),

      OWATherapiesSection(key: UniqueKey()),

      _buildDivider(),

      OWAEventsSection(key: UniqueKey()),

      OWAFollowUsSection(key: UniqueKey()),

      OWAFooter(key: UniqueKey()),
    ];
  }

  List<Widget> _buildMobileLayout() {
    return [
      const HeroSection(),

      InfoSectionMobile(key: UniqueKey()),

      _buildMobileDivider(),

      OWADiscoverSectionMobile(key: UniqueKey()),

      _buildMobileDivider(),

      OWATherapiesSectionMobile(key: UniqueKey()),

      _buildMobileDivider(),

      OWAEventsSectionMobile(key: UniqueKey()),

      /// Mobile Follow Us Section (you may need a mobile version)
      OWAFollowUsSectionMobile(key: UniqueKey()),

      /// Mobile Footer
      OWAMobileFooter(key: UniqueKey()),
    ];
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(42)),
      child: Container(
        width: double.infinity,
        height: SizeConfig.h(1),
        color: const Color(0xFF656565),
      ),
    );
  }

  Widget _buildMobileDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(20), // Reduced padding for mobile
      ),
      child: Container(
        width: double.infinity,
        height: SizeConfig.h(1),
        color: const Color(0xFF656565),
      ),
    );
  }
}
