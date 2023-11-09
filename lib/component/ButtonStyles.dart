import 'package:flutter/material.dart';

import '../class/Colors.dart';

class ButtonStyles extends StatelessWidget {
  final String label;
  final double textsize;
  final double buttonsize;
   ButtonStyles(this.textsize,this.label,this.buttonsize);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonsize,width: buttonsize,
      decoration: BoxDecoration(
        color: Colors.white,
          // gradient: const LinearGradient(
          //     begin: Alignment.bottomRight,
          //     end: Alignment.topLeft,
          //     colors: [
          //       PaletteColors.PrimaryColor,
          //       PaletteColors.SecondryColor
          //     ]
          // ),
          boxShadow: [
            BoxShadow(
                color: Colors.black45.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 0.1,
                offset: const Offset(
                    0,3
                )
            ),
            BoxShadow(
                color: Colors.white54.withOpacity(0.2),
                blurRadius: 0.5,
                spreadRadius: 0.1,
                offset: const Offset(
                    0,-0.5
                )
            )
          ],
          shape: BoxShape.circle
      ),
      child: TextButton(
        onPressed: (){},
        child: Text(label.toUpperCase(),
        style: TextStyle(
          fontFamily: "PoppinsSemiBold",
          color: PaletteColors.upTitle,
          fontSize: textsize,
        ),),
      ),
    );
  }
}
