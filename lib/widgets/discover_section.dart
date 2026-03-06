import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/widgets/discover_card.dart';
import 'package:owa_flutter/widgets/fade_in_widget.dart';
import 'package:owa_flutter/widgets/headline.dart';

class OWADiscoverSection extends StatelessWidget {
  const OWADiscoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(1440),
      height: 978.0, //SizeConfig.h(978.0),
      color: colors.backgroundColor, // Same as body background
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(42)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side - Title
              SizedBox(
                width: SizeConfig.w(330),
                child: Headline(
                  child: Text(
                    'DISCOVER OWA',
                    style: TextStyle(
                      fontFamily: 'Basier Square Mono',
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.t(19),
                      height: 1.51,
                      letterSpacing: SizeConfig.t(19) * 0.12,
                      color: const Color(0xFF2C2C2C),
                    ),
                  ),
                ),
              ),

              SizedBox(width: SizeConfig.w(20)),

              // Right side - Description
              SizedBox(
                width: SizeConfig.w(430),
                height: SizeConfig.w(72),
                child: Headline(
                  child: Text(
                    'From our wellness club and café to our guest residences and creative collaborations, OWA brings together the essential dimensions of wellbeing under one vision.',
                    style: TextStyle(
                      fontFamily: 'Arbeit',
                      fontWeight: FontWeight.w300,
                      fontSize: SizeConfig.t(15),
                      height: 24 / 15,
                      letterSpacing: 0,
                      color: const Color(0xFF2C2C2C),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: SizeConfig.h(80)),

          // Cards grid
          FadeInWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Wellness Club Card
                Expanded(
                  child: DiscoverCard(
                    imagePath: 'assets/discover_1.jpg',
                    title: 'WELLNESS CLUB',
                    buttonText: 'BOOK A SESSION',
                    description:
                        'Step into a space of rhythm and release. With private saunas, invigorating cold plunges, and serene lounge areas, OWA\'s Wellness Club is designed for mindful recovery, whether in solitude or shared with others.',
                    onButtonTap: () {
                      // Handle book a session
                    },
                  ),
                ),

                SizedBox(width: SizeConfig.w(20)),

                // SESEN Room x OWA Card
                Expanded(
                  child: DiscoverCard(
                    imagePath: 'assets/discover_2.jpg',
                    title: 'SESEN ROOM X OWA',
                    buttonText: 'LEARN MORE',
                    description:
                        'SESEN Room x OWA brings Mexico City\'s most trusted name in supplements to Roma Norte. Featuring premium collagen-based formulations and a food offering that is both elevated and restorative, it\'s a destination for those who see nutrition as a cornerstone of wellbeing.',
                    onButtonTap: () {
                      // Handle learn more
                    },
                  ),
                ),

                SizedBox(width: SizeConfig.w(20)),

                // Casa OWA Card
                Expanded(
                  child: DiscoverCard(
                    imagePath: 'assets/discover_3.jpg',
                    title: 'CASA OWA',
                    buttonText: 'RESERVE YOUR STAY',
                    description:
                        'A collection of nine elevated residences in Roma Norte—Mexico City\'s most vibrant neighborhood. CASA OWA blends the comfort of a private apartment with concierge service and the highest level of hospitality. With full access to the Wellness Club, every stay feels like an immersive OWA experience, far beyond a typical hotel stay.',
                    onButtonTap: () {
                      // Handle reserve stay
                    },
                  ),
                ),

                SizedBox(width: SizeConfig.w(20)),

                // Collaborations Card
                Expanded(
                  child: DiscoverCard(
                    imagePath: 'assets/discover_4.jpg',
                    title: 'COLLABORATIONS',
                    buttonText: 'CONTACT US TO GET STARTED',
                    description:
                        'OWA\'s rooftop is designed for curated happenings—wellness sessions, cultural gatherings, and intimate events that bring people together. Whether joining as a guest or creating alongside us as a partner, every experience here reflects the spirit of OWA: connection, creativity, and wellbeing.',
                    onButtonTap: () {
                      // Handle contact us
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
