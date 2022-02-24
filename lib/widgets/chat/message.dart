import 'package:flutter/material.dart';
import 'dart:math' as math;

class TailDirection {
  const TailDirection._(this.index);

  final int index;

  static const TailDirection left = TailDirection._(0);
  static const TailDirection right = TailDirection._(1);
}

class Message extends StatelessWidget {
  const Message(
      {Key? key,
      required this.messageText,
      required this.color,
      this.textColor,
      this.tailDirection})
      : super(key: key);

  final String messageText;
  final Color color;
  final Color? textColor;
  final TailDirection? tailDirection;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (tailDirection == TailDirection.left ? Alignment.centerLeft : Alignment.centerRight),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  messageText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.375,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: (tailDirection == TailDirection.left ? 0 : null),
            right: (tailDirection == TailDirection.left ? null : 0),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi * (tailDirection == TailDirection.left ? 0 : 1)),
                child: Container(
                  width: 21,
                  height: 16,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/tail.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
