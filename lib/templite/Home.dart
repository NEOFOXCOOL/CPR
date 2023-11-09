import 'dart:math';

import 'package:catalogue_postes_radio/class/Catigories.dart';
import 'package:catalogue_postes_radio/component/ChartGraphique.dart';
import 'package:catalogue_postes_radio/component/FooterHome.dart';
import 'package:catalogue_postes_radio/component/Slide.dart';
import 'package:catalogue_postes_radio/svc/data_hundler.dart';
import 'package:flutter/material.dart';
import '../class/p_ricons_icons.dart';
import '../class/Colors.dart';


class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late final PageController _pageController = PageController(initialPage: currentpage,viewportFraction: 1);
  late int currentpage = 0;
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  List<Catigories> rawData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: catigoriesDataServices(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"),);
          }
          else if (data.hasData) {
            rawData = data.data as List<Catigories>;
            return ListView(
              children: [
                //TOP or Header
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/header.png"),
                        fit: BoxFit.fill
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 1, child: Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  PRicons.menu,
                                  color: PaletteColors.title.withOpacity(1),
                                )
                            ),
                          ),),
                          Expanded(flex: 1, child: Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  PRicons.search,
                                  color: PaletteColors.title.withOpacity(1),
                                )
                            ),
                          ),)
                        ],
                      ),
                      Expanded(child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "catalogue".toUpperCase(),
                              style: TextStyle(
                                  fontFamily: "PoppinsExtraBold",
                                  fontSize: 20,
                                  color: PaletteColors.upTitle
                              ),
                            ),
                            Text(
                              "postes radio".toUpperCase(),
                              style: TextStyle(
                                fontFamily: "PoppinsExtraBold",
                                fontSize: 30,
                                color: PaletteColors.title,
                              ),
                            ),
                            Text(
                              "Transmissions",
                              style: TextStyle(
                                fontFamily: "ReeyRegular",
                                fontSize: 16,
                                color: PaletteColors.supTitle,
                              ),
                            ),
                          ],
                        ),
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                //Pages Catigories
                Container(
                  // color: Colors.amber,
                  height: 200.0,
                  child:  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      PageView.builder(
                        onPageChanged: (int page){setState(() {
                          currentpage = page;
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
                ),
                SizedBox(height: 60.0,),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    "STATISTIQUES DES POSTES RADIOS".toUpperCase(),
                    style: TextStyle(
                      fontFamily: "PoppinsSemiBold",
                      fontSize: 10,
                      color: PaletteColors.upTitle,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(child: ChartRadial(
                      contentHF: rawData[0].content,
                      contentVHFC: rawData[1].content,
                      contentVHFP: rawData[2].content,
                      contentUHF: rawData[3].content,
                      contentSAT: rawData[4].content
                  ),),
                SizedBox(height: 30.0,),
              ]
            );
          }
          else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
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
            value = (value * -0.05).clamp(-1, 1);
          }
          return Transform.rotate(
              angle: pi * value,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CatigoriesSlide(
                    image: rawData[index].image.toString(),
                    title: rawData[index].title.toString(),
                    suptitle: rawData[index].suptype.toString(),
                    type: rawData[index].type.toString()
              ),
          )
          );
        }
    );
  }
  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.redAccent : Colors.black45,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
