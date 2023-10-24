import 'dart:math';
import 'package:catalogue_postes_radio/appicons_icons.dart';
import 'package:flutter/material.dart';
import '../poste_radio_hf.dart';
import '../svc/data_hundler.dart';
import 'Colors.dart';
import 'CardView.dart';

class HfTemplite extends StatefulWidget {

    const HfTemplite(
        {super.key});

  @override
  State<HfTemplite> createState() => _HfTemplite();
}

class _HfTemplite extends State<HfTemplite> {

  late int currentPage = 0;
  late final PageController _pageController = PageController(initialPage: currentPage,viewportFraction: 0.8);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }


  List<HF> items = [] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/hf_bagckround.png"),
            fit: BoxFit.cover
          ),
        ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Expanded(
              flex: 1,
              child: Align(
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
                              spreadRadius: 0.2,
                              offset: const Offset(
                                  0,-0.5
                              )
                          )
                        ],
                        shape: BoxShape.circle
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(
                          Appicons.arrow_back,
                        color: Colors.white.withOpacity(1),
                      )
                    ),
                  ),
                )
              )),
          const SizedBox(height: 20,),
          Expanded(
              flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "postes".toUpperCase(),
                        style: TextStyle(
                          color: PaletteColors.TextColor.withOpacity(0.8),
                          fontSize: 35,
                          fontFamily: "CaviarDreams",
                        ),
                      ),
                      Text(
                        "radio hf".toUpperCase(),
                        style: TextStyle(
                          color: PaletteColors.TextColor.withOpacity(0.8),
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          // fontFamily: "CaviarDreamsBold",
                          fontFamily: "JumperBold",
                          letterSpacing: 2
                        ),
                      )
                    ],
                  )
              ),
            ),
              ),
          Expanded(
              flex: 3,
              child: FutureBuilder(
                future: jsonServicesHF(),
                builder: (context, data){
                  if(data.hasError){
                    return Center(child: Text("${data.error}"),);
                  }
                  else if(data.hasData){
                    items = data.data as List<HF>;

                    return PageView.builder(
                      padEnds: true,
                        pageSnapping: true,
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        physics: const ClampingScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context,index){
                          return Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                            child: CarouselView(index),
                          );
                        }
                    );
                  }
                  else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),),
          const SizedBox(height: 50,)
        ],
      ),
      )
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
            child: CatalogueCard(items[index]));
        }
    );
  }

}