import 'package:flutter/material.dart';
import 'package:flutterproject/color_palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterproject/button_page.dart';

class BackgroundButtonScreen extends StatelessWidget {
  const BackgroundButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan resmi
          Positioned.fill(
            child: Image.asset(
              'images/3.jpeg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Text('Image not found'),
              ),
            ),
          ),
          Positioned(
            top: 100.0,
            left: 0,
            right: 0,
            child: Text(
              'Welcome Arsen Lupen\'s Stories',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: color3,
                fontFamily: 'DancingScript',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Buton
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 200.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ButtonPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: color3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.hatCowboy, // Şapka ikonu
                      color: Colors.black,
                    ),
                    SizedBox(width: 8), // İkonlar ve metin arasındaki boşluk
                    Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8), // Metin ve anahtar ikonu arasındaki boşluk
                    FaIcon(
                      FontAwesomeIcons.key, // Anahtar ikonu
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
