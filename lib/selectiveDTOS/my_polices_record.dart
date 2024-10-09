class AssuranceRecord {
  final int? id;
  final String? paiement;
  final String? montantTotal;
  final String? type_assurance;
  final String? date_debut_couvert;
  final String? date_fin_couvert;
  
 

  const AssuranceRecord({

    this.id,
    this.paiement,
    this.montantTotal,
    this.type_assurance,
    this.date_debut_couvert,
    this.date_fin_couvert

  });

  factory AssuranceRecord.fromJson(Map<String, dynamic> json) {
    return AssuranceRecord(
      id :json['id'] as int?,  
      paiement: json['premier_paiement'] as String?,
      montantTotal: json['montant_total'] as String?,
      type_assurance: json['type_assurance'] as String?,
      date_fin_couvert:json['date_fin_couvert'] as String?,
      date_debut_couvert:json['date_debut_couvert'] as String?

    
    );
  }
}
