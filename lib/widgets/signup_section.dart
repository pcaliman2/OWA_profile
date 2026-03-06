import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_picker/country_picker.dart';
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/widgets/header2.dart';
import 'package:owa_flutter/widgets/footer_section.dart';
import 'package:owa_flutter/widgets/login_section.dart';

class OWASignUpSection extends StatelessWidget {
  const OWASignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const OWAHeader(),
            Container(
              width: SizeConfig.w(1440),
              color: colors.backgroundColor,
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.w(42),
                vertical: SizeConfig.h(40),
              ),
              child: const _UserProfileContent(),
            ),
            OWAFooter(key: UniqueKey()),
          ],
        ),
      ),
    );
  }
}

class _UserProfileContent extends StatelessWidget {
  const _UserProfileContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: SizedBox(
          height: 760,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Expanded(flex: 8, child: _LeftImagePanel()),
              SizedBox(width: 24),
              Expanded(flex: 9, child: _RightProfilePanel()),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeftImagePanel extends StatelessWidget {
  const _LeftImagePanel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/discover_1.jpg', fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Container(color: Colors.black.withOpacity(0.35)),
        ),
      ],
    );
  }
}

class _RightProfilePanel extends StatelessWidget {
  const _RightProfilePanel();

  @override
  Widget build(BuildContext context) {
    return const _UserProfileForm();
  }
}

class _UserProfileForm extends StatefulWidget {
  const _UserProfileForm();

  @override
  State<_UserProfileForm> createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<_UserProfileForm> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _birthday = TextEditingController();
  final _phone = TextEditingController();
  final _countryOrigin = TextEditingController();
  final _countryResidence = TextEditingController();
  final _line1 = TextEditingController();
  final _line2 = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _postal = TextEditingController();

  String _gender = "Male";

  static const Color _cardColor = Color(0xFFE9E3D9);
  static const Color _borderColor = Color(0xFF111111);
  static const Color _lineColor = Color(0xFFBDB6AA);

