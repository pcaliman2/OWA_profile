import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/widgets/headline.dart';

const footerBackgroundColor = Color.fromRGBO(24, 8, 4, 1.0);
const sectionFontColor = Color.fromRGBO(82, 66, 56, 1.0);

class OWAFooter extends StatelessWidget {
  const OWAFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(1440),
      height: 539,
      color: footerBackgroundColor, // Dark brown/black background
      padding: EdgeInsets.only(
        left: SizeConfig.w(42),
        right: SizeConfig.w(42),
        // bottom: 42, //SizeConfig.h(42),
        // top: 42 * 3, //SizeConfig.h(42 * 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.h(42 * 3)),
          // CONTACT header
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.h(60)),
            child: Headline(
              child: Text(
                'CONTACT',
                style: TextStyle(
                  fontFamily: 'Basier Square Mono',
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.t(20),
                  height: 0.9,
                  letterSpacing: SizeConfig.t(20) * 0.12,
                  color: Color(0xFFCFC6BC),
                ),
              ),
            ),
          ),

          // Main footer content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GET IN TOUCH section
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GET IN TOUCH',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.t(14),
                        height: 1.45,
                        letterSpacing: SizeConfig.t(14) * 0.04,
                        color: sectionFontColor,
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(20)),
                    Text(
                      'Sinaloa 49 Col. Roma Norte\nMéxico, CDMX. CP. 6700',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.t(12),
                        height: 1.73,
                        letterSpacing: 0,
                        color: Color(0xFFCFC6BC),
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(30)),
                    Text(
                      'hello@owawellness.com',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.t(12),
                        height: 1.73,
                        letterSpacing: 0,
                        color: Color(0xFFCFC6BC),
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(15)),
                    Text(
                      '+52 555 505 7158',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.t(12),
                        height: 1.73,
                        letterSpacing: 0,
                        color: Color(0xFFCFC6BC),
                      ),
                    ),
                  ],
                ),
              ),

              // EXPLORE section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EXPLORE',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.t(14),
                        height: 1.45,
                        letterSpacing: SizeConfig.t(14) * 0.04,
                        color: sectionFontColor,
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(20)),
                    _buildFooterLink('The OWA Experience'),
                    _buildFooterLink('The Science'),
                    _buildFooterLink('Our Timers & FAQ\'s'),
                    _buildFooterLink('Policies'),
                  ],
                ),
              ),

              // CONNECT section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CONNECT',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.t(14),
                        height: 1.45,
                        letterSpacing: SizeConfig.t(14) * 0.04,
                        color: sectionFontColor,
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(20)),
                    _buildFooterLink('Instagram'),
                    _buildFooterLink('Spotify'),
                    _buildFooterLink('Careers'),
                  ],
                ),
              ),

              // BOOK section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BOOK',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.t(14),
                        height: 1.45,
                        letterSpacing: SizeConfig.t(14) * 0.04,
                        color: sectionFontColor,
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(20)),
                    _buildFooterLink('Book a Session'),
                    _buildFooterLink('Become a Member'),
                    _buildFooterLink('Stay at OWA'),
                    _buildFooterLink('Host Your Event'),
                  ],
                ),
              ),

              // STAY IN THE LOOP section
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'STAY IN THE LOOP',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.t(14),
                        height: 1.45,
                        letterSpacing: SizeConfig.t(14) * 0.04,
                        color: sectionFontColor,
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(20)),
                    Text(
                      'Be the first to know about our new\nexperiences and collaborations',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.t(12),
                        height: 1.73,
                        letterSpacing: 0,
                        color: Color(0xFFCFC6BC),
                      ),
                    ),
                    SizedBox(height: SizeConfig.h(30)),
                    // Email input
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(
                                fontFamily: 'Basier Square Mono',
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConfig.t(12),
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                  fontFamily: 'Basier Square Mono',
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeConfig.t(12),
                                  color: Color(0xFFCFC6BC),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.h(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0 * 5),
                        Icon(
                          Icons.north_east,
                          color: Colors.white,
                          size: SizeConfig.w(16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: SizeConfig.h(80)),

          // Divider line
          Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.3),
            margin: EdgeInsets.only(bottom: SizeConfig.h(30)),
          ),

          // Bottom section
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Creative Strategy @ Latente',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.t(10),
                  height: 1.4,
                  letterSpacing: 0,
                  color: sectionFontColor,
                ),
              ),
              Row(
                children: [
                  _buildBottomLink('Terms of Service'),
                  SizedBox(width: SizeConfig.w(30)),
                  _buildBottomLink('Privacy Policy'),
                  SizedBox(width: SizeConfig.w(30)),
                  _buildBottomLink('Cookies'),
                  SizedBox(width: SizeConfig.w(30)),
                  _buildBottomLink('Disclaimers'),
                ],
              ),
              Text(
                '© All rights reserved 2025',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.t(10),
                  height: 1.4,
                  letterSpacing: 0,
                  color: sectionFontColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.h(8)),
      child: InkWell(
        onTap: () {},
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Basier Square Mono',
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.t(12),
            height: 1.73,
            letterSpacing: 0,
            color: Color(0xFFCFC6BC),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: SizeConfig.t(10),
          height: 1.4,
          letterSpacing: 0,
          color: sectionFontColor,
        ),
      ),
    );
  }
}
