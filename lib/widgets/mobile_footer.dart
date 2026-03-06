import 'package:flutter/material.dart';
import 'package:owa_flutter/widgets/fade_in_widget.dart';
import 'package:owa_flutter/widgets/footer_section.dart';
import 'package:owa_flutter/widgets/headline.dart';

class OWAMobileFooter extends StatelessWidget {
  const OWAMobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1B0703), // Dark brown/black background
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CONTACT header
          Headline(
            child: Text(
              'CONTACT',
              style: TextStyle(
                fontFamily: 'Basier Square Mono',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.2,
                letterSpacing: 0.12 * 16,
                color: Color(0xFFCFC6BC),
              ),
            ),
          ),

          SizedBox(height: 32),

          // Two column layout for mobile
          FadeInWidget(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // GET IN TOUCH section
                      _buildMobileSection('GET IN TOUCH', [
                        'Sinaloa 49 Col. Roma Norte',
                        'México, CDMX. CP. 6700',
                        '',
                        'hello@owawellness.com',
                        '+52 555 505 7158',
                      ]),

                      SizedBox(height: 32),

                      // EXPLORE section
                      _buildMobileSection('EXPLORE', [
                        'The OWA Experience',
                        'The Science',
                        'Our Timers & FAQ\'s',
                        'Policies',
                      ]),

                      SizedBox(height: 32),

                      // CONNECT section
                      _buildMobileSection('CONNECT', [
                        'Instagram',
                        'Spotify',
                        'Careers',
                      ]),
                    ],
                  ),
                ),

                SizedBox(width: 20),

                // Right Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // BOOK section
                      _buildMobileSection('BOOK', [
                        'Book a Session',
                        'Become a Member',
                        'Stay at OWA',
                        'Host Your Event',
                      ]),

                      SizedBox(height: 32),

                      // STAY IN THE LOOP section
                      Text(
                        'STAY IN THE LOOP',
                        style: TextStyle(
                          fontFamily: 'Basier Square Mono',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          height: 1.2,
                          letterSpacing: 0.04 * 12,
                          color: sectionFontColor,
                        ),
                      ),

                      SizedBox(height: 12),

                      Text(
                        'Be the first to know about our new\nexperiences and collaborations',
                        style: TextStyle(
                          fontFamily: 'Basier Square Mono',
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          height: 1.4,
                          letterSpacing: 0,
                          color: Color(0xFFCFC6BC),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Email input
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white, width: 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                  fontFamily: 'Basier Square Mono',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Basier Square Mono',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                    color: Color(0xFFCFC6BC),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.north_east,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 48),

          // Divider line
          Container(
            height: 1,
            color: Colors.white.withOpacity(0.3),
            margin: EdgeInsets.only(bottom: 24),
          ),

          // Bottom section - Mobile Layout
          Text(
            'Creative Strategy @ Latente',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 9,
              height: 1.2,
              letterSpacing: 0,
              color: sectionFontColor,
            ),
          ),

          SizedBox(height: 12),

          // Bottom links
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _buildBottomLink('Terms of Service'),
              _buildBottomLink('Privacy Policy'),
              _buildBottomLink('Cookies'),
              _buildBottomLink('Disclaimers'),
            ],
          ),

          SizedBox(height: 12),

          Text(
            '© All rights reserved 2025',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 9,
              height: 1.2,
              letterSpacing: 0,
              color: sectionFontColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Basier Square Mono',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 1.2,
            letterSpacing: 0.04 * 12,
            color: sectionFontColor,
          ),
        ),
        SizedBox(height: 12),
        ...items
            .map(
              (item) =>
                  item.isEmpty
                      ? SizedBox(height: 8)
                      : _buildMobileFooterLink(item),
            )
            .toList(),
      ],
    );
  }

  Widget _buildMobileFooterLink(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: InkWell(
        onTap: () {},
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Basier Square Mono',
            fontWeight: FontWeight.w500,
            fontSize: 11,
            height: 1.4,
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
          fontSize: 9,
          height: 1.2,
          letterSpacing: 0,
          color: sectionFontColor,
        ),
      ),
    );
  }
}