  InputDecoration _dec() => const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 8),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: _lineColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF2C2C2C), width: 1.5),
    ),
    border: UnderlineInputBorder(borderSide: BorderSide(color: _lineColor)),
  );

  Widget _field(
    String label,
    TextEditingController ctrl, {
    bool obscure = false,
    int lines = 1,
    VoidCallback? onTap,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
              color: Color(0xFF2C2C2C),
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: ctrl,
            obscureText: obscure,
            maxLines: lines,
            readOnly: onTap != null,
            onTap: onTap,
            inputFormatters: inputFormatters,
            decoration: _dec(),
            validator:
                (v) => (v == null || v.trim().isEmpty) ? "Required" : null,
          ),
        ],
      ),
    );
  }

  Widget _cardContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _borderColor, width: 2.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  String _formatDate(DateTime d) =>
      "${d.year.toString().padLeft(4, '0')}-"
      "${d.month.toString().padLeft(2, '0')}-"
      "${d.day.toString().padLeft(2, '0')}";

  void _selectCountry(TextEditingController controller) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      countryListTheme: CountryListThemeData(
        backgroundColor: colors.backgroundColor,
        bottomSheetHeight: MediaQuery.of(context).size.height * 0.78,
        borderRadius: BorderRadius.zero,
        inputDecoration: const InputDecoration(
          hintText: 'Search country',
          prefixIcon: Icon(Icons.search),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFBDBDBD)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2C2C2C), width: 1.5),
          ),
        ),
      ),
      onSelect: (Country country) {
        controller.text = country.name;
      },
    );
  }

  Future<void> _selectBirthday() async {
    final initial = DateTime.tryParse(_birthday.text);

    final picked = await showOwaCalendarPicker(
      context,
      initial: initial ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      _birthday.text = _formatDate(picked);
      setState(() {});
    }
  }

  void _saveProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Profile saved")));
    }
  }

  void _cancel() {
    Navigator.of(context).maybePop();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _birthday.dispose();
    _phone.dispose();
    _countryOrigin.dispose();
    _countryResidence.dispose();
    _line1.dispose();
    _line2.dispose();
    _city.dispose();
    _state.dispose();
    _postal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: colors.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      "USER PROFILE",
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                        color: Colors.black,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                _LoginImageButton(
                  text: "SAVE",
                  width: 148,
                  height: 44,
                  onTap: _saveProfile,
                ),
                const SizedBox(width: 14),
                _LoginImageButton(
                  text: "CANCEL",
                  width: 148,
                  height: 44,
                  onTap: _cancel,
                ),
              ],
            ),
            const SizedBox(height: 18),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _cardContainer(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: _field("First name", _firstName)),
                              const SizedBox(width: 16),
                              Expanded(child: _field("Last name", _lastName)),
                            ],
                          ),
                          _field("Email", _email),
                          _field("Password", _password, obscure: true),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "GENDER",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.2,
                                          color: Color(0xFF2C2C2C),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      DropdownButtonFormField<String>(
                                        value: _gender,
                                        dropdownColor: colors.backgroundColor,
                                        borderRadius: BorderRadius.zero,
                                        decoration: _dec(),
                                        items: const [
                                          DropdownMenuItem(
                                            value: "Male",
                                            child: Text("Male"),
                                          ),
                                          DropdownMenuItem(
                                            value: "Female",
                                            child: Text("Female"),
                                          ),
                                          DropdownMenuItem(
                                            value: "Non-Disclosed",
                                            child: Text("Non-Disclosed"),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          if (value == null) return;
                                          setState(() => _gender = value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _field(
                                  "Birthday",
                                  _birthday,
                                  onTap: _selectBirthday,
                                ),
                              ),
                            ],
                          ),
                          _field(
                            "Phone number",
                            _phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9+\-\s()]'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    _cardContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _field(
                                  "Country of origin",
                                  _countryOrigin,
                                  onTap: () => _selectCountry(_countryOrigin),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _field(
                                  "Country of residence",
                                  _countryResidence,
                                  onTap:
                                      () => _selectCountry(_countryResidence),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "ADDRESS",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                          _field("Line 1", _line1),
                          _field("Line 2", _line2),
                          Row(
                            children: [
                              Expanded(child: _field("City", _city)),
                              const SizedBox(width: 16),
                              Expanded(child: _field("State", _state)),
                            ],
                          ),
                          _field("Postal code", _postal),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginImageButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color textHoverColor;
  final Color hoverBackgroundColor;
  final double width;
  final double height;

  const _LoginImageButton({
    this.text = 'SAVE',
    this.onTap,
    this.backgroundColor = Colors.transparent,
    this.borderColor = const Color(0xFF8B867D),
    this.textColor = const Color(0xFF2C2C2C),
    this.textHoverColor = const Color(0xFF2C2C2C),
    this.hoverBackgroundColor = const Color(0x14000000),
    this.width = 220,
    this.height = 51,
    super.key,
  });

  @override
  State<_LoginImageButton> createState() => _LoginImageButtonState();
}

class _LoginImageButtonState extends State<_LoginImageButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                isHovered
                    ? widget.hoverBackgroundColor
                    : widget.backgroundColor,
            border: Border.all(color: widget.borderColor, width: 1),
            borderRadius: BorderRadius.zero,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Basier Square Mono',
              fontSize: 14,
              letterSpacing: 1.2,
              color: isHovered ? widget.textHoverColor : widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _RightPanelButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color textHoverColor;
  final Color hoverBackgroundColor;

  const _RightPanelButton({
    this.text = 'LOG IN',
    this.onTap,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
    this.textHoverColor = Colors.white,
    this.hoverBackgroundColor = const Color(0x14FFFFFF),
    super.key,
  });

  @override
  State<_RightPanelButton> createState() => _RightPanelButtonState();
}

class _RightPanelButtonState extends State<_RightPanelButton> {
  bool isHovered = false;

  void _goToLogin(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OWALoginSection()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap ?? () => _goToLogin(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
          width: 220,
          height: 51,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:
                isHovered
                    ? widget.hoverBackgroundColor
                    : widget.backgroundColor,
            border: Border.all(color: widget.borderColor, width: 1),
            borderRadius: BorderRadius.zero,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Basier Square Mono',
              fontSize: 14,
              letterSpacing: 1.2,
              color: isHovered ? widget.textHoverColor : widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}

Future<DateTime?> showOwaCalendarPicker(
  BuildContext context, {
  DateTime? initial,
  required DateTime firstDate,
  required DateTime lastDate,
}) async {
  final now = DateTime.now();
  final init = initial ?? DateTime(now.year, now.month, now.day);

  return showGeneralDialog<DateTime>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (ctx, anim1, anim2) => const SizedBox(),
    transitionBuilder: (ctx, anim1, anim2, child) {
      final curve = CurvedAnimation(parent: anim1, curve: Curves.easeOutQuart);
      return ScaleTransition(
        scale: Tween<double>(begin: 0.95, end: 1.0).animate(curve),
        child: FadeTransition(
          opacity: curve,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: _PremiumCalendarDialog(
                initial: init,
                firstDate: firstDate,
                lastDate: lastDate,
              ),
            ),
          ),
        ),
      );
    },
  );
}

