class AssuranceMultirisqueProfessionnelle {
  final int? id;
  final String? nomEntreprise;
  final String? typeActivite;
  final String? siretSiren;
  final String? adresse;
  final String? tel;
  final String? wtsp;
  final String? email;
  final String? nomResp;
  final int? nbrEmp;
  final double? chiffreAffAnnuel;
  final String? descriptionLocaux;
  final String? typeCouvert;
  final double? valeurBiensAssures;
  final String? dateDebutCouvert;
  final int? dureeCouvert;
  final String? dateEcheance;
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
  final double? tranchePaye;
  final String? etatPaie;
  final String? causeRejet;
  final String? dateFinCouvert;
  final String? modePaie;
  final String? authPrev;
  final double? montantTotal;
  final double? premierPaiement;
  final bool? activCouvert;

  const AssuranceMultirisqueProfessionnelle({
    this.id,
    this.nomEntreprise,
    this.typeActivite,
    this.siretSiren,
    this.adresse,
    this.tel,
    this.wtsp,
    this.email,
    this.nomResp,
    this.nbrEmp,
    this.chiffreAffAnnuel,
    this.descriptionLocaux,
    this.typeCouvert,
    this.valeurBiensAssures,
    this.dateDebutCouvert,
    this.dureeCouvert,
    this.dateEcheance,
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
    this.tranchePaye,
    this.etatPaie,
    this.causeRejet,
    this.dateFinCouvert,
    this.modePaie,
    this.authPrev,
    this.montantTotal,
    this.premierPaiement,
    this.activCouvert,
  });

  factory AssuranceMultirisqueProfessionnelle.fromJson(Map<String, dynamic> json) {
    return AssuranceMultirisqueProfessionnelle(
      id: json['id'] as int?,
      nomEntreprise: json['nom_entreprise'] as String?,
      typeActivite: json['type_activite'] as String?,
      siretSiren: json['SIRET_SIREN'] as String?,
      adresse: json['adresse'] as String?,
      tel: json['tel'] as String?,
      wtsp: json['wtsp'] as String?,
      email: json['email'] as String?,
      nomResp: json['nom_resp'] as String?,
      nbrEmp: json['nbr_emp'] as int?,
      chiffreAffAnnuel: (json['chiffre_aff_annuel'] as num?)?.toDouble(),
      descriptionLocaux: json['description_locaux'] as String?,
      typeCouvert: json['type_couvert'] as String?,
      valeurBiensAssures: (json['valeur_biens_assures'] as num?)?.toDouble(),
      dateDebutCouvert: json['date_debut_couvert'] as String?,
      dureeCouvert: json['duree_couvert'] as int?,
      dateEcheance: json['date_echeance'] as String?,
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
      tranchePaye: (json['tranche_paye'] as num?)?.toDouble(),
      etatPaie: json['etat_paie'] as String?,
      causeRejet: json['cause_rejet'] as String?,
      dateFinCouvert: json['date_fin_couvert'] as String?,
      modePaie: json['mode_paie'] as String?,
      authPrev: json['auth_prev'] as String?,
      montantTotal: (json['montant_total'] as num?)?.toDouble(),
      premierPaiement: (json['premier_paiement'] as num?)?.toDouble(),
      activCouvert: json['activ_couvert'] as bool?,
    );
  }
}
