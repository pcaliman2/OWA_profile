import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/widgets/discover_card_mobile.dart';
import 'package:owa_flutter/widgets/fade_in_widget.dart';
import 'package:owa_flutter/widgets/headline.dart';

class OWADiscoverSectionMobile extends StatefulWidget {
  const OWADiscoverSectionMobile({super.key});

  @override
  State<OWADiscoverSectionMobile> createState() =>
      _OWADiscoverSectionMobileState();
}

class _OWADiscoverSectionMobileState extends State<OWADiscoverSectionMobile> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> cardData = [
    {
      'imagePath': 'assets/discover_1.jpg',
      'title': 'WELLNESS CLUB',
      'buttonText': 'BOOK A SESSION',
      'description':
          'Step into a space of rhythm and release. With private saunas, invigorating cold plunges, and serene lounge areas, OWA\'s Wellness Club is designed for mindful recovery, whether in solitude or shared with others.',
      'onButtonTap': () {
        // Handle book a session
      },
    },
    {
      'imagePath': 'assets/discover_2.jpg',
      'title': 'SESEN ROOM X OWA',
      'buttonText': 'LEARN MORE',
      'description':
          'SESEN Room x OWA brings Mexico City\'s most trusted name in supplements to Roma Norte. Featuring premium collagen-based formulations and a food offering that is both elevated and restorative, it\'s a destination for those who see nutrition as a cornerstone of wellbeing.',
      'onButtonTap': () {
        // Handle learn more
      },
    },
    {
      'imagePath': 'assets/discover_3.jpg',
      'title': 'CASA OWA',
      'buttonText': 'RESERVE YOUR STAY',
      'description':
          'A collection of nine elevated residences in Roma Norte—Mexico City\'s most vibrant neighborhood. CASA OWA blends the comfort of a private apartment with concierge service and the highest level of hospitality. With full access to the Wellness Club, every stay feels like an immersive OWA experience, far beyond a typical hotel stay.',
      'onButtonTap': () {
        // Handle reserve stay
      },
    },
    {
      'imagePath': 'assets/discover_4.jpg',
      'title': 'COLLABORATIONS',
      'buttonText': 'CONTACT US TO GET STARTED',
      'description':
          'OWA\'s rooftop is designed for curated happenings—wellness sessions, cultural gatherings, and intimate events that bring people together. Whether joining as a guest or creating alongside us as a partner, every experience here reflects the spirit of OWA: connection, creativity, and wellbeing.',
      'onButtonTap': () {
        // Handle contact us
      },
    },
  ];

  void _previousCard() {
    setState(() {
      currentIndex = currentIndex > 0 ? currentIndex - 1 : cardData.length - 1;
    });
  }

  void _nextCard() {
    setState(() {
      currentIndex = currentIndex < cardData.length - 1 ? currentIndex + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: colors.backgroundColor,
      padding: EdgeInsets.symmetric(
        // horizontal: SizeConfig.w(42),
        horizontal: 27,
        vertical: SizeConfig.h(80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side - Title
          Headline(
            child: Text(
              'DISCOVER OWA',
              style: TextStyle(
                fontFamily: 'Basier Square Mono',
                fontWeight: FontWeight.w400,
                // fontSize: SizeConfig.t(19),
                fontSize: 19,
                height: 1.51,
                letterSpacing: SizeConfig.t(19) * 0.12,
                color: const Color(0xFF2C2C2C),
              ),
            ),
          ),

          SizedBox(height: SizeConfig.h(20)),

          // Right side - Description
          Headline(
            child: Text(
              'From our wellness club and café to our guest residences and creative collaborations, OWA brings together the essential dimensions of wellbeing under one vision.',
              style: TextStyle(
                fontFamily: 'Arbeit',
                fontWeight: FontWeight.w300,
                // fontSize: SizeConfig.t(15),
                fontSize: 15,
                height: 24 / 15,
                letterSpacing: 0,
                color: const Color(0xFF2C2C2C),
              ),
            ),
          ),

          SizedBox(height: SizeConfig.h(80)),

          // Single card container
          FadeInWidget(
            child: SizedBox(
              width: double.infinity,
              child: DiscoverCardMobile(
                imagePath: cardData[currentIndex]['imagePath'],
                title: cardData[currentIndex]['title'],
                buttonText: cardData[currentIndex]['buttonText'],
                description: cardData[currentIndex]['description'],
                onButtonTap: cardData[currentIndex]['onButtonTap'],
              ),
            ),
          ),

          SizedBox(height: SizeConfig.h(40)),

          // Navigation controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Previous button
              GestureDetector(
                onTap: _previousCard,
                child: Container(
                  // width: SizeConfig.w(40),
                  // height: SizeConfig.w(40),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF2C2C2C),
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      // size: SizeConfig.t(16),
                      size: 16,
                      color: const Color(0xFF2C2C2C),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 20),

              // Next button
              GestureDetector(
                onTap: _nextCard,
                child: Container(
                  // width: SizeConfig.w(40),
                  // height: SizeConfig.w(40),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF2C2C2C),
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    // size: SizeConfig.t(16),
                    size: 16,
                    color: const Color(0xFF2C2C2C),
                  ),
                ),
              ),
              Spacer(),
              // Page indicator
              Text(
                '${(currentIndex + 1).toString().padLeft(2, '0')} / ${cardData.length.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontFamily: 'Basier Square Mono',
                  fontWeight: FontWeight.w400,
                  fontSize: 9.0,
                  color: const Color(0xFF2C2C2C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
