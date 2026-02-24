import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen4 extends StatelessWidget {
  const HomeScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // top-rounded box
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 600,
              padding: const EdgeInsets.symmetric(),
              decoration: BoxDecoration(
                color: const Color(0xFF9C0306),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/ambass2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              // make the Column fill the container so we can position childre
            ),
          ),
          // welcome text
          Positioned(
            top: 620,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "The abundance of variety will make you happy!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 133, 7, 7),
                    ),
                  ),
                  Text(
                    "We have a lot of variety and mechrandise.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
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
              ],
            ),
          ),

          // next button
          Positioned(
            top: 895,
            left: 260,
            right: 20,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/fifth'),
              child: Text("Next"),
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
