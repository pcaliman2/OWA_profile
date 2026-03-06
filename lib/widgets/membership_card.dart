import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/useful/size_config.dart';

class MembershipCard extends StatefulWidget {
  final String number;
  final String title;
  final String imagePath;
  final String description;
  final Color buttonColor;
  final Color buttonTextColor;

  const MembershipCard({
    super.key,
    required this.number,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  @override
  State<MembershipCard> createState() => _MembershipCardState();
}

class _MembershipCardState extends State<MembershipCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var w = SizeConfig.w(444);
    return SizedBox(
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Number
          Text(
            widget.number,
            style: TextStyle(
              fontFamily: 'Basier Square Mono',
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.t(9),
              height: 0.9,
              letterSpacing: 0.12,
            ),
          ),
          SizedBox(height: SizeConfig.h(16)),

          // Image Container with overlay
          Container(
            width: SizeConfig.w(444),
            height: 362, //SizeConfig.h(362),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            child: Stack(
              children: [
                // Background Image
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Dark overlay
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withValues(alpha: 0.4),
                ),

                /// Title
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'Basier Circle Mono',
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.t(15),
                      height: 40 / 15,
                      letterSpacing: 0.10,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                /// Button
                Positioned(
                  bottom: SizeConfig.h(24),
                  left: SizeConfig.w(24),
                  right: SizeConfig.w(24),
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isHovered = true),
                    onExit: (_) => setState(() => isHovered = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: SizeConfig.w(408),
                      height: 26, //SizeConfig.h(26),
                      decoration: BoxDecoration(
                        color:
                            isHovered
                                ? colors
                                    .onHoverButtonColor // Yellow on hover
                                : widget.buttonColor,
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        child: Text(
                          'GET STARTED',
                          style: TextStyle(
                            fontFamily: 'Arbeit',
                            fontWeight: FontWeight.w300,
                            fontSize: SizeConfig.t(10),
                            height: 1.5,
                            letterSpacing: 0,
                            color:
                                isHovered
                                    ? Colors.black
                                    : widget.buttonTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.h(24)),

          // Description
          SizedBox(
            width: w * 0.70,
            child: Text(
              widget.description,
              style: TextStyle(
                fontFamily: 'Arbeit',
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.t(14),
                height: 1.5,
                letterSpacing: 0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
