class VHFP{

  String model;
  String images;
  String nationalite;
  String gammeFrequence;
  String modeUtilisation;
  String modeTravail;
  String donnees;
  String puissance;
  String espacementCP;
  String nbCanaux;
  String modulation;
  String alimentation;
  String antenne;
  String anneeAcquisition;
  String description;
  String consomation;
  String temperature;
  String securite;

  VHFP({
    required this.model,
    required this.description,
    required this.alimentation,
    required this.anneeAcquisition,
    required this.antenne,
    required this.donnees,
    required this.espacementCP,
    required this.gammeFrequence,
    required this.images,
    required this.modeTravail,
    required this.modeUtilisation,
    required this.modulation,
    required this.nationalite,
    required this.nbCanaux,
    required this.puissance,
    required this.consomation,
    required this.temperature,
    required this.securite
  });
}