import 'package:catalogue_postes_radio/templite/Paragraph.dart';
import 'package:flutter/material.dart';
import '../appicons_icons.dart';
import '../poste_radio_hf.dart';
import 'Colors.dart';

class Catalogue extends StatefulWidget {
  final PRHF prhf;
  const Catalogue(this.prhf,{super.key});

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Expanded(
           flex: 3,
             child:
             Container(
               decoration: const BoxDecoration(
                 gradient: LinearGradient(
                     begin: Alignment.bottomRight,
                     end: Alignment.topLeft,
                     colors: [
                       PaletteColors.TherdColor,
                       PaletteColors.FortColor
                     ]
                 ),
               ),
               child: Column(
                 children: [
                   const SizedBox(height: 20,),
                   // Appbar
                   Expanded(
                     flex: 1,
                     child: Row(
                     children: [
                       Expanded(
                         flex: 1,
                         child: IconButton(
                           onPressed: (){},
                           color: Colors.white,
                           icon: const Icon(Appicons.arrow_back),
                         ),
                       ),
                       Expanded(
                           flex: 4,
                           child: Container())
                     ],
                   ),),
                   Expanded(
                       flex: 3,
                         child:  Padding(
                           padding: const EdgeInsets.all(20),
                           child: ListView(
                             shrinkWrap: true,
                             scrollDirection: Axis.horizontal,
                             children: [
                               Container(
                                 decoration: BoxDecoration(
                                     color: PaletteColors.Bagckround,
                                     borderRadius: BorderRadius.circular(10)
                                 ),
                                 width: 100,
                               ),
                             ],
                           ),
                         )
                   ),
                   // TEXT
                   Expanded(
                     flex: 1,
                       child: Row(
                         children: [
                           Expanded(
                             flex: 1,
                                 child:  Center(
                                   child: Text(
                                     widget.prhf.model.toString().toUpperCase(),
                                     style: const TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.bold,
                                       color: PaletteColors.Bagckround,
                                     ),
                                   ),
                                 ),
                           ),
                           Expanded(
                             flex: 1,
                                 child:  Center(
                                   child: Text(
                                     widget.prhf.anneeAcquisition.toString().toUpperCase(),
                                     style: const TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w100,
                                       color: PaletteColors.Bagckround,
                                     ),
                                   ),
                                 ),
                           ),
                         ],
                       ),
                   ),
                 ],
               ),
             ),
         ),

          // Body
          Expanded(
           flex: 3,
             child:
             Container(
               decoration: const BoxDecoration(
                 gradient: LinearGradient(
                     begin: Alignment.bottomRight,
                     end: Alignment.topLeft,
                     colors: [
                       PaletteColors.PrimaryColor,
                       PaletteColors.SecondryColor
                     ]
                 ),
               ),
               child: ListView(
                 scrollDirection: Axis.vertical,
                 children: [
                   Paragraph("description", widget.prhf.description.toString()),
                   Paragraph("nationalite", widget.prhf.nationalite.toString()),
                   Paragraph("securite",widget.prhf.securite.toString() ),
                   Paragraph("gammeFrequence", widget.prhf.gammeFrequence.toString()),
                   Paragraph("modeUtilisation", widget.prhf.modeUtilisation.toString()),
                   Paragraph("modeTravail", widget.prhf.modeTravail.toString()),
                   Paragraph("donnees", widget.prhf.donnees.toString()),
                   Paragraph("puissance", widget.prhf.puissance.toString()),
                   Paragraph("espacementCanaux", widget.prhf.espacementCanaux.toString()),
                   Paragraph("nombrecanaux", widget.prhf.nombrecanaux.toString()),
                   Paragraph("modulation", widget.prhf.modulation.toString()),
                   Paragraph("Alimantation", widget.prhf.alimantation.toString()),
                   Paragraph("antenne", widget.prhf.antenne.toString()),
                 ],
               ),
             ),
         )
        ],
      ),
    );
  }
}
