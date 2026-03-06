import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart';
import 'package:owa_flutter/useful/size_config.dart';

class ActionButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isHighlighted;

  const ActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isHighlighted = false,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.isHighlighted
            ? onHoverButtonColor
            : isHovered
            ? onHoverButtonColor
            : Colors.transparent;

    final borderColor = const Color(0xFF2C2C2C);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 257,
          height: 43,
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.w(2)),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor, width: 1),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Arbeit',
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.t(12),
              height: 1.5,
              letterSpacing: 0,
              color: const Color(0xFF2C2C2C),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
