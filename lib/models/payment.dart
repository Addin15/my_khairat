class Payment {
  String? id;
  String? payerID;
  String? proveURL;
  String? status;
  String? date;

  Payment({
    this.id,
    this.payerID,
    this.proveURL,
    this.status,
    this.date,
  });

  factory Payment.fromMap(Map<String, dynamic> map) => Payment(
        id: map['id'].toString(),
        payerID: map['payer_id'].toString(),
        proveURL: map['prove_url'],
        status: map['status'],
        date: map['created_at'],
      );

  Map<String, String> toMap() => {
        'id': id.toString(),
        'payer_id': payerID.toString(),
        'prove_url': proveURL.toString(),
        'status': status.toString(),
        'date': date.toString(),
      };
}
