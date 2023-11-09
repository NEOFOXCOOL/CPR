import 'package:catalogue_postes_radio/class/Colors.dart';
import 'package:flutter/material.dart';

class ButtonBagckroundColor implements MaterialStateProperty<Color?>{

  final BuildContext context;
  ButtonBagckroundColor(this.context);

  @override
  Color? resolve(Set<MaterialState> states){
    if(states.contains(MaterialState.focused) && states.contains(MaterialState.hovered)){
      return PaletteColors.buttonSpecial;
    }
    else if(states.contains(MaterialState.focused)){
      return PaletteColors.buttonFocus;
    }
    else if(states.contains(MaterialState.hovered)){
      return PaletteColors.buttonHover;
    }
    else if(states.contains(MaterialState.pressed)){
      return PaletteColors.buttonPress;
    }
    return Colors.transparent;
  }

}