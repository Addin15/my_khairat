class Claim {
  String? claim_id;
  String? claimer_name;
  String? claimer_ic;
  String? claimer_village;
  String? claimer_url;
  String? status;

  Claim(
      {this.claim_id,
      this.claimer_ic,
      this.claimer_name,
      this.claimer_url,
      this.claimer_village,
      this.status});

  factory Claim.fromMap(Map<String, dynamic> map) => Claim(
        claim_id: map['claim_id'].toString(),
        claimer_ic: map['claimer_ic'],
        claimer_name: map['claimer_name'],
        claimer_url: map['claimer_url'],
        status: map['status'],
      );

  Map<String, dynamic> toMap() => {
        'claim_id': claim_id,
        'claimer_name': claimer_name,
        'claimer_ic': claimer_ic,
        'claimer_village': claimer_village,
        'claimer_url': claimer_url,
        'status': status,
      };
}
