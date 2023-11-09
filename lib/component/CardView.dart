
import 'package:flutter/material.dart';
import '../class/Colors.dart';

class CardView extends StatefulWidget {

  final String? image;
  final String? model;
  final String? annee;
  const CardView({required this.annee, required this.image, required this.model, super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                PaletteColors.mainColor,
                PaletteColors.secondryColor
              ]
          ),
          boxShadow: [
            BoxShadow(
                color: PaletteColors.mainColor.withOpacity(0.8),
                blurRadius: 15,
                spreadRadius: 0.1,
                offset: const Offset(
                    0,5
                )
            ),
            BoxShadow(
                color: Colors.white54.withOpacity(0.3),
                blurRadius: 0.1,
                spreadRadius: 0,
                offset: const Offset(
                    0,-0.5
                )
            )
          ],
        ),
        height: 100,width: 70,
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 200,width: 200,
                    child: Image(
                      image: AssetImage(widget.image.toString()),
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.model.toString(),
                        style: const TextStyle(
                            fontFamily: "CaviarDreamsBold",
                            fontSize: 12,
                            color: PaletteColors.iconsColor
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        widget.annee.toString(),
                        style: const TextStyle(
                            fontFamily: "CaviarDreams",
                            fontSize: 16,
                            color: Colors.amber
                        ),
                      ),
                    ],
                  ),
                )
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
