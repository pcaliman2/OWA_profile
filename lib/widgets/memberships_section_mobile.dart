import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/widgets/fade_in_widget.dart';
import 'package:owa_flutter/widgets/headline.dart';
import 'package:owa_flutter/widgets/membership_card_mobile.dart';

class MembershipsSectionMobile extends StatefulWidget {
  const MembershipsSectionMobile({super.key});

  @override
  State<MembershipsSectionMobile> createState() =>
      _MembershipsSectionMobileState();
}

class _MembershipsSectionMobileState extends State<MembershipsSectionMobile> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> cardData = [
    {
      'number': '01',
      'title': 'FULL ACCESS',
      'imagePath': 'assets/membership_1.jpg',
      'description':
          'Your everyday sanctuary—unlimited access to the OWA way of life.',
      'buttonColor': Colors.transparent,
      'buttonTextColor': Colors.white,
    },
    {
      'number': '02',
      'title': 'TRAVEL PASS',
      'imagePath': 'assets/membership_2.png',
      'description':
          'Up to 10 visits per month, no expiration. For those who come and go without restrictions.',
      'buttonColor': Colors.transparent,
      'buttonTextColor': Colors.white,
    },
    {
      'number': '03',
      'title': 'DAY PASS',
      'imagePath': 'assets/membership_3.jpg',
      'description':
          'For those who seek a single day of restoration and reset.',
      'buttonColor': Colors.transparent,
      'buttonTextColor': Colors.white,
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
      padding: EdgeInsets.symmetric(horizontal: 27, vertical: SizeConfig.h(80)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Headline(
            child: Text(
              'MEMBERSHIPS',
              style: TextStyle(
                fontFamily: 'Basier Square Mono',
                fontWeight: FontWeight.w400,
                fontSize: 19,
                height: 1.51,
                letterSpacing: 19 * 0.12,
                color: const Color(0xFF2C2C2C),
              ),
            ),
          ),

          SizedBox(height: SizeConfig.h(20)),

          // Description Text
          Headline(
            child: Text(
              'Memberships at OWA are designed to meet you where you are. Whether you join as a full member, visit often with a travel pass, or drop in for a day, each option offers access to our therapies, spaces, and community—tailored to your schedule.',
              style: TextStyle(
                fontFamily: 'Arbeit',
                fontWeight: FontWeight.w300,
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
              child: MembershipCardMobile(
                number: cardData[currentIndex]['number'],
                title: cardData[currentIndex]['title'],
                imagePath: cardData[currentIndex]['imagePath'],
                description: cardData[currentIndex]['description'],
                buttonColor: cardData[currentIndex]['buttonColor'],
                buttonTextColor: cardData[currentIndex]['buttonTextColor'],
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
