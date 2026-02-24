import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen3 extends StatelessWidget {
  const HomeScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          // top-rounded box
          Expanded(
            flex: 65,
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xFF9C0306),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/ambass1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              // make the Column fill the container so we can position children
            ),
          ),
          // welcome text
          Expanded(
            flex: 35,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Transform.translate(
                  offset: const Offset(0, -60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No more going to store!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 133, 7, 7),
                        ),
                      ),
                      Text(
                        "Own the design product in seconds by viewing it from the app.",
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
            ),
          ),

          // pagination dots
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
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
              ],
            ),
          ),

          // next button
          Positioned(
            top: 895,
            left: 260,
            right: 20,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/fourth'),
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
