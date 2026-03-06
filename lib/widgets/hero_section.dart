import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import 'package:owa_flutter/widgets/animated_hero_text.dart';
import 'package:owa_flutter/crud/privacy_notice_screen.dart';
import 'package:owa_flutter/widgets/owa_animated_nav_item.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _heroController;
  late AnimationController _textController;
  late Animation<double> _heroZoomAnimation;
  late Animation<double> _heroOpacityAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();

    // Hero image animation controller
    _heroController = AnimationController(
      duration: const Duration(milliseconds: 8000),
      vsync: this,
    );

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Hero zoom animation - subtle ken-burns effect
    _heroZoomAnimation = Tween<double>(begin: 1.08, end: 1.0).animate(
      CurvedAnimation(parent: _heroController, curve: Curves.easeOutCubic),
    );

    // Hero opacity animation
    _heroOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _heroController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    // Text fade animation
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    // Text slide animation
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    // Start animations
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _heroController.forward();
      Future.delayed(const Duration(milliseconds: 600), () {
        _textController.forward();
      });
    });
  }

  @override
  void dispose() {
    _heroController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // Split Background Images
          _buildSplitBackgrounds(),

          // Navigation Header
          _buildNavigationHeader(),

          // Center Hero Text with Animation
          _buildCenterHeroText(),

          // Bottom Right Logo Icon
          // _buildBottomRightIcon(),
        ],
      ),
    );
  }

  Widget _buildSplitBackgrounds() {
    return Row(
      children: [
        // Left Bar - Blue accent line
        Container(
          width: 8,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFF0A7FD1), // Blue accent color
        ),

        // Main Hero Image
        Expanded(
          child: ClipRect(
            child: AnimatedBuilder(
              animation: Listenable.merge([
                _heroZoomAnimation,
                _heroOpacityAnimation,
              ]),
              builder: (context, child) {
                return Transform.scale(
                  scale: _heroZoomAnimation.value,
                  child: Opacity(
                    opacity: _heroOpacityAnimation.value,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/bridge1a.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Dark overlay for better text contrast
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.2),
                              Colors.black.withValues(alpha: 0.4),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationHeader() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Logo - positioned to the left
              AnimatedBuilder(
                animation: _textFadeAnimation,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _textFadeAnimation,
                    child: SlideTransition(
                      position: _textSlideAnimation,
                      child: GestureDetector(
                        onTap:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OWAPrivacyNoticePage(),
                              ),
                            ),
                        child: _buildLogo(),
                      ),
                    ),
                  );
                },
              ),

              // Left Navigation Items (Basier Square Mono)
              Expanded(
                child: AnimatedBuilder(
                  animation: _textFadeAnimation,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _textFadeAnimation,
                      child: SlideTransition(
                        position: _textSlideAnimation,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildNavItem(
                              'BECOME A MEMBER',
                              NavItemType.squareMono,
                            ),
                            const SizedBox(width: 40),
                            _buildNavItem(
                              'BOOK A SESSION',
                              NavItemType.squareMono,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Right Navigation Items (Basier Circle Mono)
              AnimatedBuilder(
                animation: _textFadeAnimation,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _textFadeAnimation,
                    child: SlideTransition(
                      position: _textSlideAnimation,
                      child: Row(
                        children: [
                          _buildNavItem('SERVICES', NavItemType.circleMono),
                          const SizedBox(width: 40),
                          _buildNavItem('SCIENCE', NavItemType.circleMono),
                          const SizedBox(width: 40),
                          _buildNavItem('THERAPIES', NavItemType.circleMono),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/OWA_Logo.svg',
        height: 200, // Match your navbar height
        fit: BoxFit.fitWidth,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );

    // return Row(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     const Text(
    //       ' O',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 32,
    //         fontWeight: FontWeight.w300,
    //         letterSpacing: 4.0,
    //       ),
    //     ),
    //     const SizedBox(width: 16),
    //     const Text(
    //       'W',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 32,
    //         fontWeight: FontWeight.w300,
    //         letterSpacing: 4.0,
    //       ),
    //     ),
    //     const SizedBox(width: 16),
    //     const Text(
    //       'A°',
    //       style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 32,
    //         fontWeight: FontWeight.w300,
    //         letterSpacing: 4.0,
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget _buildNavItem(String text, NavItemType type) {
    return OWAAnimatedNavItem(text: text, type: type);
  }

  Widget _buildCenterHeroText() {
    return Positioned.fill(
      child: Center(
        child: AnimatedBuilder(
          animation: _textFadeAnimation,
          builder: (context, child) {
            return FadeTransition(
              opacity: _textFadeAnimation,
              child: SlideTransition(
                position: _textSlideAnimation,
                child: const AnimatedHeroText(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HeroSectionMobile extends StatefulWidget {
  const HeroSectionMobile({super.key});

  @override
  State<HeroSectionMobile> createState() => _HeroSectionMobileState();
}

class _HeroSectionMobileState extends State<HeroSectionMobile>
    with TickerProviderStateMixin {
  late AnimationController _heroController;
  late AnimationController _textController;
  late Animation<double> _heroZoomAnimation;
  late Animation<double> _heroOpacityAnimation;
  late Animation<double> _textFadeAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();

    // Hero image animation controller
    _heroController = AnimationController(
      duration: const Duration(milliseconds: 8000),
      vsync: this,
    );

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Hero zoom animation - subtle ken-burns effect
    _heroZoomAnimation = Tween<double>(begin: 1.08, end: 1.0).animate(
      CurvedAnimation(parent: _heroController, curve: Curves.easeOutCubic),
    );

    // Hero opacity animation
    _heroOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _heroController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    // Text fade animation
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    // Text slide animation
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    // Start animations
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _heroController.forward();
      Future.delayed(const Duration(milliseconds: 600), () {
        _textController.forward();
      });
    });
  }

  @override
  void dispose() {
    _heroController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // Split Background Images
          _buildSplitBackgrounds(),

          // Navigation Header
          _buildNavigationHeader(),

          // Center Hero Text with Animation
          _buildCenterHeroText(),

          // Bottom Right Logo Icon
          // _buildBottomRightIcon(),
        ],
      ),
    );
  }

  Widget _buildSplitBackgrounds() {
    return Column(
      children: [
        // Left Half - Water/Ocean Image
        Expanded(
          child: ClipRect(
            child: AnimatedBuilder(
              animation: Listenable.merge([
                _heroZoomAnimation,
                _heroOpacityAnimation,
              ]),
              builder: (context, child) {
                return Transform.scale(
                  scale: _heroZoomAnimation.value,
                  child: Opacity(
                    opacity: _heroOpacityAnimation.value,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/hero_left.jpg',
                          ), // Your left background image
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Dark overlay for better text contrast
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.15),
                              Colors.black.withValues(alpha: 0.4),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Right Half - Person Image
        Expanded(
          child: ClipRect(
            child: AnimatedBuilder(
              animation: Listenable.merge([
                _heroZoomAnimation,
                _heroOpacityAnimation,
              ]),
              builder: (context, child) {
                return Transform.scale(
                  scale: _heroZoomAnimation.value,
                  child: Opacity(
                    opacity: _heroOpacityAnimation.value,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/hero_right.png',
                          ), // Your right background image
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Subtle warm overlay
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.1),
                              Colors.black.withValues(alpha: 0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationHeader() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AnimatedBuilder(
            animation: _textFadeAnimation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _textFadeAnimation,
                child: SlideTransition(
                  position: _textSlideAnimation,
                  child: GestureDetector(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OWAPrivacyNoticePage(),
                          ),
                        ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'O',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 3.0,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'W',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 3.0,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'A°',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCenterHeroText() {
    return Positioned.fill(
      child: Center(
        child: AnimatedBuilder(
          animation: _textFadeAnimation,
          builder: (context, child) {
            return FadeTransition(
              opacity: _textFadeAnimation,
              child: SlideTransition(
                position: _textSlideAnimation,
                child: const MobileAnimatedHeroText(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class OWADrawer extends StatelessWidget {
  const OWADrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFEDE8E1), // Beige/cream background
      width: MediaQuery.of(context).size.width, // Full width drawer
      child: SafeArea(
        child: Column(
          children: [
            // Header with logo and close button
            _buildDrawerHeader(context),

            // Navigation items
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    _buildMenuItem('BECOME A MEMBER'),
                    const SizedBox(height: 32),
                    _buildMenuItem('BOOK A SESSION'),
                    const SizedBox(height: 32),
                    _buildMenuItem('SERVICES'),
                    const SizedBox(height: 32),
                    _buildMenuItem('SCIENCE'),
                    const SizedBox(height: 32),
                    _buildMenuItemWithIcon('THERAPIES'),
                  ],
                ),
              ),
            ),

            // Footer with chat icon and links
            _buildDrawerFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'O',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.8),
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 8.0,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'W',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.8),
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 8.0,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'A°',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.8),
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 8.0,
                ),
              ),
            ],
          ),

          // Close button
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black, size: 28),
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 2.0,
        height: 1.5,
      ),
    );
  }

  Widget _buildMenuItemWithIcon(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.0,
            height: 1.5,
          ),
        ),
        const SizedBox(width: 12),
        Icon(
          Icons.arrow_outward,
          size: 16,
          color: Colors.black.withValues(alpha: 0.7),
        ),
      ],
    );
  }

  Widget _buildDrawerFooter() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chat icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withValues(alpha: 0.3),
                width: 1.5,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chat_bubble_outline,
              size: 20,
              color: Colors.black.withValues(alpha: 0.7),
            ),
          ),

          const SizedBox(height: 24),

          // Footer links - left side
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterLink('Creative Strategy'),
                    const SizedBox(height: 12),
                    _buildFooterLink('Terms of Service'),
                    const SizedBox(height: 12),
                    _buildFooterLink('Privacy Policy'),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // Footer links - right side
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterLink('Cookies'),
                    const SizedBox(height: 12),
                    _buildFooterLink('Disclaimers'),
                    const SizedBox(height: 12),
                    _buildFooterLink('© All rights reserved 2025'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black.withValues(alpha: 0.4),
        fontSize: 11,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.5,
        height: 1.3,
      ),
    );
  }
}
