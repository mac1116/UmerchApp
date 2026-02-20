import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9C0306),
      body: InkWell(
        // make the ink fill the area
        splashColor: const Color.fromARGB(255, 165, 41, 41).withOpacity(0.3),
        onTap: () => Navigator.of(context).pushNamed('/second'),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logotrans.png',
                  fit: BoxFit.contain,
                  width: 500,
                  alignment: Alignment.topCenter,
                ),
                Image.asset(
                  'assets/images/asdada.png',
                  fit: BoxFit.contain,
                  width: 200,
                  alignment: Alignment.center,
                ),
                Image.asset(
                  'assets/images/logotrans2.png',
                  width: 500,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
