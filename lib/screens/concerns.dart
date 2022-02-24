import 'package:flutter/material.dart';
import 'package:mobile/screens/chat.dart';
import 'package:mobile/widgets/Concern.dart';

class ConcernsScreen extends StatefulWidget {
  ConcernsScreen({Key? key}) : super(key: key);

  static List<ConcernsData> concerns = [
    ConcernsData(
        name: 'Difficulties in relationships',
        description: 'Choose three things you want to work on first  and text'),
    ConcernsData(name: 'Anxiety'),
    ConcernsData(name: 'Depression'),
    ConcernsData(
        name: 'Stress',
        description: 'Choose three things you want to work on first  and text'),
    ConcernsData(
      name: 'Loneliness',
    ),
    ConcernsData(
      name: 'Low self-esteem',
    ),
    ConcernsData(
      name: 'Heartbreak',
    ),
    ConcernsData(
      name: 'Problems around eating',
    ),
    ConcernsData(
      name: 'Low mood',
    ),
    ConcernsData(
      name: 'Struggling at work',
    ),
    ConcernsData(
      name: 'Work burnout',
    ),
    ConcernsData(
      name: 'Using alcohol or other substances',
    ),
    ConcernsData(
      name: 'Self-harm',
    ),
    ConcernsData(
      name: 'Loss of a loved one',
    ),
    ConcernsData(
      name: 'Negative body image',
    ),
    ConcernsData(
      name: 'Panic attacks',
    ),
    ConcernsData(
      name: 'Mood swings',
    ),
    ConcernsData(
      name: 'Out of control feelings',
    ),
    ConcernsData(
      name: 'Worries about health',
    ),
    ConcernsData(
      name: 'Phobias',
    ),
    ConcernsData(
      name: 'Obsessional thinking',
    ),
    ConcernsData(
      name: 'Something terrible happened',
    ),
    ConcernsData(
      name: 'Flashbacks to something traumatic',
    ),
  ];

  @override
  _ConcernsScreenState createState() => _ConcernsScreenState();
}

class ConcernsData {
  String name;
  String? description;

  ConcernsData({required this.name, this.description});
}

class _ConcernsScreenState extends State<ConcernsScreen> {
  List<bool> selectedItems = ConcernsScreen.concerns.map((e) => false).toList();

  void toggleSelected(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];
    });
  }

  bool getSelected(int index) {
    return selectedItems[index];
  }

  getSelectedItemsCount() {
    return selectedItems.where((item) => item == true).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff152241),
        ),
        child: Column(
          children: [
            Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Text(
                          'What are your concerns',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                            fontFamily: 'SF Pro Display',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          'Choose three things you want to work on first',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Flexible(
                flex: 10,
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                        itemCount: ConcernsScreen.concerns.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == ConcernsScreen.concerns.length) {
                            return const SizedBox(height: 180);
                          } else {
                            ConcernsData currentConcernData =
                                ConcernsScreen.concerns[index];
                            return GestureDetector(
                              onTap: () {
                                toggleSelected(index);
                              },
                              child: Concern(
                                title: currentConcernData.name,
                                description: currentConcernData.description,
                                selected: getSelected(index),
                              ),
                            );
                          }
                        }),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: IgnorePointer(
                        child: Container(
                          height: 160.0,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xff060E25),
                                Color(0x0012214A),
                              ],
                            ),
                          ),
                        ),
                      )),
                  getSelectedItemsCount() >= 3
                      ? Positioned(
                          bottom: 70,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: 54,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xff2192F0),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ChatScreen()),
                                    );
                                  },
                                  child: const Text(
                                    'Get started',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  )),
                            ),
                          ),
                        )
                      : Container(),
                ])),
          ],
        ),
      ),
    );
  }
}
