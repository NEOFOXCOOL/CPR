
import 'package:catalogue_postes_radio/templite/Colors.dart';
import 'package:flutter/material.dart';
import '../appicons_icons.dart';

class CatalogueCard extends StatefulWidget {
  final String model;
  final String itemsimage;
  final String annee;
  const CatalogueCard(
      this.model,
      this.annee,
      this.itemsimage,
      );

  @override
  State<CatalogueCard> createState() => _CatalogueCardState();
}

class _CatalogueCardState extends State<CatalogueCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10,10,10),
      height: 100,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0,1),
          ),
        ],
      ),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                widget.itemsimage,
                height: 100,width: 150,
              ),
            ),
            // const Divider(height: 10,),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Expanded(
                    flex:1,
                    child:
                    Text(
                      widget.model,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontFamily: 'robotobold',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Text(
                      widget.annee,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontFamily: 'robotobold',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),),
                  Expanded(
                    flex:1,
                    child: IconButton(
                        color: ColorsPalette.PrimaryIcon,
                        onPressed: (){},
                        icon: const Icon(Appicons.bookmark_border,size:20,)),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



