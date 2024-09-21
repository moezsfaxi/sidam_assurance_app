class AssuranceRisqueAgricole {
  final int? id;
  final String? nomAgri;
  final String? typeExp;
  final String? siretSiren;
  final String? adresse;
  final String? tel;
  final String? wtsp;
  final String? email;
  final double? superficie;
  final String? typeCulture;
  final double? valEquipementAgri;
  final String? typeCouvert;
  final double? valBatimentAgri;
  final String? dateDebutCouvert;
  final String? dateFinCouvert;
  final String? modePaie;
  final String? dateEcheance;
  final String? createdAt;
  final String? createdBy;
  final String? qualification;
  final String? pieceJointe;
  final String? description;
  final bool? nonPaye;
  final String? paiement;
  final String? validatedBy;
  final String? insertedBy;
  final String? optionPaie;
  final String? datePaie;
  final String? datePaieProch;
  final String? etatPaie;
  final double? tranchePaye;
  final String? causeRejet;
  final String? authPrev;
  final bool? activCouvert;
  final double? montantTotal;
  final double? premierPaiement;
  final double? montantTotalPaye;

  const AssuranceRisqueAgricole({
    this.id,
    this.nomAgri,
    this.typeExp,
    this.siretSiren,
    this.adresse,
    this.tel,
    this.wtsp,
    this.email,
    this.superficie,
    this.typeCulture,
    this.valEquipementAgri,
    this.typeCouvert,
    this.valBatimentAgri,
    this.dateDebutCouvert,
    this.dateFinCouvert,
    this.modePaie,
    this.dateEcheance,
    this.createdAt,
    this.createdBy,
    this.qualification,
    this.pieceJointe,
    this.description,
    this.nonPaye,
    this.paiement,
    this.validatedBy,
    this.insertedBy,
    this.optionPaie,
    this.datePaie,
    this.datePaieProch,
    this.etatPaie,
    this.tranchePaye,
    this.causeRejet,
    this.authPrev,
    this.activCouvert,
    this.montantTotal,
    this.premierPaiement,
    this.montantTotalPaye,
  });

  factory AssuranceRisqueAgricole.fromJson(Map<String, dynamic> json) {
    return AssuranceRisqueAgricole(
      id: json['id'] as int?,
      nomAgri: json['nom_agri'] as String?,
      typeExp: json['type_exp'] as String?,
      siretSiren: json['SIRET_SIREN'] as String?,
      adresse: json['adresse'] as String?,
      tel: json['tel'] as String?,
      wtsp: json['wtsp'] as String?,
      email: json['email'] as String?,
      superficie: (json['superficie'] as num?)?.toDouble(),
      typeCulture: json['type_culture'] as String?,
      valEquipementAgri: (json['val_equipement_agri'] as num?)?.toDouble(),
      typeCouvert: json['type_couvert'] as String?,
      valBatimentAgri: (json['val_batiment_agri'] as num?)?.toDouble(),
      dateDebutCouvert: json['date_debut_couvert'] as String?,
      dateFinCouvert: json['date_fin_couvert'] as String?,
      modePaie: json['mode_paie'] as String?,
      dateEcheance: json['date_echeance'] as String?,
      createdAt: json['created_at'] as String?,
      createdBy: json['created_by'] as String?,
      qualification: json['qualification'] as String?,
      pieceJointe: json['piece_jointe'] as String?,
      description: json['description'] as String?,
      nonPaye: json['non_paye'] as bool?,
      paiement: json['paiement'] as String?,
      validatedBy: json['validated_by'] as String?,
      insertedBy: json['inserted_by'] as String?,
      optionPaie: json['option_paie'] as String?,
      datePaie: json['date_paie'] as String?,
      datePaieProch: json['date_paie_proch'] as String?,
      etatPaie: json['etat_paie'] as String?,
      tranchePaye: (json['tranche_paye'] as num?)?.toDouble(),
      causeRejet: json['cause_rejet'] as String?,
      authPrev: json['auth_prev'] as String?,
      activCouvert: json['activ_couvert'] as bool?,
      montantTotal: (json['montant_total'] as num?)?.toDouble(),
      premierPaiement: (json['premier_paiement'] as num?)?.toDouble(),
      montantTotalPaye: (json['montant_total_paye'] as num?)?.toDouble(),
    );
  }
}
