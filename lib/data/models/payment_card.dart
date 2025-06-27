class PaymentCard {
  final String id;
  final String holderName;
  final String cardNumber;
  final String expireDate;
  final String cvv;

  PaymentCard({
    required this.id,
    required this.holderName,
    required this.cardNumber,
    required this.expireDate,
    required this.cvv,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'holderName': holderName,
      'cardNumber': cardNumber,
      'expireDate': expireDate,
      'cvv': cvv,
    };
  }

  factory PaymentCard.fromJson(Map<String, dynamic> json) {
    return PaymentCard(
      id: json['id'] ?? '',
      holderName: json['holderName'] ?? '',
      cardNumber: json['cardNumber'] ?? '',
      expireDate: json['expireDate'] ?? '',
      cvv: json['cvv'] ?? '',
    );
  }

  PaymentCard copyWith({
    String? id,
    String? holderName,
    String? cardNumber,
    String? expireDate,
    String? cvv,
  }) {
    return PaymentCard(
      id: id ?? this.id,
      holderName: holderName ?? this.holderName,
      cardNumber: cardNumber ?? this.cardNumber,
      expireDate: expireDate ?? this.expireDate,
      cvv: cvv ?? this.cvv,
    );
  }
}

