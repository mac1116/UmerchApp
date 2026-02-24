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

          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logotrans.png',
                  fit: BoxFit.fitWidth,
                  width: 600,
                  alignment: Alignment.topCenter,
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: Image.asset(
                    'assets/images/asdada.png',
                    fit: BoxFit.fitWidth,
                    width: 200,
                    alignment: Alignment.center,
                  ),
                ),

                const SizedBox(height: 20),

                Image.asset(
                  'assets/images/logotrans2.png',
                  width: 500,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          ),
      ),
    );
  }
}
