import 'package:catalogue_postes_radio/Services/hf_data_hundler.dart';
import 'package:flutter/material.dart';
import '../poste_radio_hf.dart';

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
      child: FutureBuilder(
        future: jsonServices(),
        builder: (context, data){
          if(data.hasError){
            return Center(child: Text("${data.error}"),);
          }
          else if(data.hasData){
            items = data.data as List<PRHF>;
            return Column(
                  children: [
                    //Header
                  Expanded(
                    flex: 2,
                           child: Container(
                             decoration: const BoxDecoration(
                                 color: Colors.transparent,
                               borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(0),
                                 bottomRight: Radius.circular(0)
                               )
                             ),
                             child: const Center(
                               child: Text(
                                   "POSTES RADIO HF",
                               style: TextStyle(
                                 fontSize: 32,
                                 color: Colors.white,
                                 fontFamily: 'Robotobold',
                                 fontWeight: FontWeight.bold
                               ),
                               ),
                             ),
                           ),
                      ),
                  // Expanded(
                  //     flex: 5,
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.vertical,
                  //         itemCount: items.length,
                  //         itemBuilder: (context,index){
                  //             return CatalogueCard(
                  //                 items[index].images.toString(),
                  //                 items[index].model.toString(),
                  //                 items[index].anneeAcquisition.toString()
                  //             );
                  //           },
                  //         ),
                  //     ),
                ],
              );
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      )
    );
  }

}