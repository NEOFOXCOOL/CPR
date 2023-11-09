
class HF{
  String? model;
  var images;
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

  HF(
    {
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
    }
  );

  HF.fromJson(Map<String,dynamic> json){
    model = json["model"];
    images = json["images"];
    nationalite = json["nationalite"];
    securite = json["securite"];
    gammeFrequence = json["gammeFrequence"];
    modeTravail = json["modeTravail"];
    donnees = json["donnees"];
    puissance = json["puissance"];
    espacementCanaux = json["espacementCanaux"];
    nombrecanaux = json["nombrecanaux"];
    modulation = json["modulation"];
    alimantation = json["alimantation"];
    antenne = json["antenne"];
    anneeAcquisition = json["anneeAcquisition"];
    description = json["description"];
    modeUtilisation = json["modeUtilisation"];
  }
}