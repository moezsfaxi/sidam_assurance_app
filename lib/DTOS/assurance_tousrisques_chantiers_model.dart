class AssuranceTousRisquesChantiers {
  final int? id;
  final String? nomProjet;
  final String? typeChantier;
  final String? numPermisConst;
  final String? adresse;
  final String? telResp;
  final String? emailResp;
  final String? nomEntrepreneur;
  final double? valTotalProjet;
  final String? descriptionTravaux;
  final String? dateDebutTravaux;
  final String? datePrevueAchevement;
  final String? typeCouvert;
  final double? valEquipements;
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
  final double? montantTotal;
  final double? premierPaiement;
  final bool? activCouvert;

  const AssuranceTousRisquesChantiers({
    this.id,
    this.nomProjet,
    this.typeChantier,
    this.numPermisConst,
    this.adresse,
    this.telResp,
    this.emailResp,
    this.nomEntrepreneur,
    this.valTotalProjet,
    this.descriptionTravaux,
    this.dateDebutTravaux,
    this.datePrevueAchevement,
    this.typeCouvert,
    this.valEquipements,
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
    this.montantTotal,
    this.premierPaiement,
    this.activCouvert,
  });

  factory AssuranceTousRisquesChantiers.fromJson(Map<String, dynamic> json) {
    return AssuranceTousRisquesChantiers(
      id: json['id'] as int?,
      nomProjet: json['nom_projet'] as String?,
      typeChantier: json['type_chantier'] as String?,
      numPermisConst: json['num_permis_const'] as String?,
      adresse: json['adresse'] as String?,
      telResp: json['tel_resp'] as String?,
      emailResp: json['email_resp'] as String?,
      nomEntrepreneur: json['nom_entrepreneur'] as String?,
      valTotalProjet: (json['val_total_projet'] as num?)?.toDouble(),
      descriptionTravaux: json['description_travaux'] as String?,
      dateDebutTravaux: json['date_debut_travaux'] as String?,
      datePrevueAchevement: json['date_prevue_achevement'] as String?,
      typeCouvert: json['type_couvert'] as String?,
      valEquipements: (json['val_equipements'] as num?)?.toDouble(),
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
      montantTotal: (json['montant_total'] as num?)?.toDouble(),
      premierPaiement: (json['premier_paiement'] as num?)?.toDouble(),
      activCouvert: json['activ_couvert'] as bool?,
    );
  }
}
