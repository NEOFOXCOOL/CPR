
import 'package:catalogue_postes_radio/class/ButtonBagckroundColor.dart';
import 'package:flutter/material.dart';

import '../class/Colors.dart';

class CatigoriesSlide extends StatefulWidget {

  final String? image,title,suptitle,type;

  const CatigoriesSlide({required this.image,required this.title, required this.suptitle,required this.type, super.key});

  @override
  State<CatigoriesSlide> createState() => _CatigoriesSlideState();
}

class _CatigoriesSlideState extends State<CatigoriesSlide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.image.toString()),
          fit: BoxFit.cover,
        ),
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
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states){
                if(states.contains(MaterialState.focused) && states.contains(MaterialState.hovered)){
                  return PaletteColors.buttonSpecial;
                }
                else if(states.contains(MaterialState.focused)){
                  return PaletteColors.buttonFocus;
                }
                else if(states.contains(MaterialState.error)){
                  return PaletteColors.buttonHover;
                }
                else if(states.contains(MaterialState.pressed)){
                  return PaletteColors.buttonPress;
                }
                return Colors.transparent;
              }
          ),
        ),
        onPressed: (){},
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.title.toString(),
                style: const TextStyle(
                  color: PaletteColors.upTitle,
                  fontSize: 20,
                  fontFamily: "PoppinsLight",
                ),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:  MainAxisAlignment.start,
                children: [
                  Text(widget.type.toString().toUpperCase(),
                    style: TextStyle(
                      color: PaletteColors.upTitle,
                      fontSize: widget.type.toString() == "Satellitaire" ? 25 : 45,
                      fontFamily: "PoppinsExtraBold",
                    ),),
                  Text(widget.suptitle.toString(),
                    style: const TextStyle(
                      color: PaletteColors.upTitle,
                      fontSize: 8,
                      fontFamily: "PoppinsLight",
                    ),),
                ],),
            ],
          ),
        ),
      ),
    );
  }
}
