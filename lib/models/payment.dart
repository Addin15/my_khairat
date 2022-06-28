class Payment {
  String? id;
  String? payerID;
  String? mosqueID;
  String? proveURL;
  String? status;
  String? date;

  Payment({
    this.id,
    this.mosqueID,
    this.payerID,
    this.proveURL,
    this.status,
    this.date,
  });

  factory Payment.fromMap(Map<String, dynamic> map) => Payment(
        id: map['id'].toString(),
        payerID: map['payer_id'].toString(),
        mosqueID: map['mosque_id'].toString(),
        proveURL: map['prove_url'],
        status: map['status'],
        date: map['created_at'],
      );

  Map<String, String> toMap() => {
        'id': id.toString(),
        'payer_id': payerID.toString(),
        'mosque_id': mosqueID.toString(),
        'prove_url': proveURL.toString(),
        'status': status.toString(),
        'date': date.toString(),
      };
}