class _PremiumCalendarDialog extends StatefulWidget {
  const _PremiumCalendarDialog({
    required this.initial,
    required this.firstDate,
    required this.lastDate,
  });

  final DateTime initial;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  State<_PremiumCalendarDialog> createState() => _PremiumCalendarDialogState();
}

class _PremiumCalendarDialogState extends State<_PremiumCalendarDialog> {
  late DateTime _selected;

  static const String fontMono = 'Basier Square Mono';
  static const String fontBody = 'Arbeit';

  @override
  void initState() {
    super.initState();
    _selected = widget.initial;
  }

  void _onDateChanged(DateTime date) {
    HapticFeedback.selectionClick();
    setState(() => _selected = date);
  }

  void _close() => Navigator.of(context).pop();
  void _apply() => Navigator.of(context).pop(_selected);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
      colorScheme: const ColorScheme.light(
        primary: Colors.black,
        onPrimary: Colors.white,
        onSurface: Colors.black,
        surface: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontFamily: fontMono,
            fontSize: 13,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );

    return Container(
      width: 380,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 50,
            spreadRadius: -10,
            offset: const Offset(0, 30),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCustomHeader(),
          Theme(
            data: theme.copyWith(
              datePickerTheme: DatePickerThemeData(
                backgroundColor: Colors.white,
                headerBackgroundColor: Colors.white,
                headerForegroundColor: Colors.black,
                surfaceTintColor: Colors.transparent,
                dividerColor: Colors.transparent,
                dayStyle: const TextStyle(
                  fontFamily: fontBody,
                  fontSize: 13,
                  color: Colors.black,
                ),
                weekdayStyle: const TextStyle(
                  fontFamily: fontMono,
                  fontSize: 10,
                  letterSpacing: 2.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                ),
                yearStyle: const TextStyle(
                  fontFamily: fontBody,
                  fontSize: 14,
                  color: Colors.black,
                ),
                headerHeadlineStyle: const TextStyle(fontSize: 14),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                dayShape: const WidgetStatePropertyAll(CircleBorder()),
                dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return const Color(0xFF4A4A4A);
                  }
                  return null;
                }),
                dayForegroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Colors.white;
                  }
                  return Colors.black;
                }),
              ),
            ),
            child: SizedBox(
              height: 320,
              child: CalendarDatePicker(
                initialDate: _selected,
                firstDate: widget.firstDate,
                lastDate: widget.lastDate,
                onDateChanged: _onDateChanged,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 10, 28, 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _close,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black38,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: const Text('CLOSE'),
                ),
                ElevatedButton(
                  onPressed: _apply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 20,
                    ),
                    textStyle: const TextStyle(
                      fontFamily: fontMono,
                      fontSize: 11,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('CONFIRM'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomHeader() {
    final months = [
      'JANUARY',
      'FEBRUARY',
      'MARCH',
      'APRIL',
      'MAY',
      'JUNE',
      'JULY',
      'AUGUST',
      'SEPTEMBER',
      'OCTOBER',
      'NOVEMBER',
      'DECEMBER',
    ];

    final month = months[_selected.month - 1];
    final day = _selected.day.toString().padLeft(2, '0');
    final year = _selected.year;

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 40, 32, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 4, height: 4, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                'SELECTED DATE',
                style: TextStyle(
                  fontFamily: fontMono,
                  fontSize: 9,
                  letterSpacing: 3.0,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: const TextStyle(
                  fontFamily: 'Arbeit',
                  fontSize: 72,
                  height: 0.8,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                  letterSpacing: -2.0,
                ),
              ),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      month,
                      style: const TextStyle(
                        fontFamily: fontMono,
                        fontSize: 14,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$year',
                      style: TextStyle(
                        fontFamily: fontMono,
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
