import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'detail_screen.dart';

class ChoiceLanguage extends StatelessWidget {
  const ChoiceLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 660,
            child: Center(
              child: SvgPicture.asset(
                "asset/icons/Logo.svg",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40,
              bottom: 20,
            ),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                ),
                child: const Text(
                  "Русский",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                ),
                child: const Text(
                  "O'zbek",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
