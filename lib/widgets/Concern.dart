import 'package:flutter/material.dart';

class Concern extends StatelessWidget {
  const Concern(
      {Key? key, required this.title, this.description, this.selected})
      : super(key: key);

  final String title;
  final String? description;
  final bool? selected;

  Widget getCheckBox(bool checked) {
    if (checked) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: const Color(0xff2192F0),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: const Color(0xff43598E)),
        ),
        child: const Icon(
          Icons.done,
          color: Colors.white,
          size: 14.0,
        ),
      );
    }

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: const Color(0xff43598E)),
      ),
    );
  }

  List<Widget> getNameAndDescription() {
    List<Widget> result = [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    ];

    if (description != null) {
      result.add(Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            description as String,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff29395F),
          border: Border.all(color: (selected as bool ? Color(0xff2192F0) : Color(0xff43598E) )),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Column(
                  children: [
                    getCheckBox(selected ?? false)
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Column(
                      children: getNameAndDescription(),
                    ),
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
