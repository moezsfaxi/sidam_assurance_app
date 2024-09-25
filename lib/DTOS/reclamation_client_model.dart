class ReclamationClient {
  final int? id;
  final String? numReclamation;
  final String? dateReclamation;
  final String? nomClient;
  final String? typeAssurance;
  final String? typeReclamation;
  final String? descriptionReclamation;
  final double? montantReclame;
  final String? statutReclamation;
  final String? dateMaj;
  final String? treatedBy;
  final String? actionEntreprise;
  final String? documentsFournis;
  final String? commentairesAgent;
  final String? tempsResolution;
  final double? montantAccorde;
  final String? motifRejet;
  final String? canalReception;
  final String? dateCloture;
  final String? satisfactionClient;

  const ReclamationClient({
    this.id,
    this.numReclamation,
    this.dateReclamation,
    this.nomClient,
    this.typeAssurance,
    this.typeReclamation,
    this.descriptionReclamation,
    this.montantReclame,
    this.statutReclamation,
    this.dateMaj,
    this.treatedBy,
    this.actionEntreprise,
    this.documentsFournis,
    this.commentairesAgent,
    this.tempsResolution,
    this.montantAccorde,
    this.motifRejet,
    this.canalReception,
    this.dateCloture,
    this.satisfactionClient,
  });

  factory ReclamationClient.fromJson(Map<String, dynamic> json) {
    return ReclamationClient(
      id: json['id'] as int?,
      numReclamation: json['num_reclamation'] as String?,
      dateReclamation: json['date_reclamation'] as String?,
      nomClient: json['nom_client'] as String?,
      typeAssurance: json['type_assurance'] as String?,
      typeReclamation: json['type_reclamation'] as String?,
      descriptionReclamation: json['description_reclamation'] as String?,
      montantReclame: (json['montant_reclame'] as num?)?.toDouble(),
      statutReclamation: json['statut_reclamation'] as String?,
      dateMaj: json['date_maj'] as String?,
      treatedBy: json['treated_by'] as String?,
      actionEntreprise: json['action_entreprise'] as String?,
      documentsFournis: json['documents_fournis'] as String?,
      commentairesAgent: json['commentaires_agent'] as String?,
      tempsResolution: json['temps_resolution'] as String?,
      montantAccorde: (json['montant_accorde'] as num?)?.toDouble(),
      motifRejet: json['motif_rejet'] as String?,
      canalReception: json['canal_reception'] as String?,
      dateCloture: json['date_cloture'] as String?,
      satisfactionClient: json['satisfaction_client'] as String?,
    );
  }
}
