
import 'package:flutter/material.dart';

import '../class/Colors.dart';

class Paragraph extends StatefulWidget {
final String title;
final String content;

Paragraph(this.title, this.content);

  @override
  State<Paragraph> createState() => _ParagraphState();
}

class _ParagraphState extends State<Paragraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title.toUpperCase(),
                style: TextStyle(
                    color: PaletteColors.iconsColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.content,
                style: TextStyle(
                    color: PaletteColors.iconsColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
