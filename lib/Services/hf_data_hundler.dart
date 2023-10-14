
import 'dart:convert';
import 'package:catalogue_postes_radio/poste_radio_hf.dart';
import 'package:flutter/services.dart' as rootBundle;

Future<List<PRHF>> jsonServices() async {
  //read json file
  final jsondata = await rootBundle.rootBundle.loadString('data/fakeData.json');
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => PRHF.fromJson(e)).toList() as List<PRHF>;
}