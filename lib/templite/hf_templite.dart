import 'package:catalogue_postes_radio/Services/hf_data_hundler.dart';
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
        title: const Text(
          "HF",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'cocogoose_classic_extrabold',
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: jsonServices(),
        builder: (context, data){
          if(data.hasError){
            return Center(child: Text("${data.error}"),);
          }
          else if(data.hasData){
            var items = data.data as List<PRHF>;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2/3
                ),
              itemCount: items.length,
              itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2.0,
                          blurRadius: 1.5,
                          offset: Offset(0,3),
                        ),
                      ],
                    ),
                    height: 150,
                    width: 100,
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset("assets/hf_er_codan_sentry_h_1.png"),
                        ),
                        SizedBox(height: 10.0,),
                        Text("${items[index].model}"),
                      ],
                    ),
                    ),
                  );
              },
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