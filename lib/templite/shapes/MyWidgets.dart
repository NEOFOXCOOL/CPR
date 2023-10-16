
import 'package:catalogue_postes_radio/templite/shapes/CardShape.dart';
import 'package:flutter/cupertino.dart';

class MyWidget{

  static Widget Cardshape(double hight){
    return Container(
      height: hight,
      child: RepaintBoundary(
        child: CustomPaint(
          size: Size(hight, hight * 1.302180685358255),
          painter: CardShape(),
        ),
      )
    );
  }
}