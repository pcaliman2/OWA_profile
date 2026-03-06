import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_picker/country_picker.dart';
import 'package:owa_flutter/useful/size_config.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/widgets/header2.dart';
import 'package:owa_flutter/widgets/footer_section.dart';

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
    return Image.asset(
      'assets/discover_1.jpg',
      fit: BoxFit.cover,
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
      );

  Widget _field(
    String label,
    TextEditingController ctrl, {
    bool obscure = false,
    int lines = 1,
    VoidCallback? onTap,
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
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: ctrl,
            obscureText: obscure,
            maxLines: lines,
            readOnly: onTap != null,
            onTap: onTap,
            decoration: _dec(),
            validator: (v) => (v == null || v.isEmpty) ? "Required" : null,
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

        // SIN BORDES
        // border: Border.all(...)

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  String _formatDate(DateTime d) =>
      "${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}";

  void _selectCountry(TextEditingController controller) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        controller.text = country.name;
      },
    );
  }

  Future<void> _selectBirthday() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
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
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Profile saved")));
    }
  }

  void _cancel() {
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "USER PROFILE",
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
              ),
              _LoginImageButton(
                text: "SAVE",
                width: 148,
                height: 44,
                onTap: _saveProfile,
              ),
              const SizedBox(width: 12),
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
                              child: DropdownButtonFormField<String>(
                                value: _gender,
                                decoration: _dec(),
                                items: const [
                                  DropdownMenuItem(
                                      value: "Male", child: Text("Male")),
                                  DropdownMenuItem(
                                      value: "Female", child: Text("Female")),
                                ],
                                onChanged: (v) {
                                  if (v != null) setState(() => _gender = v);
                                },
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
                        _field("Phone number", _phone),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
                                onTap: () =>
                                    _selectCountry(_countryResidence),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "ADDRESS",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}

class _LoginImageButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const _LoginImageButton({
    required this.text,
    this.onTap,
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
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isHovered ? const Color(0x14000000) : Colors.transparent,
            border: Border.all(color: const Color(0xFF8B867D)),
          ),
          child: Text(
            widget.text,
            style: const TextStyle(
              fontFamily: 'Basier Square Mono',
              fontSize: 14,
              letterSpacing: 1.2,
              color: Color(0xFF2C2C2C),
            ),
          ),
        ),
      ),
    );
  }
}