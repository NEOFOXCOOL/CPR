import 'dart:math';
import 'package:catalogue_postes_radio/class/Colors.dart';
import 'package:catalogue_postes_radio/class/p_ricons_icons.dart';
import 'package:catalogue_postes_radio/component/templiteContent.dart';
import 'package:catalogue_postes_radio/svc/data_hundler.dart';
import 'package:flutter/material.dart';
import '../class/poste_radio_hf.dart';

class TempliteHF extends StatefulWidget {
  const TempliteHF({super.key});

  @override
  State<TempliteHF> createState() => _TempliteHFState();
}

class _TempliteHFState extends State<TempliteHF> {

  late final PageController _pageController = PageController(initialPage: currentpage,viewportFraction: 1);
  late int currentpage = 0;
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  late List<HF> rawData = [];
  late String imageHeader = rawData[0].images[0];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hfDataServices(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"),);
        }
        else if (data.hasData) {
          rawData = data.data as List<HF>;
          return Scaffold(
            backgroundColor: PaletteColors.bagckroundColors,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => {},
                icon: Icon(PRicons.left_open,color: PaletteColors.iconsColor,),
              ),
            ),
            body: Column(
              children: [
                // Header
                Expanded(flex:2, child: Stack(
                  children: [
                    // Images Hundler
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bagckroundItem.png"),
                          fit: BoxFit.fill
                        )
                      ),
                      child: Image.asset(imageHeader),
                    ),
                  ],
                )),
                // Body
                Expanded(flex:3, child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      PageView.builder(
                          onPageChanged: (int page){setState(() {
                            currentpage = page;
                            imageHeader = rawData[page].images[0];
                          });},
                          padEnds: true,
                          pageSnapping: true,
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          physics: const ClampingScrollPhysics(),
                          itemCount: rawData.length,
                          itemBuilder: (context,index){
                            return CarouselView(index);
                          }
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children:[
                          Container(
                            margin: EdgeInsets.only(bottom: 35),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                for (int i = 0; i < rawData.length; i++)
                                  if (i == currentpage) ...[circleBar(true)] else
                                    circleBar(false),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Visibility(
                      //   visible: currentpage == rawData.length - 1
                      //       ? true
                      //       : false,
                      //   child: FloatingActionButton(
                      //     onPressed: () {
                      //     },
                      //     shape: BeveledRectangleBorder(
                      //         borderRadius: BorderRadius.all(Radius.circular(30))
                      //     ),
                      //     backgroundColor: Colors.white54,
                      //     child: Icon(Icons.arrow_forward,color: Colors.black,),
                      //   ),
                      // )
                    ],
                  ),
                ))
              ],
            )
          );
        }
        else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Widget CarouselView(int index){
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context,child){
          double value = 0.0;
          if(_pageController.position.haveDimensions){
            value = index.toDouble() - (_pageController.page ?? 0);
            value = (value * -0.05).clamp(-1, 1);
          }
          return Transform.rotate(
              angle: pi * value,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TempliteContent(
                  title: rawData[index].model.toString(),
                  suptitle: rawData[index].nationalite.toString(),
                  info: rawData[index].description.toString(),
                  years: rawData[index].anneeAcquisition.toString(),
                  hz: rawData[index].espacementCanaux.toString(),
                ),
              )
          );
        }
    );
  }
  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.redAccent : Colors.black45,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}