class AssuranceSante {
  final int? id;
  final String? typeClient;
  final String? prenom;
  final String? tel;
  final String? wtsp;
  final String? email;
  final String? nomBeneficiaire;
  final String? dateNaissance;
  final String? numSecuriteSocial;
  final String? adresse;
  final String? typeCouvert;
  final String? optionCouvert;
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

  const AssuranceSante({
    this.id,
    this.typeClient,
    this.prenom,
    this.tel,
    this.wtsp,
    this.email,
    this.nomBeneficiaire,
    this.dateNaissance,
    this.numSecuriteSocial,
    this.adresse,
    this.typeCouvert,
    this.optionCouvert,
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

  factory AssuranceSante.fromJson(Map<String, dynamic> json) {
    return AssuranceSante(
      id: json['id'] as int?,
      typeClient: json['type_client'] as String?,
      prenom: json['prenom'] as String?,
      tel: json['tel'] as String?,
      wtsp: json['wtsp'] as String?,
      email: json['email'] as String?,
      nomBeneficiaire: json['nom_beneficiaire'] as String?,
      dateNaissance: json['date_naissance'] as String?,
      numSecuriteSocial: json['num_securite_social'] as String?,
      adresse: json['adresse'] as String?,
      typeCouvert: json['type_couvert'] as String?,
      optionCouvert: json['option_couvert'] as String?,
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
