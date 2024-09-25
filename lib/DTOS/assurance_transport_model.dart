class AssuranceTransport {
  final int? id;
  final String? nomEntrepriseTransp;
  final String? typeTransport;
  final String? natureMarchandises;
  final String? siretSiren;
  final String? adress;
  final String? tel;
  final String? wtsp;
  final String? email;
  final String? modeTransport;
  final String? dateDebutTransp;
  final int? dureeEstimeeTransp;
  final String? optionCouvert;
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
  final String? dateDebutCouvert;
  final String? dateFinCouvert;
  final String? modePaie;
  final String? authPrev;
  final double? montantTotal;
  final double? premierPaiement;
  final bool? activCouvert;

  const AssuranceTransport({
    this.id,
    this.nomEntrepriseTransp,
    this.typeTransport,
    this.natureMarchandises,
    this.siretSiren,
    this.adress,
    this.tel,
    this.wtsp,
    this.email,
    this.modeTransport,
    this.dateDebutTransp,
    this.dureeEstimeeTransp,
    this.optionCouvert,
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
    this.dateDebutCouvert,
    this.dateFinCouvert,
    this.modePaie,
    this.authPrev,
    this.montantTotal,
    this.premierPaiement,
    this.activCouvert,
  });

  factory AssuranceTransport.fromJson(Map<String, dynamic> json) {
    return AssuranceTransport(
      id: json['id'] as int?,
      nomEntrepriseTransp: json['nom_entreprise_transp'] as String?,
      typeTransport: json['type_transport'] as String?,
      natureMarchandises: json['nature_marchandises'] as String?,
      siretSiren: json['SIRET_SIREN'] as String?,
      adress: json['adress'] as String?,
      tel: json['tel'] as String?,
      wtsp: json['wtsp'] as String?,
      email: json['email'] as String?,
      modeTransport: json['mode_transport'] as String?,
      dateDebutTransp: json['date_debut_transp'] as String?,
      dureeEstimeeTransp: json['duree_estimee_transp'] as int?,
      optionCouvert: json['option_couvert'] as String?,
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
