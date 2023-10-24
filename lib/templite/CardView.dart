
import 'package:catalogue_postes_radio/appicons_icons.dart';
import 'package:catalogue_postes_radio/templite/Catalogue.dart';
import 'package:catalogue_postes_radio/templite/Colors.dart';
import 'package:flutter/material.dart';

import '../poste_radio_hf.dart';

class CatalogueCard extends StatefulWidget {

  final HF hf;
  const CatalogueCard(
      this.hf,{super.key}
      );

  @override
  State<CatalogueCard> createState() => _CatalogueCardState();
}

class _CatalogueCardState extends State<CatalogueCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Appicons.bookmark_border,
                        color: Colors.white.withOpacity(0.8),
                        size: 35,
                      ),
                    ),
                    const SizedBox(width: 70,),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Catalogue(widget.hf))
                      );
                    },
                      child: Text(
                        "More",
                        style: const TextStyle(
                            color: PaletteColors.TextColor2
                        ),
                      ),
                    )
                  ],
                )
            ),
            Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 200,width: 200,
                    child: Image(
                      image: AssetImage(widget.hf.images![0].toString()),
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
                        widget.hf.model.toString(),
                        style: TextStyle(
                            fontFamily: "CaviarDreamsBold",
                            fontSize: 12,
                            color: PaletteColors.TextColor
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        widget.hf.anneeAcquisition.toString(),
                        style: TextStyle(
                            fontFamily: "CaviarDreams",
                            fontSize: 16,
                            color: Colors.amber
                        ),
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
