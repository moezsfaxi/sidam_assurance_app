class AssuranceMultirisqueHabitation {
  final int? id;
  final String? typeClient;
  final String? tel;
  final String? wtsp;
  final String? adresse;
  final String? email;
  final String? locataireProprietaire;
  final String? occupant;
  final double? valeurLoyerMensuel;
  final double? valeurImmeuble;
  final double? valeurContenu;
  final double? valeurDegatEau;
  final double? valeurVol;
  final double? valeurBrisGlaces;
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

  const AssuranceMultirisqueHabitation({
    this.id,
    this.typeClient,
    this.tel,
    this.wtsp,
    this.adresse,
    this.email,
    this.locataireProprietaire,
    this.occupant,
    this.valeurLoyerMensuel,
    this.valeurImmeuble,
    this.valeurContenu,
    this.valeurDegatEau,
    this.valeurVol,
    this.valeurBrisGlaces,
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

  factory AssuranceMultirisqueHabitation.fromJson(Map<String, dynamic> json) {
    return AssuranceMultirisqueHabitation(
      id: json['id'] as int?,
      typeClient: json['type_client'] as String?,
      tel: json['tel'] as String?,
      wtsp: json['wtsp'] as String?,
      adresse: json['adresse'] as String?,
      email: json['email'] as String?,
      locataireProprietaire: json['locataire_proprietaire'] as String?,
      occupant: json['occupant'] as String?,
      valeurLoyerMensuel: (json['valeur_loyer_mensuel'] as num?)?.toDouble(),
      valeurImmeuble: (json['valeur_immeuble'] as num?)?.toDouble(),
      valeurContenu: (json['valeur_contenu'] as num?)?.toDouble(),
      valeurDegatEau: (json['valeur_degat_eau'] as num?)?.toDouble(),
      valeurVol: (json['valeur_vol'] as num?)?.toDouble(),
      valeurBrisGlaces: (json['valeur_bris_glaces'] as num?)?.toDouble(),
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
