import 'dart:developer';

import 'package:edconnex/Firebase/authentication.dart';
import 'package:edconnex/Firebase/toast.dart';
import 'package:edconnex/main/main_page/main_page.dart';
import 'package:edconnex/signin/sign_up2..dart';
import 'package:edconnex/main/main_page/widgets/widgetsforpages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:google_fonts/google_fonts.dart';

class signup_page extends StatefulWidget {
  const signup_page({super.key});

  @override
  State<signup_page> createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  bool isSigningUp = false;

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = userNameController.text;
    String email = userEmailController.text;
    String password = userPasswordController.text;
    log('I printed something to the console!');
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    log('I printed something to the console');
    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created");

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => mainpage()));
    } else {
      showToast(message: "Some error happend");
    }
  }

  final _formkey = GlobalKey<FormState>();
  bool _googleHold = false;
  bool _facebookHold = false;
  bool _isChecked = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.selected,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.grey;
    }

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
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Join us to start searching",
                  style: GoogleFonts.rubik(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: reusableGestureDetector(
                        path: 'assets/icons8-google-482.svg', name: 'Google'),
                  ),
                  SizedBox(width: 6), // Add space between the buttons
                  Expanded(
                    child: reusableGestureDetector(
                        path: 'assets/facebook.svg', name: 'Facebook'),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    reusableFormField(
                      controller: userNameController,
                      hint: 'Name',
                      isPassword: false,
                    ),
                    reusableFormField(
                      controller: userEmailController,
                      hint: 'Email',
                      isPassword: false,
                    ),
                    reusableFormField(
                      controller: userPasswordController,
                      hint: 'Password',
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: TextButton(
                  onPressed: () async {
                    _signUp();
                    if (_isChecked == true) {
                      setState(() {
                        _isLoading = true;
                      });
                      // await authentication.register(context,
                      //     _userEmailController, _userPasswordController);
                      // setState(() {
                      //   _isloading = false;
                      // });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Please accept the Terms and Conditions")));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : TextButton(
                            onPressed: () {
                              log('pressed button');
                              _signUp();
                              log('done!');
                            },
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //T&C
              Row(
                children: [
                  Checkbox(
                    shape: const CircleBorder(),
                    checkColor: Colors.black,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                        BorderSide(
                            width: 1.0,
                            color: _isChecked
                                ? Colors.black
                                : Colors.transparent)),
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    "I agree with Terms of Services & Privacy Policy",
                    style: GoogleFonts.rubik(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              //login
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => sign_uptwo()));
                    },
                    child: Center(
                      child: Text(
                        "Have an Account? Log In",
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
    );
  }
}
