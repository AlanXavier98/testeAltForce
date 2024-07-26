class UserModel {
  String name;
  int age;
  String email;
  String address;
  String? photoUrl; // Pode ser nulo se não houver foto
  bool hasCreditCard;
  String? cardNumber; // Número do cartão
  String? cardExpiry; // Data de validade do cartão
  String? cardCVV; // Código de segurança do cartão

  UserModel({
    required this.name,
    required this.age,
    required this.email,
    required this.address,
    this.photoUrl,
    this.hasCreditCard = false,
    this.cardNumber,
    this.cardExpiry,
    this.cardCVV,
  });

  // Adicionando o método copyWith
  UserModel copyWith({
    String? name,
    int? age,
    String? email,
    String? address,
    String? photoUrl,
    bool? hasCreditCard,
    String? cardNumber,
    String? cardExpiry,
    String? cardCVV,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      address: address ?? this.address,
      photoUrl: photoUrl ?? this.photoUrl,
      hasCreditCard: hasCreditCard ?? this.hasCreditCard,
      cardNumber: cardNumber ?? this.cardNumber,
      cardExpiry: cardExpiry ?? this.cardExpiry,
      cardCVV: cardCVV ?? this.cardCVV,
    );
  }
}
