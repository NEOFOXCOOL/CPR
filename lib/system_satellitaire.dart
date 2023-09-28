class system_satellitaire{
  int id;
  String model;
  String description;
  List<String> images;
  String dimensions;
  String poid;
  String taux_transfert_donnees;
  String fonctionalites_voix;
  String message_text;
  String frequence_inmarsat;
  String interface_utilisation;
  String langage;
  String certification;
  String interface_explorer_510;

  system_satellitaire({
    required this.id,
    required this.model,
    required this.description,
    required this.images,
    required this.dimensions,
    required this.poid,
    required this.taux_transfert_donnees,
    required this.fonctionalites_voix,
    required this.message_text,
    required this.frequence_inmarsat,
    required this.interface_utilisation,
    required this.langage,
    required this.certification,
    required this.interface_explorer_510
  });

}