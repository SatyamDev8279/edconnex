import 'package:edconnex/login_pages/login_page2.dart';
import 'package:edconnex/signin/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenOne extends StatefulWidget {
  const LoginScreenOne({super.key});

  @override
  State<LoginScreenOne> createState() => _LoginScreenOneState();
}

class _LoginScreenOneState extends State<LoginScreenOne> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Stack(
          children: [
            _buildBackgroundCircle(screenWidth, screenHeight),
            _buildProfileImage(screenWidth, screenHeight),
            _buildMainText(screenHeight, screenWidth),
            _buildSubText(screenHeight, screenWidth),
            _buildGetStartedButton(screenHeight, screenWidth),
            _buildSkipButton(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  // Background circle
  Widget _buildBackgroundCircle(double screenWidth, double screenHeight) {
    return Positioned(
      top: -screenHeight * 0.011,
      left: -screenWidth * 0.35,
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

  // Profile or main image
  Widget _buildProfileImage(double screenWidth, double screenHeight) {
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
              'assets/linkedin-network-550x550.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  // Main text 'Find Best Alumni'
  Widget _buildMainText(double screenHeight, double screenWidth) {
    return Positioned(
      top: screenHeight * 0.52,
      left: screenWidth * 0.21,
      child: SizedBox(
        width: screenWidth * 0.60,
        child: Text(
          'Find Best Alumni',
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

  // Subtext
  Widget _buildSubText(double screenHeight, double screenWidth) {
    return Positioned(
      top: screenHeight * 0.58,
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

  // Get Started Button
  Widget _buildGetStartedButton(double screenHeight, double screenWidth) {
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
                MaterialPageRoute(builder: (context) => LoginScreenTwo()),
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

  // Skip Button
  Widget _buildSkipButton(double screenHeight, double screenWidth) {
    return Positioned(
      bottom: screenHeight * 0.08,
      left: screenWidth * 0.44,
      child: SizedBox(
        width: screenWidth * 0.17,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => signup_page()),
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
