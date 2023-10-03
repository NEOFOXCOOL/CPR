import 'package:catalogue_postes_radio/Services/hf_data_hundler.dart';
import 'package:catalogue_postes_radio/appicons_icons.dart';
import 'package:flutter/material.dart';
import '../poste_radio_hf.dart';

class HfTemplite extends StatefulWidget {
  const HfTemplite({super.key});
  @override
  State<HfTemplite> createState() => _HfTemplite();
}

class _HfTemplite extends State<HfTemplite> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          color: Colors.black54,
          icon: Icon(Appicons.arrow_back),
        ),
        title: const Text(
          "HF",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'robotobold',
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
      child: FutureBuilder(
        future: jsonServices(),
        builder: (context, data){
          if(data.hasError){
            return Center(child: Text("${data.error}"),);
          }
          else if(data.hasData){
            var items = data.data as List<PRHF>;
            return Column(
                  children: [
                  Expanded(
                    flex: 1,
                           child: Container(
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: AssetImage("assets/hf_header_image.png"),
                                 fit: BoxFit.cover
                               ),
                             ),
                           ),
                      ),

                  const Divider(height: 20),

                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 100,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 3/5
                            ),
                            itemCount: items.length,
                            itemBuilder: (context,index){
                                return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1.0,
                                          blurRadius: 0.5,
                                          offset: const Offset(0,1),
                                        ),
                                      ],
                                    ),
                                        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                        flex: 5,
                                                        child: Image.asset(
                                                            "assets/hf_er_codan_sentry_h_1.png",
                                                            height: 100,width: 150,
                                                          ),
                                                        ),
                                                    const Divider(height: 10,),
                                                    Expanded(
                                                    flex: 2,
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        SizedBox(width: 5,),
                                                          Expanded(
                                                            child:
                                                               Text(
                                                              "${items[index].model}",
                                                              style: const TextStyle(
                                                                color: Colors.black54,
                                                                fontFamily: 'robotobold',
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 8,
                                                              ),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                          ),
                                                           Expanded(
                                                               child: Text(
                                                                  "${items[index].anneeAcquisition}",
                                                                  style: const TextStyle(
                                                                    color: Colors.black54,
                                                                    fontFamily: 'robotobold',
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 12,
                                                                  ),
                                                                  textAlign: TextAlign.center,
                                                                ),),
                                                                  ],
                                                                ),
                                                              ),
                                                     Expanded(
                                                        flex: 1,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                             Expanded(
                                                                  child: IconButton(
                                                                      color: Colors.amber,
                                                                      onPressed: (){},
                                                                        icon: const Icon(Appicons.bookmark_border,size: 15,)),),
                                                              Expanded(
                                                                child: IconButton(
                                                                    color: Colors.amber,
                                                                    onPressed: (){},
                                                                    icon: const Icon(Appicons.error_outline, size: 15,),),
                                                              ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(height: 15,)
                                            ],
                                          ),
                                  ),
                                );
                              },
                            ),
                      ),)
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