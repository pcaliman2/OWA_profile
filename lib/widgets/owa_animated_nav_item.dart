import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart';

// Enum to differentiate navigation item types
enum NavItemType { squareMono, circleMono }

class OWAAnimatedNavItem extends StatefulWidget {
  final String text;
  final NavItemType type;
  final Color color;

  const OWAAnimatedNavItem({
    super.key,
    required this.text,
    required this.type,
    this.color = Colors.white,
  });

  @override
  State<OWAAnimatedNavItem> createState() => _OWAAnimatedNavItemState();
}

class _OWAAnimatedNavItemState extends State<OWAAnimatedNavItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter() {
    setState(() {
      _isHovered = true;
    });
    _controller.forward();
  }

  void _onExit() {
    setState(() {
      _isHovered = false;
    });
    _controller.reverse();
  }

  TextStyle _getTextStyle() {
    switch (widget.type) {
      case NavItemType.squareMono:
        // Basier Square Mono specifications
        return TextStyle(
          fontFamily: 'Basier Square Mono',
          color: widget.color,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          height: 1.5, // 150% line height
          letterSpacing: 1.0, // 10% of 10px = 1px
        );
      case NavItemType.circleMono:
        // Basier Circle Mono specifications
        return TextStyle(
          fontFamily: 'Basier Circle Mono',
          color: widget.color,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          height: 1.0, // 100% line height
          letterSpacing: 1.0, // 10% of 10px = 1px
        );
    }
  }

  TextStyle _getHoveredTextStyle() {
    final baseStyle = _getTextStyle();
    return baseStyle.copyWith(fontWeight: FontWeight.w500);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onEnter(),
      onExit: (_) => _onExit(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The navigation text
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: _isHovered ? _getHoveredTextStyle() : _getTextStyle(),
              child:
                  widget.text != 'THERAPIES'
                      ? Text(widget.text)
                      : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(widget.text),
                          SizedBox(width: 4.0),
                          Icon(Icons.north_east, color: widget.color, size: 12),
                        ],
                      ),
            ),

            const SizedBox(height: 6),

            // Animated underline
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.centerLeft,
                  transform:
                      Matrix4.identity()..scale(_scaleAnimation.value, 1.0),
                  child: Container(
                    width: _getTextWidth(),
                    height: 1.0,
                    decoration: BoxDecoration(color: onHoverButtonColor),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  double _getTextWidth() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: _isHovered ? _getHoveredTextStyle() : _getTextStyle(),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }
}
