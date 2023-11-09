import 'dart:math';
import 'dart:ui';
import 'package:catalogue_postes_radio/class/p_ricons_icons.dart';
import 'package:flutter/material.dart';
import '../class/poste_radio_hf.dart';
import '../class/Colors.dart';
import '../component/Paragraph.dart';

class Catalogue extends StatefulWidget {
  final HF hf;
  const Catalogue(this.hf,{super.key});

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {

  late final PageController _pageController = PageController(initialPage: currentpage,viewportFraction: 0.8);
  int currentpage = 0;
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                PaletteColors.mainColor,
                PaletteColors.secondryColor
              ]
          ),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/CatalogueHeader.png"),
                  fit: BoxFit.cover
                ),
                // gradient: LinearGradient(
                //     begin: Alignment.bottomRight,
                //     end: Alignment.topLeft,
                //     colors: [
                //       PaletteColors.TherdColor,
                //       PaletteColors.FortColor
                //     ]
                // ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15
                        ),
                        child: Container(
                          height: 50,width: 50,
                          decoration: BoxDecoration(
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
                                    spreadRadius: 0.2,
                                    offset: const Offset(
                                        0,-0.5
                                    )
                                )
                              ],
                              shape: BoxShape.circle
                          ),
                          child: IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                PRicons.left_open,
                                color: Colors.white.withOpacity(1),
                              )
                          ),
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      height: 250,width: double.maxFinite,
                      child: PageView.builder(
                          padEnds: true,
                          pageSnapping: true,
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          physics: const ClampingScrollPhysics(),
                          itemCount: widget.hf.images.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
                              child: CarouselView(index),
                            );
                          }
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.hf.anneeAcquisition.toString(),
                          style: TextStyle(
                              fontFamily: "CaviarDreams",
                              fontSize: 24,
                              color: PaletteColors.iconsColor,
                              shadows: [
                                Shadow(
                                    offset: const Offset(2,0),
                                    blurRadius: 15,
                                    color: PaletteColors.mainColor.withOpacity(0.5)
                                )
                              ]
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.hf.model.toString(),
                          style: TextStyle(
                              fontFamily: "BebasNeue",
                              fontSize: 40,
                              color: PaletteColors.iconsColor,
                              shadows: [
                                Shadow(
                                    offset: const Offset(2,0),
                                    blurRadius: 15,
                                    color: PaletteColors.mainColor.withOpacity(0.5)
                                )
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Paragraph("description", widget.hf.description.toString()),
            Paragraph("nationalite", widget.hf.nationalite.toString()),
            Paragraph("securite",widget.hf.securite.toString() ),
            Paragraph("gammeFrequence", widget.hf.gammeFrequence.toString()),
            Paragraph("modeUtilisation", widget.hf.modeUtilisation.toString()),
            Paragraph("modeTravail", widget.hf.modeTravail.toString()),
            Paragraph("donnees", widget.hf.donnees.toString()),
            Paragraph("puissance", widget.hf.puissance.toString()),
            Paragraph("espacementCanaux", widget.hf.espacementCanaux.toString()),
            Paragraph("nombrecanaux", widget.hf.nombrecanaux.toString()),
            Paragraph("modulation", widget.hf.modulation.toString()),
            Paragraph("Alimantation", widget.hf.alimantation.toString()),
            Paragraph("antenne", widget.hf.antenne.toString()),
          ],
        ),
      ),
    );
  }

  Widget CarouselView(int index){
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context,child){
          double value = 0.0;
          if(_pageController.position.haveDimensions){
            value = index.toDouble() - (_pageController.page ?? 0);
            value = (value * 0.05).clamp(-1, 1);
          }
          return Transform.rotate(
              angle: pi * value,
              child: Container(
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  widget.hf.images![index].toString(),
                  height: double.maxFinite,
                  width: double.maxFinite,),
              ));
        }
    );
  }
}
