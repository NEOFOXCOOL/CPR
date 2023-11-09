
import 'dart:convert';
import 'package:catalogue_postes_radio/class/Catigories.dart';
import 'package:flutter/services.dart' as rootBundle;

import '../class/poste_radio_hf.dart';


Future<List<Catigories>> catigoriesDataServices() async {
  //read json file
  final jsondata = await rootBundle.rootBundle.loadString('data/catigories.json');
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => Catigories.fromJson(e)).toList() as List<Catigories>;
}

Future<List<HF>> hfDataServices() async {
  //read json file
  final jsondata = await rootBundle.rootBundle.loadString('data/hfData.json');
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => HF.fromJson(e)).toList() as List<HF>;
}




