import 'package:flutter/material.dart';
import 'package:mobile/icons.dart';
import 'package:mobile/screens/concerns.dart';
import 'package:mobile/widgets/chat/message.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff010818),
              Color(0xff12224D),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/home_bg.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Column(
                      verticalDirection: VerticalDirection.up,
                      children: const [
                        Message(
                          messageText:
                              'I don’t know if I made the right decision',
                          color: Color(0xffAC6EF6),
                          textColor: Colors.white,
                          tailDirection: TailDirection.right,
                        ),
                        Message(
                          messageText:
                              'Hi :) I am always here for you! How are you feeling right now?',
                          color: Colors.white,
                          tailDirection: TailDirection.left,
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(children: [
                      const Text(
                        'Meet Elomia',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                          fontFamily: 'SF Pro Display',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'An AI-powered companion that helps to improve mental health',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ConcernsScreen()),
                            );
                          },
                          // icon: CustomIcons.apple,
                          // label: Enabled,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(CustomIcons.apple,
                                    color: Colors.black),
                              ),
                              Text(
                                'Continue with Apple',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        'PREVIEW THE APP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
