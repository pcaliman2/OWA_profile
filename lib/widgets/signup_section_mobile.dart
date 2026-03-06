import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;

class OWASignUpSectionMobile extends StatelessWidget {
  const OWASignUpSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: const _SignUpCardMobile(),
    );
  }
}

class _SignUpCardMobile extends StatelessWidget {
  const _SignUpCardMobile();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: colors.backgroundColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const _SignUpFormMobile(),
        ),
      ),
    );
  }
}

class _SignUpFormMobile extends StatefulWidget {
  const _SignUpFormMobile();

  @override
  State<_SignUpFormMobile> createState() => _SignUpFormMobileState();
}

class _SignUpFormMobileState extends State<_SignUpFormMobile> {
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

  InputDecoration _dec() => const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(vertical: 8),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFBDBDBD)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF2C2C2C), width: 1.5),
    ),
  );

  String _formatDate(DateTime d) =>
      "${d.year.toString().padLeft(4, '0')}-"
      "${d.month.toString().padLeft(2, '0')}-"
      "${d.day.toString().padLeft(2, '0')}";

  void _selectCountry(TextEditingController controller) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        controller.text = country.name;
      },
    );
  }

  Widget _field(
    String label,
    TextEditingController ctrl, {
    bool obscure = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: ctrl,
            obscureText: obscure,
            readOnly: onTap != null,
            onTap: onTap,
            decoration: _dec(),
            validator: (v) => (v == null || v.isEmpty) ? "Required" : null,
          ),
        ],
      ),
    );
  }

  Widget _genderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "GENDER",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            value: _gender,
            decoration: _dec(),
            items: const [
              DropdownMenuItem(value: "Male", child: Text("Male")),
              DropdownMenuItem(value: "Female", child: Text("Female")),
              DropdownMenuItem(
                value: "Non-Disclosed",
                child: Text("Non-Disclosed"),
              ),
            ],
            onChanged: (value) => setState(() => _gender = value ?? "Male"),
            validator: (v) => (v == null || v.isEmpty) ? "Required" : null,
          ),
        ],
      ),
    );
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create your account",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text("Fill in your details to access your dashboard."),
          const SizedBox(height: 12),

          _field("First name", _firstName),
          _field("Last name", _lastName),

          _field("Email", _email),
          _field("Password", _password, obscure: true),

          _genderDropdown(),

          _field(
            "Birthday",
            _birthday,
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                _birthday.text = _formatDate(picked);
              }
            },
          ),

          _field("Phone number", _phone),

          _field(
            "Country of origin",
            _countryOrigin,
            onTap: () => _selectCountry(_countryOrigin),
          ),

          _field(
            "Country of residence",
            _countryResidence,
            onTap: () => _selectCountry(_countryResidence),
          ),

          const SizedBox(height: 10),
          const Text("ADDRESS", style: TextStyle(fontWeight: FontWeight.w800)),

          _field("Line 1", _line1),
          _field("Line 2", _line2),

          _field("City", _city),
          _field("State", _state),
          _field("Postal code", _postal),

          const SizedBox(height: 16),

          Center(
            child: _LoginImageButton(
              text: "Sign Inzzz",
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Form Valid")));
                }
              },
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
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color textHoverColor;

  const _LoginImageButton({
    this.text = 'Sign In',
    this.onTap,
    this.backgroundColor = Colors.transparent,
    this.borderColor = const Color(0xFF2C2C2C),
    this.textColor = const Color(0xFF2C2C2C),
    this.textHoverColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  State<_LoginImageButton> createState() => _LoginImageButtonState();
}

class _LoginImageButtonState extends State<_LoginImageButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // En mobile normalmente no hay hover, pero mantenerlo no rompe nada en web.
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 220,
          height: 36,
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xFFE6FF00) : widget.backgroundColor,
            border: Border.all(color: widget.borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Arbeit',
              fontSize: 12,
              color: isHovered ? widget.textHoverColor : widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
