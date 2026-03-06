import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/widgets/animated_menu_icon_stack.dart';
import 'package:owa_flutter/widgets/fade_in_widget.dart';
import 'package:owa_flutter/widgets/headline.dart';
import 'package:owa_flutter/widgets/therapy_info.dart';

class OWATherapiesSection extends StatefulWidget {
  const OWATherapiesSection({super.key});

  @override
  State<OWATherapiesSection> createState() => _OWATherapiesSectionState();
}

class _OWATherapiesSectionState extends State<OWATherapiesSection>
    with TickerProviderStateMixin {
  bool _isDiscoverScienceHovered = false;
  String? _expandedTherapy;
  final Map<String, bool> _therapyButtonHoverStates = {
    'SAUNA': false,
    'COLD PLUNGE': false,
    'HYPERBARIC CHAMBER': false,
    'ZERO GRAVITY CHAIR': false,
    'ACUPUNCTURE': false,
    'PRESSOTHERAPY': false,
    'MASSAGES': false,
    'BIOMAGNETISM': false,
  };

  final Map<String, TherapyInfo> _therapyData = {
    'SAUNA': TherapyInfo(
      description:
          'Step into deep heat to release, restore, and recharge. Our saunas support detoxification, relaxation, and the body\'s natural rhythm of renewal.',
      benefits: [
        'Promotes detoxification',
        'Relieves stress',
        'Improves cardiovascular health',
        'Enhances skin vitality',
        'Aids muscle recovery',
      ],
    ),
    'COLD PLUNGE': TherapyInfo(
      description:
          'Awaken your system with the invigorating power of cold immersion. A timeless practice that sharpens focus, reduces inflammation, and leaves you renewed.',
      benefits: [
        'Boosts circulation',
        'Reduces muscle soreness',
        'Strengthens immune system',
        'Increases mental clarity',
        'Elevates mood',
      ],
    ),
    'HYPERBARIC CHAMBER': TherapyInfo(
      description:
          'Breathe in pure oxygen at higher pressure to accelerate the body\'s healing process. Hyperbaric therapy supports cellular regeneration and overall vitality.',
      benefits: [
        'Accelerates recovery from fatigue or injury',
        'Boosts oxygen delivery to tissues',
        'Enhances brain function',
        'Supports immune health',
        'Promotes longevity',
      ],
    ),
    'ZERO GRAVITY CHAIR': TherapyInfo(
      description:
          'Experience weightless relaxation that releases tension from the body. The zero gravity chair relieves pressure, improves circulation, and induces deep calm.',
      benefits: [
        'Reduces spinal pressure',
        'Improves blood flow',
        'Eases joint and muscle tension',
        'Promotes relaxation',
        'Supports restorative sleep',
      ],
    ),
    'ACUPUNCTURE': TherapyInfo(
      description:
          'Experience weightless relaxation that releases tension from the body. The zero gravity chair relieves pressure, improves circulation, and induces deep calm.',
      benefits: [
        'Reduces spinal pressure',
        'Improves blood flow',
        'Eases joint and muscle tension',
        'Promotes relaxation',
        'Supports restorative sleep',
      ],
    ),
    'PRESSOTHERAPY': TherapyInfo(
      description:
          'Experience weightless relaxation that releases tension from the body. The zero gravity chair relieves pressure, improves circulation, and induces deep calm.',
      benefits: [
        'Reduces spinal pressure',
        'Improves blood flow',
        'Eases joint and muscle tension',
        'Promotes relaxation',
        'Supports restorative sleep',
      ],
    ),
    'MASSAGES': TherapyInfo(
      description:
          'Experience weightless relaxation that releases tension from the body. The zero gravity chair relieves pressure, improves circulation, and induces deep calm.',
      benefits: [
        'Reduces spinal pressure',
        'Improves blood flow',
        'Eases joint and muscle tension',
        'Promotes relaxation',
        'Supports restorative sleep',
      ],
    ),
    'BIOMAGNETISM': TherapyInfo(
      description:
          'Experience weightless relaxation that releases tension from the body. The zero gravity chair relieves pressure, improves circulation, and induces deep calm.',
      benefits: [
        'Reduces spinal pressure',
        'Improves blood flow',
        'Eases joint and muscle tension',
        'Promotes relaxation',
        'Supports restorative sleep',
      ],
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(1440),
      height: 1200, //1146, //SizeConfig.w(1146),
      color: colors.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(42)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.h(80)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // THERAPIES Title
                Expanded(
                  child: Headline(
                    child: Text(
                      'THERAPIES',
                      style: TextStyle(
                        fontFamily: 'Basier Square Mono',
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.t(19),
                        height: 1.51,
                        letterSpacing: 0.12 * SizeConfig.t(19),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                // Main description
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: SizeConfig.w(250)),
                    child: Headline(
                      child: Text(
                        'OWA\'s therapies are designed as modern rituals of recovery—powerful practices that balance body and mind. From contrast therapy to advanced technologies, each session is an invitation to reset, restore, and realign.',
                        style: TextStyle(
                          fontFamily: 'Arbeit',
                          fontWeight: FontWeight.w300,
                          fontSize: SizeConfig.t(15),
                          height: 24 / 15,
                          letterSpacing: 0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.h(80)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(right: SizeConfig.w(96)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTherapyDropdown('SAUNA'),
                        _buildDivider(),
                        _buildTherapyDropdown('COLD PLUNGE'),
                        _buildDivider(),
                        _buildTherapyDropdown('HYPERBARIC CHAMBER'),
                        _buildDivider(),
                        _buildTherapyDropdown('ZERO GRAVITY CHAIR'),
                        _buildDivider(),
                        _buildTherapyDropdown('ACUPUNCTURE'),
                        _buildDivider(),
                        // _buildTherapyDropdown('PRESSOTHERAPY'),
                        // _buildDivider(),
                        _buildTherapyDropdown('MASSAGES'),
                        _buildDivider(),
                        // _buildTherapyDropdown('BIOMAGNETISM'),
                        // _buildDivider(),
                      ],
                    ),
                  ),
                ),

                // Right Column - Image
                Expanded(
                  child: FadeInWidget(
                    child: SizedBox(
                      width: SizeConfig.w(672),
                      height: 522.02197265625, //SizeConfig.h(522.02197265625),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/therapies.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.h(137)),
            // Mission Statement
            SizedBox(
              width: SizeConfig.w(617),
              child: Headline(
                child: Text(
                  'We are on a mission to explore integrative wellbeing and continuously evolve our spaces as centers of restoration, connection, and growth',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Arbeit',
                    fontWeight: FontWeight.w300,
                    fontSize: SizeConfig.t(15),
                    height: 24 / 15,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.h(137 / 2)),

            // Discover the Science Button
            Center(
              child: MouseRegion(
                onEnter:
                    (_) => setState(() => _isDiscoverScienceHovered = true),
                onExit:
                    (_) => setState(() => _isDiscoverScienceHovered = false),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.w(24),
                    vertical: SizeConfig.h(12),
                  ),
                  decoration: BoxDecoration(
                    color:
                        _isDiscoverScienceHovered
                            ? colors.onHoverButtonColor
                            : Colors.transparent,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Text(
                    'DISCOVER THE SCIENCE',
                    style: TextStyle(
                      fontFamily: 'Arbeit',
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.t(10),
                      height: 1.5,
                      letterSpacing: 0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.h(100)),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(SizeConfig.h(8)),
          width: 2,
          height: 2,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Arbeit',
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.t(14),
              height: 1.5,
              letterSpacing: 0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTherapyDropdown(String therapy) {
    final isExpanded = _expandedTherapy == therapy;
    final therapyInfo = _therapyData[therapy]!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _expandedTherapy = isExpanded ? null : therapy;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.h(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  therapy,
                  style: TextStyle(
                    fontFamily: 'Basier Square Mono',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.t(15),
                    height: 0.9,
                    letterSpacing: 0.12 * SizeConfig.t(15),
                    color: Colors.black,
                  ),
                ),
                AnimatedMenuIconStack(isExpanded: isExpanded),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? null : 0,
          child: AnimatedOpacity(
            opacity: isExpanded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child:
                isExpanded
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.h(16)),
                        Text(
                          therapyInfo.description,
                          style: TextStyle(
                            fontFamily: 'Arbeit',
                            fontWeight: FontWeight.w300,
                            fontSize: SizeConfig.t(15),
                            height: 24 / 15,
                            letterSpacing: 0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: SizeConfig.h(36)),

                        ...therapyInfo.benefits.map(
                          (benefit) => _buildBenefitItem(benefit),
                        ),
                        SizedBox(height: SizeConfig.h(36)),

                        // Book a Session Button for this therapy
                        MouseRegion(
                          onEnter:
                              (_) => setState(
                                () => _therapyButtonHoverStates[therapy] = true,
                              ),
                          onExit:
                              (_) => setState(
                                () =>
                                    _therapyButtonHoverStates[therapy] = false,
                              ),
                          child: Container(
                            width: 148,
                            height: 26,
                            alignment: Alignment.center,
                            // duration: const Duration(milliseconds: 200),
                            // padding: EdgeInsets.symmetric(
                            //   horizontal: SizeConfig.w(16),
                            //   vertical: SizeConfig.h(16),
                            // ),
                            decoration: BoxDecoration(
                              color:
                                  _therapyButtonHoverStates[therapy]!
                                      ? colors.onHoverButtonColor
                                      : Colors.transparent,
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Text(
                              'BOOK A SESSION',
                              style: TextStyle(
                                fontFamily: 'Arbeit',
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.t(10),
                                height: 1.5,
                                letterSpacing: 0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.h(24)),
                      ],
                    )
                    : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.black.withValues(alpha: 0.2),
      margin: EdgeInsets.symmetric(vertical: SizeConfig.h(8)),
    );
  }
}
