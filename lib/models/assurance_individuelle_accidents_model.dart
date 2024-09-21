class AssuranceIndividuelleAccidents {
  final int? id;
  final String? typeClient;
  final String? nom;
  final String? tel;
  final String? wtsp;
  final String? email;
  final String? fonction;
  final double? capitalDeces;
  final double? capitalInvaliditePermanente;
  final double? montantFraisMedicaux;
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

  const AssuranceIndividuelleAccidents({
    this.id,
    this.typeClient,
    this.nom,
    this.tel,
    this.wtsp,
    this.email,
    this.fonction,
    this.capitalDeces,
    this.capitalInvaliditePermanente,
    this.montantFraisMedicaux,
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

  factory AssuranceIndividuelleAccidents.fromJson(Map<String, dynamic> json) {
    return AssuranceIndividuelleAccidents(
      id: json['id'] as int?,
      typeClient: json['type_client'] as String?,
      nom: json['nom'] as String?,
      tel: json['tel'] as String?,
      wtsp: json['wtsp'] as String?,
      email: json['email'] as String?,
      fonction: json['fonction'] as String?,
      capitalDeces: (json['capital_deces'] as num?)?.toDouble(),
      capitalInvaliditePermanente: (json['capital_invalidite_permanente'] as num?)?.toDouble(),
      montantFraisMedicaux: (json['montant_frais_medicaux'] as num?)?.toDouble(),
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
