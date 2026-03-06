import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/widgets/fade_in_widget.dart';
import 'package:owa_flutter/widgets/headline.dart';
import 'package:owa_flutter/widgets/membership_card.dart';

class MembershipsSection extends StatelessWidget {
  const MembershipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(1440),
      height: 864, // SizeConfig.w(864),
      color: colors.backgroundColor,
      padding: EdgeInsets.only(
        left: SizeConfig.w(42),
        right: SizeConfig.w(42),
        top: SizeConfig.h(137),
        bottom: SizeConfig.h(137 / 2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Memberships Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headline(
                child: Text(
                  'MEMBERSHIPS',
                  style: TextStyle(
                    fontFamily: 'Basier Square Mono',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.t(19),
                    height: 1.51,
                    letterSpacing: 0.12,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(width: SizeConfig.w(150)),

              // Description Text
              SizedBox(
                width: SizeConfig.w(444),
                child: Headline(
                  child: Text(
                    'Memberships at OWA are designed to meet you where you are. Whether you join as a full member, visit often with a travel pass, or drop in for a day, each option offers access to our therapies, spaces, and community—tailored to your schedule.',
                    style: TextStyle(
                      fontFamily: 'Arbeit',
                      fontWeight: FontWeight.w300,
                      fontSize: SizeConfig.t(15),
                      height: 24 / 15, // line-height / font-size
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: SizeConfig.h(80)),

          // Membership Cards Row
          FadeInWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MembershipCard(
                  number: '01',
                  title: 'FULL ACCESS',
                  imagePath:
                      'assets/membership_1.jpg', // Update with your asset path
                  description:
                      'Your everyday sanctuary—unlimited access to the OWA way of life.',
                  buttonColor: Colors.transparent,
                  buttonTextColor: Colors.white,
                ),
                // SizedBox(width: 12),
                MembershipCard(
                  number: '02',
                  title: 'TRAVEL PASS',
                  imagePath:
                      'assets/membership_2.png', // Update with your asset path
                  description:
                      'Up to 10 visits per month, no expiration. For those who come and go without restrictions.',
                  buttonColor: Colors.transparent,
                  buttonTextColor: Colors.white,
                ),
                // SizedBox(width: 12),
                MembershipCard(
                  number: '03',
                  title: 'DAY PASS',
                  imagePath:
                      'assets/membership_3.jpg', // Update with your asset path
                  description:
                      'For those who seek a single day of restoration and reset.',
                  buttonColor: Colors.transparent, // Yellow color
                  buttonTextColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
