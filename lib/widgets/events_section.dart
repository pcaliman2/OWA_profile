import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/widgets/fade_in_widget.dart';
import 'package:owa_flutter/widgets/headline.dart';

class OWAEventsSection extends StatelessWidget {
  const OWAEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(1440),
      color: colors.backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(42),
        vertical: SizeConfig.h(80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título y línea horizontal
          Text(
            'Events',
            style: TextStyle(
              fontFamily: 'Basier Square Mono',
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.t(19),
              color: const Color(0xFF2C2C2C),
            ),
          ),
          SizedBox(height: SizeConfig.h(12)),
          Container(
            width: double.infinity,
            height: SizeConfig.h(1),
            color: const Color(0xFF656565),
          ),
          SizedBox(height: SizeConfig.h(30)),
          // Descripción y texto adicional
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Descripción con ancho fijo
              SizedBox(
                width: SizeConfig.w(480),
                child: Text(
                  'From contrast therapies to advanced technologies, each session invites you to invigorate, reset, restore, and realign.',
                  style: TextStyle(
                    fontFamily: 'Basier Square',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.t(15),
                    color: const Color(0xFF2C2C2C),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.w(32)),
              // Texto adicional en rojo con ancho fijo
              SizedBox(
                width: SizeConfig.w(220),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Integrar eventos con API',
                      style: TextStyle(
                        fontFamily: 'Basier Square',
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.t(15),
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      'Mindbody',
                      style: TextStyle(
                        fontFamily: 'Basier Square',
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.t(15),
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(50)),
          // Grid de eventos
          FadeInWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEventCard(
                  context: context,
                  imagePath: 'assets/events1.png',
                  title: 'BOOK YOUR SPOT',
                  date: '06 Jan 2026',
                  description: 'Soundhealing. King Lafa. 8:00 pm\n\$600 MXN PP',
                ),
                SizedBox(width: SizeConfig.w(20)),
                _buildEventCard(
                  context: context,
                  imagePath: 'assets/events2.png',
                  title: 'BOOK YOUR SPOT',
                  date: '06 Jan 2026',
                  description: 'Soundhealing. King Lafa. 8:00 pm \$600 MXN PP',
                ),
                SizedBox(width: SizeConfig.w(20)),
                _buildEventCard(
                  context: context,
                  imagePath: 'assets/events3.png',
                  title: 'BOOK YOUR SPOT',
                  date: '06 Jan 2026',
                  description: 'Soundhealing. King Lafa. 8:00 pm \$600 MXN PP',
                ),
                SizedBox(width: SizeConfig.w(20)),
                _buildEventCard(
                  context: context,
                  imagePath: 'assets/events4.png',
                  title: 'BOOK YOUR SPOT',
                  date: '06 Jan 2026',
                  description: 'Soundhealing. King Lafa. 8:00 pm \$600 MXN PP',
                ),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.h(60)),

          // See All Events Button (comentado temporalmente)
          /*
          Center(
            child: TextButton(
              onPressed: () {
                // Handle see all events
              },
              child: Text(
                'SEE ALL EVENTS',
                style: TextStyle(
                  fontFamily: 'Basier Square Mono',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.t(12),
                  letterSpacing: 0.5,
                  color: const Color(0xFF2C2C2C),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          */
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String date,
    required String description,
    String precio = '\$600 MXN',
  }) {
    // Dimensiones exactas del diseño
    final imageWidth = 320.0;
    final imageHeight = 299.87;
    final imageRadius = 10.0;

    return SizedBox(
      width: imageWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: imageWidth,
            height: imageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(imageRadius),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.h(20)),

          // Date y Precio en la misma línea
          Row(
            children: [
              Expanded(
                child: Text(
                  date,
                  style: TextStyle(
                    fontFamily: 'Basier Square Mono',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.t(12),
                    height: 1.73,
                    letterSpacing: 0,
                    color: const Color(0xFF646464),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  precio,
                  style: TextStyle(
                    fontFamily: 'Basier Square Mono',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.t(12),
                    height: 1.73,
                    letterSpacing: 0,
                    color: const Color(0xFF646464),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.h(8)),

          // Description box con layout exacto
          Container(
            width: 281.29,
            height: 42,
            alignment: Alignment.topLeft,
            child: Text(
              description,
              style: TextStyle(
                fontFamily: 'Arbeit',
                fontWeight: FontWeight.w300,
                fontSize: SizeConfig.t(12),
                height: 1.67,
                letterSpacing: 0,
                color: const Color(0xFF2C2C2C),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: SizeConfig.h(12)),

          // Title
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Basier Square Mono',
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.t(14),
              height: 1.45,
              letterSpacing: SizeConfig.t(14) * 0.04,
              color: const Color(0xFF2C2C2C),
            ),
          ),
        ],
      ),
    );
  }
}
