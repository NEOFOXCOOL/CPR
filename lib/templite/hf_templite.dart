import 'dart:ui';

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
      body: FutureBuilder(
        future: jsonServices(),
        builder: (context, data){
          if(data.hasError){
            return Center(child: Text("${data.error}"),);
          }
          else if(data.hasData){
            var _items = data.data as List<PRHF>;
            return ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context,index) {
                  return Card(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                              "${_items[index].model}",
                          style: TextStyle(
                            fontFamily: 'cocogoose_classic_extrabold',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            fontStyle: FontStyle.normal
                          ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "${_items[index].description}",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'cocogoose_classic_extrabold',

                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                    }
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

}