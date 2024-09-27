import 'package:edconnex/signin/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edconnex/login_pages/login_page3.dart';
class LoginScreenTwo extends StatefulWidget {
  const LoginScreenTwo({super.key});

  @override
  State<LoginScreenTwo> createState() => _LoginScreenTwoState();
}

class _LoginScreenTwoState extends State<LoginScreenTwo> {
  // Storing MediaQuery values to avoid redundant calls
  late final double screenWidth;
  late final double screenHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackgroundCircle(),
          _buildProfileImage(),
          _buildMainText(),
          _buildSubText(),
          _buildGetStartedButton(),
          _buildSkipButton(),
        ],
      ),
    );
  }

  // Background circle widget
  Widget _buildBackgroundCircle() {
    return Positioned(
      top: -screenHeight * 0.011,
      right: -screenWidth * 0.35,
      child: Container(
        height: screenHeight * 0.38,
        width: screenWidth * 0.8,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1F3F77), Color(0xFF07D9AD)],
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // Profile image widget
  Widget _buildProfileImage() {
    return Positioned(
      top: screenHeight * 0.14,
      right: screenWidth * 0.076,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: screenHeight * 0.38,
          width: screenHeight * 0.38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 0.2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(170),
            child: Image.asset(
              'assets/images/pag2image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  // Main text widget
  Widget _buildMainText() {
    return Positioned(
      top: screenHeight * 0.54,
      left: screenWidth * 0.17,
      child: SizedBox(
        width: screenWidth * 0.68,
        child: Text(
          'Ask your Doubts in Wide Community',
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // Subtext widget
  Widget _buildSubText() {
    return Positioned(
      top: screenHeight * 0.62,
      left: screenWidth * 0.11,
      child: SizedBox(
        width: screenWidth * 0.8,
        child: Text(
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of it over 2000 years old.',
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }

  // Get Started button widget
  Widget _buildGetStartedButton() {
    return Positioned(
      bottom: screenHeight * 0.15,
      left: screenWidth * 0.15,
      child: Center(
        child: SizedBox(
          width: screenWidth * 0.7,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreenThree()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 40),
              textStyle: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            child: const Text('Get Started'),
          ),
        ),
      ),
    );
  }

  // Skip button widget
  Widget _buildSkipButton() {
    return Positioned(
      bottom: screenHeight * 0.08,
      left: screenWidth * 0.44,
      child: SizedBox(
        width: screenWidth * 0.17,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const signup_page()),
            );
          },
          style: TextButton.styleFrom(
            textStyle: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF283C76),
              ),
            ),
          ),
          child: const Text('Skip'),
        ),
      ),
    );
  }
}

