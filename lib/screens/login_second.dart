import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

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
              ),
              // make the Column fill the container so we can position children
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/logotrans3.png',
                      fit: BoxFit.contain,
                      width: 600,
                    ),

                    // middle logo
                    Image.asset(
                      'assets/images/asdada.png',
                      fit: BoxFit.contain,
                      width: 170,
                    ),

                    Image.asset(
                      'assets/images/logotrans4.png',
                      fit: BoxFit.contain,
                      width: 600,
                    ),
                  ],
                ),
              ),
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
                        "Welcome",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 133, 7, 7),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 1,
                          vertical: 5,
                        ),
                        child: Text(
                          "Let's get started",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
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
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/third'),
                  child: Text("Next"),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    backgroundColor: const Color(0xFF9C0306),
                    foregroundColor: const Color(0xFFFFFFFF),
                    textStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xFF9C0306),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
