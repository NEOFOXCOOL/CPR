
class PRHF{
  String? model;
  String? images;
  String? nationalite;
  String? securite;
  String? gammeFrequence;
  String? modeTravail;
  String? donnees;
  String? puissance;
  String? espacementCanaux;
  String? nombrecanaux;
  String? modulation;
  String? alimantation;
  String? antenne;
  String? anneeAcquisition;
  String? description;
  String? modeUtilisation;

  PRHF({
    this.model,
    this.images,
    this.nationalite,
    this.securite,
    this.gammeFrequence,
    this.modeTravail,
    this.modeUtilisation,
    this.donnees,
    this.puissance,
    this.espacementCanaux,
    this.nombrecanaux,
    this.modulation,
    this.alimantation,
    this.antenne,
    this.anneeAcquisition,
    this.description
  });

   PRHF.fromJson(Map<String,dynamic> json){
     model = json['model'];
     images = json ['images'];
     nationalite = json ['nationalite'];
     securite = json ['securite'];
     gammeFrequence = json ['gammeFrequence'];
     modeTravail = json ['modeTravail'];
     modeUtilisation = json ['modeUtilisation'];
     donnees = json ['donnees'];
     puissance = json ['puissance'];
     espacementCanaux = json ['espacementCanaux'];
     nombrecanaux = json ['nombrecanaux'];
     modulation = json ['modulation'];
     alimantation = json ['Alimantation'];
     antenne = json ['antenne'];
     anneeAcquisition = json ['anneeAcquisition'];
     description = json ['description'];
   }

}