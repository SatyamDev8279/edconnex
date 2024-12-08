import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

displayBottomSheet(
    BuildContext context, TextEditingController resetemailController) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            20, 0, 10, MediaQuery.of(context).viewInsets.bottom),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Container(
                width: 130,
                height: 5,
                decoration: ShapeDecoration(
                  color: const Color(0xFFC4C4C4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Forgot password',
              style: GoogleFonts.rubik(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: -0.30,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
             Text(
              'Enter you email for verification process,',
              style: GoogleFonts.rubik(
                color: Color(0xFF677294),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0.12,
                letterSpacing: -0.30,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: resetemailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  hintText: 'Enter Email',
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: ShapeDecoration(
                      color: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    ),
  );
}