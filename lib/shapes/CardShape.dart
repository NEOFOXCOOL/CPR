import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

//Copy this CustomPainter code to the Bottom of the File
class CardShape extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(267.22,392);
path_0.lineTo(53.78,392);
path_0.arcToPoint(Offset(18.310000000000002,356.53),radius: Radius.elliptical(35.47, 35.47),rotation: 0 ,largeArc: false,clockwise: true);
path_0.lineTo(18.310000000000002,112.24);
path_0.arcToPoint(Offset(45.58,77.73),radius: Radius.elliptical(35.48, 35.48),rotation: 0 ,largeArc: false,clockwise: true);
path_0.lineTo(259,27);
path_0.arcToPoint(Offset(302.68,61.5),radius: Radius.elliptical(35.47, 35.47),rotation: 0 ,largeArc: false,clockwise: true);
path_0.lineTo(302.68,356.5);
path_0.arcToPoint(Offset(267.22,392),radius: Radius.elliptical(35.47, 35.47),rotation: 0 ,largeArc: false,clockwise: true);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*0.08526480,size.height*0.1387799), Offset(size.width*0.9545483,size.height*0.8959091), [Color(0xff414850).withOpacity(1),Color(0xff131720).withOpacity(1)], [0,1]);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}