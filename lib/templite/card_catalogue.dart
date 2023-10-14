
import 'package:catalogue_postes_radio/appicons_icons.dart';
import 'package:catalogue_postes_radio/templite/Colors.dart';
import 'package:flutter/material.dart';


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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        ),
        color: Colors.white,
      boxShadow: [
        BoxShadow(
          blurRadius: 1.0,
          spreadRadius: 1,
          offset: Offset(1,1),
          color: Colors.black12,
        ),
      ]
      ),
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      width: 100,
      height: 80,
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Row(

          children: [
            SizedBox(width: 10,),
            Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      widget.image
                                  ),
                                  fit: BoxFit.cover),
                          ),
                        ),
              ),
            SizedBox(width: 10,),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.model,
                    style: TextStyle(
                        fontSize: 12,
                        height: 1,
                        wordSpacing: 1
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    widget.annee,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1,
                        wordSpacing: 1
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                        Appicons.bookmark_border,
                    color: PaletteColors.SecondryColor,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
