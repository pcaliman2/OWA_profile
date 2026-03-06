// login_section_mobile.dart
// Versión móvil simplificada basada en login_section.dart
import 'package:flutter/material.dart';
import 'package:owa_flutter/useful/colors.dart' as colors;
import 'package:owa_flutter/widgets/footer_section.dart';
import 'package:owa_flutter/widgets/signup_section_mobile.dart';

class OWALoginSectionMobile extends StatelessWidget {
  const OWALoginSectionMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: colors.backgroundColor,
        elevation: 0,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Text(
              'Welcome Back',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Basier Square Mono',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please login to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Basier Square Mono',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),
            _LoginFormMobile(),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navegar a registro móvil real
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OWASignUpSectionMobile(),
                  ),
                );
              },
              child: const Text('Not a member yet? Sign Up'),
            ),
            const SizedBox(height: 32),
            const OWAFooter(),
          ],
        ),
      ),
    );
  }
}

class _LoginFormMobile extends StatefulWidget {
  @override
  State<_LoginFormMobile> createState() => _LoginFormMobileState();
}

class _LoginFormMobileState extends State<_LoginFormMobile> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (v) => email = v,
            validator:
                (value) =>
                    (value == null || value.isEmpty)
                        ? 'Please enter Email'
                        : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
            obscureText: true,
            onChanged: (v) => password = v,
            validator:
                (value) =>
                    (value == null || value.isEmpty)
                        ? 'Please enter Password'
                        : null,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login Successful!')),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
