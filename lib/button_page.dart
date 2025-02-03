import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterproject/color_palette.dart';
import 'package:flutterproject/quiz_page.dart';
import 'package:flutterproject/listening_page.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan resmi
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/2.jpeg'),
                opacity: 0.4,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Butonlar
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoryAudioPage()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: color6,
                          child: FaIcon(
                            FontAwesomeIcons.headphones,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Listening',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Caveat',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArseneLupinQuizPage()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: color4,
                          child: FaIcon(
                            FontAwesomeIcons.brain,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Quiz',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Caveat',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Game butonu yakında!')),
                          );
                        },
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: color8,
                          child: FaIcon(
                            FontAwesomeIcons.gamepad,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Game',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Caveat',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
