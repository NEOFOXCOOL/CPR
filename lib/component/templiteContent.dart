import 'package:catalogue_postes_radio/class/Colors.dart';
import 'package:flutter/material.dart';

class TempliteContent extends StatefulWidget {

  final String title,suptitle,years,info,hz;
      const TempliteContent(
          {
            required this.title,
            required this.suptitle,
            required this.years,
            required this.info,
            required this.hz,
            super.key
          });

      @override
  State<TempliteContent> createState() => _TempliteContentState();
}

class _TempliteContentState extends State<TempliteContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      height: 100,
      width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                PaletteColors.slideColorsOne,
                PaletteColors.slideColorsTwo
              ]
          ),
          boxShadow: [
            BoxShadow(
                color: PaletteColors.slideShadow.withOpacity(0.3),
                blurRadius: 2,
                spreadRadius: 0.05,
                offset: const Offset(
                    0,1
                )
            ),
            BoxShadow(
                color: Colors.white54.withOpacity(0.3),
                blurRadius: 0.05,
                spreadRadius: 0,
                offset: const Offset(
                    0,-0.1
                )
            )
          ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex:1,child: Container(
            alignment: Alignment.center,
            child: Text(
            widget.title.toUpperCase(),
            style: TextStyle(
                fontSize: 24,
                fontFamily: "OpenSansVariableFont",
                color: PaletteColors.textColor
            ),
          ),),),
          Expanded(flex:1,child: Container(
            alignment: Alignment.center,
            child: Text(
            widget.suptitle.toUpperCase(),
            style: TextStyle(
                fontSize: 14,
                fontFamily: "OpenSansVariableFont",
                color: PaletteColors.textColor
            ),
          ),),),
          Expanded(flex:1,child: Container(
            alignment: Alignment.center,
            child: Text(
            widget.years.toUpperCase(),
            style: TextStyle(
                fontSize: 24,
                fontFamily: "OpenSansVariableFont",
                color: PaletteColors.textColor
            ),
          ),),),
          Expanded(flex:1,child: Container(
            alignment: Alignment.center,
            child: Text(
            widget.hz.toUpperCase(),
            style: TextStyle(
                fontSize: 24,
                fontFamily: "OpenSansVariableFont",
                color: PaletteColors.textColor
            ),
          ),),),
          Expanded(flex:1,child: Container(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => {},
              child: Text("Open"),
            )
            ),
          ),
        ],
      ),
    );
  }
}

