class AssuranceRecord {
 
  final String? paiement;
  final String? montantTotal;
  final String? type_assurance;
  
 

  const AssuranceRecord({
 
    this.paiement,
    this.montantTotal,
    this.type_assurance

  });

  factory AssuranceRecord.fromJson(Map<String, dynamic> json) {
    return AssuranceRecord(
     
      paiement: json['premier_paiement'] as String?,
      montantTotal: json['montant_total'] as String?,
      type_assurance: json['type_assurance'] as String?
    
    );
  }
}
