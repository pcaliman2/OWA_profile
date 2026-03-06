import 'dart:async';
import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/size_config.dart';

class AnimatedHeroText extends StatefulWidget {
  const AnimatedHeroText({super.key});

  @override
  State<AnimatedHeroText> createState() => _AnimatedHeroTextState();
}

class _AnimatedHeroTextState extends State<AnimatedHeroText>
    with TickerProviderStateMixin {
  late AnimationController _wheelController;
  late Animation<double> _wheelAnimation;
  late Timer _wordTimer;

  int _currentWordIndex = 0;

  // List of words that will rotate (excluding "ONE WITH")
  final List<String> _rotatingWords = [
    'ALL',
    'COMMUNITY',
    'CENTER',
    'JOY',
    'MIND',
    'BODY',
    'SPIRIT',
  ];

  // Consistent text style for all text elements
  static const TextStyle _heroTextStyle = TextStyle(
    fontFamily: 'Basier Square Mono',
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.6, // 160% line height
    letterSpacing: 20, // 100% of 20px = 20px
  );

  @override
  void initState() {
    super.initState();

    // Animation controller for the wheel rotation effect
    _wheelController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Tween for smooth vertical translation
    _wheelAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _wheelController, curve: Curves.easeInOutCubic),
    );

    // Timer to change words every 3 seconds
    _wordTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _animateToNextWord();
    });
  }

  void _animateToNextWord() {
    _wheelController.forward().then((_) {
      setState(() {
        _currentWordIndex = (_currentWordIndex + 1) % _rotatingWords.length;
      });
      _wheelController.reset();
    });
  }

  @override
  void dispose() {
    _wheelController.dispose();
    _wordTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: const Text(
        'OWA° iiis Mexico City´s first wellness club, bringing together the essential pillars of human wellbeing in one place.',
        style: TextStyle(
          fontFamily: 'Basier Square Mono',
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w400,
          height: 1.6,
          letterSpacing: 0.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MobileAnimatedHeroText extends StatefulWidget {
  const MobileAnimatedHeroText({super.key});

  @override
  State<MobileAnimatedHeroText> createState() => _MobileAnimatedHeroTextState();
}

class _MobileAnimatedHeroTextState extends State<MobileAnimatedHeroText>
    with TickerProviderStateMixin {
  late AnimationController _wheelController;
  late Animation<double> _wheelAnimation;
  late Timer _wordTimer;

  int _currentWordIndex = 0;

  // List of words that will rotate (excluding "ONE WITH")
  final List<String> _rotatingWords = [
    'ALL',
    'COMMUNITY',
    'CENTER',
    'JOY',
    'MIND',
    'BODY',
    'SPIRIT',
  ];

  @override
  void initState() {
    super.initState();

    // Animation controller for the wheel rotation effect
    _wheelController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Tween for smooth vertical translation
    _wheelAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _wheelController, curve: Curves.easeInOutCubic),
    );

    // Timer to change words every 3 seconds
    _wordTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _animateToNextWord();
    });
  }

  void _animateToNextWord() {
    _wheelController.forward().then((_) {
      setState(() {
        _currentWordIndex = (_currentWordIndex + 1) % _rotatingWords.length;
      });
      _wheelController.reset();
    });
  }

  @override
  void dispose() {
    _wheelController.dispose();
    _wordTimer.cancel();
    super.dispose();
  }

  // Mobile-optimized text style matching CSS specifications
  TextStyle get _mobileHeroTextStyle {
    return TextStyle(
      fontFamily: 'Basier Square Mono',
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1.6, // 160% line height
      letterSpacing: 3, // 100% of 20px = 20px
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: const Text(
        'OWA° iis Mexico City´s first wellness club, bringing together the essential pillars of human wellbeing in one place.',
        style: TextStyle(
          fontFamily: 'Basier Square Mono',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.6,
          letterSpacing: 0.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
