class AssuranceAuto {
  final int? id ;
  final String? typeClient;
  final String? nom;
  final String? dateNaissance;
  final String? raisonSociale;
  final String? tel;
  final String? wtsp;
  final String? email;
  final String? typeVehicule;
  final int? nombrePlace;
  final double? puissance;
  final double? chargeUtile;
  final String? marque;
  final String? modele;
  final String? adresse;
  final String? typeCarburant;
  final String? immatriculation;
  final String? datePremiereMiseEnCirculation;
  final double? valeurANeuf;
  final double? valeurVenale;
  final String? dateEffet;
  final int? dureeCouvert;
  final String? dateEcheance;
  final String? createdAt;
  final String? createdBy;
  final String? qualification;
  final String? pieceJointe;
  final String? description;
  final String? contrat;
  final String? paiement;
  final String? validatedBy;
  final String? insertedBy;
  final String? optionPaie;
  final String? datePaie;
  final String? datePaieProch;
  final String? etatPaie;
  final double? tranchePaye;
  final String? causeRejet;
  final String? dateDebutCouvert;
  final String? dateFinCouvert;
  final String? modePaie;
  final String? authPrev;
  final double? montantTotal;
  final double? premierPaiement;
  final bool? activCouvert;

  const AssuranceAuto({
    this.id,
    this.typeClient,
    this.nom,
    this.dateNaissance,
    this.raisonSociale,
    this.tel,
    this.wtsp,
    this.email,
    this.typeVehicule,
    this.nombrePlace,
    this.puissance,
    this.chargeUtile,
    this.marque,
    this.modele,
    this.adresse,
    this.typeCarburant,
    this.immatriculation,
    this.datePremiereMiseEnCirculation,
    this.valeurANeuf,
    this.valeurVenale,
    this.dateEffet,
    this.dureeCouvert,
    this.dateEcheance,
    this.createdAt,
    this.createdBy,
    this.qualification,
    this.pieceJointe,
    this.description,
    this.contrat,
    this.paiement,
    this.validatedBy,
    this.insertedBy,
    this.optionPaie,
    this.datePaie,
    this.datePaieProch,
    this.etatPaie,
    this.tranchePaye,
    this.causeRejet,
    this.dateDebutCouvert,
    this.dateFinCouvert,
    this.modePaie,
    this.authPrev,
    this.montantTotal,
    this.premierPaiement,
    this.activCouvert,
  });

  factory AssuranceAuto.fromJson(Map<String, dynamic> json) {
    return AssuranceAuto(
      id:json['nombre_place'] as int? ,
      typeClient: json['type_client'] as String?,
      nom: json['nom'] as String?,
      dateNaissance: json['date_naissance'] as String?,
      raisonSociale: json['raison sociale'] as String?,
      tel: json['tel'] as String?,
      wtsp: json['wtsp'] as String?,
      email: json['email'] as String?,
      typeVehicule: json['type_vehicule'] as String?,
      nombrePlace: json['nombre_place'] as int?,
      puissance: (json['puissance'] as num?)?.toDouble(),
      chargeUtile: (json['charge_utile'] as num?)?.toDouble(),
      marque: json['marque'] as String?,
      modele: json['modele'] as String?,
      adresse: json['adresse'] as String?,
      typeCarburant: json['type_carburant'] as String?,
      immatriculation: json['immatriculation'] as String?,
      datePremiereMiseEnCirculation: json['date_premiere_mise_en_circulation'] as String?,
      valeurANeuf: (json['valeur_a_neuf'] as num?)?.toDouble(),
      valeurVenale: (json['valeur_venale'] as num?)?.toDouble(),
      dateEffet: json['date_effet'] as String?,
      dureeCouvert: json['duree_couvert'] as int?,
      dateEcheance: json['date_echeance'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      qualification: json['qualification'] as String?,
      pieceJointe: json['piece_jointe'] as String?,
      description: json['description'] as String?,
      contrat: json['contrat'] as String?,
      paiement: json['paiement'] as String?,
      validatedBy: json['validated_by'] as String?,
      insertedBy: json['inserted_by'] as String?,
      optionPaie: json['option_paie'] as String?,
      datePaie: json['date_paie'] as String?,
      datePaieProch: json['date_paie_proch'] as String?,
      etatPaie: json['etat_paie'] as String?,
      tranchePaye: (json['tranche_paye'] as num?)?.toDouble(),
      causeRejet: json['cause_rejet'] as String?,
      dateDebutCouvert: json['date_debut_couvert'] as String?,
      dateFinCouvert: json['date_fin_couvert'] as String?,
      modePaie: json['mode_paie'] as String?,
      authPrev: json['auth_prev'] as String?,
      montantTotal: (json['montant_total'] as num?)?.toDouble(),
      premierPaiement: (json['premier_paiement'] as num?)?.toDouble(),
      activCouvert: json['activ_couvert'] as bool?,
    );
  }
}
