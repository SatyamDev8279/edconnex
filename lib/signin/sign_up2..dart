import 'package:edconnex/Firebase/authentication.dart';
import 'package:edconnex/Firebase/toast.dart';
import 'package:edconnex/main/main_page/main_page.dart';
import 'package:edconnex/signin/sign_up.dart';
import 'package:edconnex/main/main_page/widgets/bottomsheet.dart';
import 'package:edconnex/main/main_page/widgets/widgetsforpages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sign_uptwo extends StatefulWidget {
  const sign_uptwo({super.key});

  @override
  State<sign_uptwo> createState() => _sign_uptwoState();
}

class _sign_uptwoState extends State<sign_uptwo> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _resetemailController = TextEditingController();

  bool _isLoading = false;

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _userEmailController.text;
    String password = _userPasswordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "User is successfully signed in");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => mainpage()));
    } else {
      showToast(message: "some error occured");
    }
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE0E0E0),
            Colors.white,
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              children: <Widget>[
                //upper padding

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),

                //For the text
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome Back",
                    style: GoogleFonts.rubik(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),

                // bottom padding

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),

                // Buttons

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // button for google
                    reusableGestureDetector(
                        path: 'assets/icons8-google-482.svg', name: 'Google'),
                    //Button for facebook
                    reusableGestureDetector(
                        path: 'assets/facebook.svg', name: 'Facebook'),
                  ],
                ),
                // in between space

                const SizedBox(
                  height: 40,
                ),

                // Text fields

                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      reusableFormField(
                        controller: _userEmailController,
                        hint: 'Email',
                        isPassword: false,
                      ),
                      reusableFormField(
                        controller: _userPasswordController,
                        hint: 'Password',
                        isPassword: true,
                      )
                    ],
                  ),
                ),

                // Sign in button

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: TextButton(
                    onPressed: () async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => mainpage()));
                      _signIn();
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              "Sign In",
                              style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                    ),
                  ),
                ),

                //in between space
                const SizedBox(
                  height: 20,
                ),

                //forget password
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        displayBottomSheet(context, _resetemailController);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.rubik(
                            color: Colors.black, fontSize: 14),
                      ),
                    ),
                    // in between space
                    const SizedBox(
                      height: 10,
                    ),
                    // Sign up
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => signup_page()));
                      },
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Don't have an account? Join us",
                          style: GoogleFonts.rubik(
                              color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
