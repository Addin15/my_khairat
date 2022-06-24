class Claim {
  String? id;
  String? claimid;
  String? mosqueid;
  String? claimername;
  String? claimeric;
  String? claimerurl;
  String? status;

  Claim(
      {this.id,
      this.claimid,
      this.mosqueid,
      this.claimeric,
      this.claimername,
      this.claimerurl,
      this.status});

  factory Claim.fromMap(Map<String, dynamic> map) => Claim(
        id: map['id'].toString(),
        claimid: map['claim_id'].toString(),
        mosqueid: map['mosque_id'].toString(),
        claimeric: map['claimer_ic'],
        claimername: map['claimer_name'],
        claimerurl: map['claimer_url'],
        status: map['status'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'claim_id': claimid,
        'mosque_id': mosqueid,
        'claimer_name': claimername,
        'claimer_ic': claimeric,
        'claimer_url': claimerurl,
        'status': status,
      };
}
