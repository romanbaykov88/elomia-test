import 'package:flutter/material.dart';

class Reaction extends StatefulWidget {
  final String? reaction;

  const Reaction({Key? key, this.reaction}) : super(key: key);

  @override
  _ReactionState createState() => _ReactionState();
}

class _ReactionState extends State<Reaction> {

  String? reaction;


  @override
  void initState() {
    super.initState();
    reaction = widget.reaction;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if(reaction == 'like'){
                reaction = '';
              }else{
                reaction = 'like';
              }
            });
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xfff4f3f3),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.thumb_up,
              color: (reaction == 'like') ? const Color(0xff52d225) : const Color(0xffc7c7cc),
              size: 14.0,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if(reaction == 'dislike'){
                reaction = '';
              }else{
                reaction = 'dislike';
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xfff4f3f3),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.thumb_down,
                color: (reaction == 'dislike') ? Colors.red : const Color(0xffc7c7cc),
                size: 14.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
