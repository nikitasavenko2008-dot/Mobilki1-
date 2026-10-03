import 'package:flutter/material.dart';
import '../widgets/meditation_painter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const Color bgColor = Color(0xFF1A9E8F);
  static const Color lightBtnColor = Color(0xFFA3D9D1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 4),

            const Text(
              'medinow',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w800,
                letterSpacing: -1.5,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Meditate With Us!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),

            const Spacer(flex: 4),

            _AppleButton(),

            const SizedBox(height: 16),

            _EmailPhoneButton(),

            const SizedBox(height: 20),

            _GoogleLink(),

            const Spacer(flex: 3),

            const _MeditationIllustration(),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

class _AppleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Sign in with Apple',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailPhoneButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: LoginScreen.lightBtnColor,
            foregroundColor: Colors.black,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Continue with Email or Phone',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _GoogleLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
      child: const Text(
        'Continue With Google',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

class _MeditationIllustration extends StatelessWidget {
  const _MeditationIllustration();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 280),
      painter: MeditationPainter(baseColor: LoginScreen.bgColor),
    );
  }
}
