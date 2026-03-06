import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/useful/size_config.dart';

// Botón interactivo para la imagen de la derecha
class _SignUpImageButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color textHoverColor;
  const _SignUpImageButton({
    this.text = 'Sign In',
    this.onTap,
    this.backgroundColor = Colors.transparent,
    this.borderColor = const Color(0xFF2C2C2C),
    this.textColor = const Color(0xFF2C2C2C),
    this.textHoverColor = Colors.white,
  });

  @override
  State<_SignUpImageButton> createState() => _SignUpImageButtonState();
}

class _SignUpImageButtonState extends State<_SignUpImageButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 220,
          height: 26,
          decoration: BoxDecoration(
            color: isHovered ? Color(0xFFE6FF00) : widget.backgroundColor,
            border: Border.all(color: widget.borderColor, width: 1),
            borderRadius: BorderRadius.circular(2),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Arbeit',
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: isHovered ? widget.textHoverColor : widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
// ...existing code...

class OWASignUpSection extends StatelessWidget {
  const OWASignUpSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.w(1440),
      color: colors.backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.w(42),
        vertical: SizeConfig.h(80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado y línea horizontal
          Text(
            'Sign Upxxx',
            style: TextStyle(
              fontFamily: 'Basier Square Mono',
              fontWeight: FontWeight.w600,
              fontSize: SizeConfig.t(19),
              color: const Color(0xFF2C2C2C),
            ),
          ),
          SizedBox(height: SizeConfig.h(12)),
          Container(
            width: double.infinity,
            height: SizeConfig.h(1),
            color: const Color(0xFF656565),
          ),
          SizedBox(height: SizeConfig.h(30)),
          Center(
            child: SizedBox(
              width: 1000,
              height: 700,
              child: Row(
                children: [
                  // Left Side: Sign Up Form
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Text(
                              'Creat Account',
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Color(0xFF2C2C2C),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(child: _SignUpForm()),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  // Right Side: Imagen con overlay, texto y botón
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors.backgroundColor,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/discover_4.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                color: Colors.black.withOpacity(0.35),
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'GET STARTED',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Basier Square Mono',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        'Already have an Account?',
                                        style: TextStyle(
                                          fontFamily: 'Basier Square Mono',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                      _SignUpImageButton(
                                        backgroundColor: Colors.transparent,
                                        borderColor: Colors.white,
                                        textColor: Colors.white,
                                        textHoverColor: Color(0xFF2C2C2C),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

  // ...existing code removed...
}

class _SignUpForm extends StatefulWidget {
  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String email = '';
  String firstName = '';
  String lastName = '';
  String password = '';
  DateTime? dateOfBirth;
  String gender = '';
  String nationality = '';
  String countryOfResidence = '';
  String telephone = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(
            'Email',
            onChanged: (v) => email = v,
            keyboardType: TextInputType.emailAddress,
          ),
          _buildTextField('First Name', onChanged: (v) => firstName = v),
          _buildTextField('Last Name', onChanged: (v) => lastName = v),
          _buildTextField(
            'Password',
            onChanged: (v) => password = v,
            obscureText: true,
          ),
          _buildDateField(context),
          _buildTextField('Gender', onChanged: (v) => gender = v),
          _buildTextField('Nationality', onChanged: (v) => nationality = v),
          _buildTextField(
            'Country of Residence',
            onChanged: (v) => countryOfResidence = v,
          ),
          _buildTextField(
            'Telephone',
            onChanged: (v) => telephone = v,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: _SignUpImageButton(
              text: 'Sign Inzzz',
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sign Up Successful!')),
                  );
                }
              },
              backgroundColor: Colors.transparent,
              borderColor: Color(0xFF2C2C2C),
              textColor: Color(0xFF2C2C2C),
              textHoverColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    required Function(String) onChanged,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    Icon? icon;
    switch (label) {
      case 'Email':
        icon = const Icon(Icons.email);
        break;
      case 'First Name':
        icon = const Icon(Icons.person);
        break;
      case 'Last Name':
        icon = const Icon(Icons.person_outline);
        break;
      case 'Password':
        icon = const Icon(Icons.lock);
        break;
      case 'Gender':
        icon = const Icon(Icons.transgender);
        break;
      case 'Nationality':
        icon = const Icon(Icons.flag);
        break;
      case 'Country of Residence':
        icon = const Icon(Icons.public);
        break;
      case 'Telephone':
        icon = const Icon(Icons.phone);
        break;
      default:
        icon = null;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: icon,
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator:
            (value) =>
                (value == null || value.isEmpty) ? 'Please enter $label' : null,
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            setState(() {
              dateOfBirth = picked;
            });
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(Icons.calendar_today),
          ),
          child: Text(
            dateOfBirth == null
                ? 'Select Date'
                : '${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}',
            style: TextStyle(
              fontFamily: 'Basier Square',
              fontWeight: FontWeight.w400,
              color: dateOfBirth == null ? Colors.grey : Color(0xFF2C2C2C),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
