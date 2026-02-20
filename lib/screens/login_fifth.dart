import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen5 extends StatelessWidget {
  const HomeScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // welcome text
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/main_logo.png'),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          // pagination dots
          Positioned(
            top: 850,
            left: 0,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF9C0306),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 25,
                  height: 10,
                ),
                const SizedBox(width: 3),

                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 186, 186, 186),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 15,
                  height: 10,
                ),
                const SizedBox(width: 3),

                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 186, 186, 186),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 15,
                  height: 10,
                ),
                const SizedBox(width: 3),

                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 186, 186, 186),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 15,
                  height: 10,
                ),
                const SizedBox(width: 3),
              ],
            ),
          ),

          // next button
          Positioned(
            top: 895,
            left: 260,
            right: 20,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/'),
              child: Text("Sign In"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9C0306),
                foregroundColor: const Color(0xFFFFFFFF),
                minimumSize: const Size(9, 60),
                textStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
