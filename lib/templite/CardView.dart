
import 'package:catalogue_postes_radio/appicons_icons.dart';
import 'package:catalogue_postes_radio/templite/Colors.dart';
import 'package:catalogue_postes_radio/templite/shapes/CardShape.dart';
import 'package:catalogue_postes_radio/templite/shapes/MyWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CatalogueCard extends StatefulWidget {

  final String image;
  final String model;
  final String annee;

  const CatalogueCard(
      this.image,
      this.model,
      this.annee, {super.key}
      );

  @override
  State<CatalogueCard> createState() => _CatalogueCardState();
}

class _CatalogueCardState extends State<CatalogueCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(


        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                PaletteColors.PrimaryColor,
                PaletteColors.SecondryColor
              ]
          ),
          boxShadow: [
            BoxShadow(
                color: PaletteColors.PrimaryColor.withOpacity(0.8),
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
              flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Appicons.bookmark,
                    color: Colors.amber,
                      size: 40,
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: Image.asset("assets/hf_er_codan_sentry_h_1.png"),
                  )
                )
            ),
            Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.model.toString(),
                      style: TextStyle(
                        color: PaletteColors.TextColor
                      ),
                    ),
                    )
                ),
            Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.annee.toString(),
                    style: TextStyle(
                        color: PaletteColors.TextColor
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
