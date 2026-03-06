import 'package:flutter/material.dart';
import 'package:owa_flutter/widgets/action_button.dart';
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/widgets/headline.dart';

class OWALandingPage extends StatelessWidget {
  const OWALandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 236, 228, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Main content section
            InfoSection(),

            // Footer
            Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 900),
                color: const Color.fromRGBO(210, 205, 191, 1),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.w(40),
                  vertical: SizeConfig.h(60),
                ),
                child: const Text(
                  'Footer Content Here',
                  style: TextStyle(color: Color(0xFF2C2C2C), fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 900), // Limita el ancho máximo
        // width: double.infinity, // Eliminado para evitar expansión
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(40), // Menos padding lateral
          vertical: SizeConfig.h(200),
        ),
        child: Column(
          children: [
            // Hero heading
            Container(
              margin: EdgeInsets.only(bottom: SizeConfig.h(60)),
              child: Headline(
                child: Text(
                  'Practice the art of being well',
                  style: TextStyle(
                    fontFamily: 'Basier Square Mono',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.t(19),
                    height: 1.51,
                    letterSpacing: SizeConfig.t(19) * 0.12,
                    color: Color(0xFF2C2C2C),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Description text
            //Container(
            //  margin: EdgeInsets.only(bottom: SizeConfig.h(80)),
            //  constraints: BoxConstraints(maxWidth: SizeConfig.w(600)),
            //  child: Headline(
            //    child: Text(
            //      'OWA is Mexico City\'s first wellness club of its kind—bringing together the essential pillars of human wellbeing in one place. By integrating contrast therapies, nutrition, supplementation, social connection, and hospitality, OWA creates an integrated ecosystem designed for vitality.',
            //      style: TextStyle(
            //        fontFamily: 'Arbeit',
            //        fontWeight: FontWeight.w300,
            //        fontSize: SizeConfig.t(15),
            //        height: 24 / 15,
            //        letterSpacing: 0,
            //        color: Color(0xFF2C2C2C),
            //      ),
            //      textAlign: TextAlign.center,
            //    ),
            //  ),
            //),

            // Action buttons ocultos por solicitud
            // const ActionButtonsRow(),
          ],
        ),
      ),
    );
  }
}

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    // --- INICIO: Sección comentada por solicitud ---
    /*
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'OWA is Mexico City\'s first wellness club of its kind—bringing together the essential pillars of human wellbeing in one place. By integrating contrast therapies, nutrition, supplementation, social connection, and hospitality, OWA creates an integrated ecosystem designed for vitality.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('BOOK A SESSION'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('BECOME A MEMBER'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('STAY AT OWA'),
              ),
            ],
          ),
        ],
      ),
      */
    // --- FIN: Sección comentada por solicitud ---
    // Retorno alternativo para evitar errores
    return SizedBox.shrink();
  }
}

class InfoSectionMobile extends StatelessWidget {
  const InfoSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.w(40),
          vertical: SizeConfig.h(200),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: SizeConfig.h(40)),
              child: Headline(
                child: Text(
                  'Practice the art of being well',
                  style: TextStyle(
                    fontFamily: 'Basier Square Mono',
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                    height: 1.51,
                    letterSpacing: 19 * 0.12,
                    color: const Color(0xFF2C2C2C),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            //  Container(
            //    margin: EdgeInsets.only(bottom: SizeConfig.h(80)),
            //    child: Headline(
            //      child: Text(
            //        'OWA is Mexico City\'s first wellness club of its kind—bringing together the essential pillars of human wellbeing in one place. By integrating contrast therapies, nutrition, supplementation, social connection, and hospitality, OWA creates an integrated ecosystem designed for vitality.',
            //        style: TextStyle(
            //          fontFamily: 'Arbeit',
            //          fontWeight: FontWeight.w300,
            //          fontSize: 14,
            //          height: 24 / 14,
            //          letterSpacing: 0,
            //          color: const Color(0xFF2C2C2C),
            //        ),
            //        textAlign: TextAlign.center,
            //      ),
            //    ),
            //  ),
            const ActionButtonsColumnMobile(),
          ],
        ),
      ),
    );
  }
}

class ActionButtonsColumnMobile extends StatelessWidget {
  const ActionButtonsColumnMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Book a Session button
        //ActionButtonMobile(text: 'BOOK A SESSION', onTap: () {}),
        //SizedBox(height: SizeConfig.h(16)), // Adjusted gap between buttons
        // Become a Member button
        //ActionButtonMobile(text: 'BECOME A MEMBER', onTap: () {}),

        //SizedBox(height: SizeConfig.h(16)), // Adjusted gap between buttons
        // Stay at OWA button (highlighted in yellow)
        //ActionButtonMobile(text: 'STAY AT OWA', onTap: () {}),
      ],
    );
  }
}

class ActionButtonMobile extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isHighlighted;

  const ActionButtonMobile({
    super.key,
    required this.text,
    required this.onTap,
    this.isHighlighted = false,
  });

  @override
  State<ActionButtonMobile> createState() => _ActionButtonMobileState();
}

class _ActionButtonMobileState extends State<ActionButtonMobile> {
  bool isPressed = false; // Use pressed instead of hover for mobile

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.isHighlighted
            ? const Color(0xFFE6FF00) // Yellow for "Stay at OWA"
            : isPressed
            ? const Color(0xFFE6FF00) // Yellow on press
            : Colors.transparent;

    final borderColor = const Color(0xFF2C2C2C);

    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: widget.onTap,
      child: Container(
        width: double.infinity, // Full width for mobile
        height: 43, // Much taller to match the proportions in your image
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 1),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: TextStyle(
            fontFamily: 'Arbeit',
            fontWeight: FontWeight.w400,
            // fontSize: SizeConfig.t(12),
            fontSize: 12,
            height: 1.5,
            letterSpacing: 0,
            color: const Color(0xFF2C2C2C),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
