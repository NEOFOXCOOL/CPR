import 'package:catalogue_postes_radio/Services/hf_data_hundler.dart';
import 'package:catalogue_postes_radio/appicons_icons.dart';
import 'package:flutter/material.dart';
import '../poste_radio_hf.dart';
import 'Colors.dart';
import 'card_catalogue.dart';

class HfTemplite extends StatefulWidget {
  const HfTemplite({super.key});
  @override
  State<HfTemplite> createState() => _HfTemplite();
}

class _HfTemplite extends State<HfTemplite> {
  var items ;
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
          SizedBox(height: 20,),
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15
                  ),
                  child: Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
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
                            offset: Offset(
                              0,5
                            )
                          ),
                          BoxShadow(
                              color: Colors.white54.withOpacity(0.3),
                              blurRadius: 0.1,
                              spreadRadius: 0,
                              offset: Offset(
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
                        color: Colors.white.withOpacity(0.5),
                      )
                    ),
                  ),
                )
              )),
          Expanded(
              flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                left: 15
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "postes".toUpperCase(),
                    style: TextStyle(
                      color: PaletteColors.TextColor.withOpacity(0.8),
                      fontSize: 32,
                      fontFamily: "BebasNeue",

                    ),
                  )
              ),
            ),
              ),
          Expanded(
              flex: 4,
              child: FutureBuilder(
                future: jsonServices(),
                builder: (context, data){
                  if(data.hasError){
                    return Center(child: Text("${data.error}"),);
                  }
                  else if(data.hasData){
                    items = data.data as List<PRHF>;
                    return Container(
                      // decoration: BoxDecoration(
                      //     color: Colors.transparent
                      // ),
                      // child: ListView.builder(
                      //   scrollDirection: Axis.vertical,
                      //   itemCount: items.length,
                      //   itemBuilder: (context,index){
                      //     return CatalogueCard(
                      //         items[index].images.toString(),
                      //         items[index].model.toString(),
                      //         items[index].anneeAcquisition.toString()
                      //     );
                      //   },
                      // ),
                    );
                  }
                  else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              ),),
          Expanded(
              flex: 1,
              child: Align(),
          ),
        ],
      ),
      )
    );
  }

}