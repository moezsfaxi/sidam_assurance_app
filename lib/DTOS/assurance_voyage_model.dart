class AssuranceVoyage {
  final int? id;
  final String? nomVoyageur;
  final String? dateNaissance;
  final String? numPass;
  final String? adresse;
  final String? tel;
  final String? wtsp;
  final String? email;
  final String? destination;
  final String? dateDepart;
  final String? dateRetour;
  final int? dureeVoyage;
  final String? motifVoyage;
  final String? typeCouvert;
  final double? montantTotal;
  final String? conditionMedical;
  final String? createdAt;
  final String? createdBy;
  final String? qualification;
  final String? pieceJointe;
  final String? description;
  final String? validatedBy;
  final String? insertedBy;
  final String? optionPaie;
  final String? datePaie;
  final String? datePaieProch;
  final String? paiement;
  final String? etatPaie;
  final double? tranchePaye;
  final String? causeRejet;
  final String? dateDebutCouvert;
  final String? dateFinCouvert;
  final String? modePaie;
  final String? authPrev;
  final double? premierPaiement;
  final bool? activCouvert;

  const AssuranceVoyage({
    this.id,
    this.nomVoyageur,
    this.dateNaissance,
    this.numPass,
    this.adresse,
    this.tel,
    this.wtsp,
    this.email,
    this.destination,
    this.dateDepart,
    this.dateRetour,
    this.dureeVoyage,
    this.motifVoyage,
    this.typeCouvert,
    this.montantTotal,
    this.conditionMedical,
    this.createdAt,
    this.createdBy,
    this.qualification,
    this.pieceJointe,
    this.description,
    this.validatedBy,
    this.insertedBy,
    this.optionPaie,
    this.datePaie,
    this.datePaieProch,
    this.paiement,
    this.etatPaie,
    this.tranchePaye,
    this.causeRejet,
    this.dateDebutCouvert,
    this.dateFinCouvert,
    this.modePaie,
    this.authPrev,
    this.premierPaiement,
    this.activCouvert,
  });

  factory AssuranceVoyage.fromJson(Map<String, dynamic> json) {
    return AssuranceVoyage(
      id: json['id'] as int?,
      nomVoyageur: json['nom_voyageur'] as String?,
      dateNaissance: json['date_naissance'] as String?,
      numPass: json['num_pass'] as String?,
      adresse: json['adresse'] as String?,
      tel: json['tel'] as String?,
      wtsp: json['wtsp'] as String?,
      email: json['email'] as String?,
      destination: json['destination'] as String?,
      dateDepart: json['date_depart'] as String?,
      dateRetour: json['date_retour'] as String?,
      dureeVoyage: json['duree_voyage'] as int?,
      motifVoyage: json['motif_voyage'] as String?,
      typeCouvert: json['type_couvert'] as String?,
      montantTotal: (json['montant_total'] as num?)?.toDouble(),
      conditionMedical: json['condition_medical'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      qualification: json['qualification'] as String?,
      pieceJointe: json['piece_jointe'] as String?,
      description: json['description'] as String?,
      validatedBy: json['validated_by'] as String?,
      insertedBy: json['inserted_by'] as String?,
      optionPaie: json['option_paie'] as String?,
      datePaie: json['date_paie'] as String?,
      datePaieProch: json['date_paie_proch'] as String?,
      paiement: json['paiement'] as String?,
      etatPaie: json['etat_paie'] as String?,
      tranchePaye: (json['tranche_paye'] as num?)?.toDouble(),
      causeRejet: json['cause_rejet'] as String?,
      dateDebutCouvert: json['date_debut_couvert'] as String?,
      dateFinCouvert: json['date_fin_couvert'] as String?,
      modePaie: json['mode_paie'] as String?,
      authPrev: json['auth_prev'] as String?,
      premierPaiement: (json['premier_paiement'] as num?)?.toDouble(),
      activCouvert: json['activ_couvert'] as bool?,
    );
  }
}
