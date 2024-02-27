class RegisterClientModel {
  String? fullName;
  String? phone;
  String? cpf;
  DateTime? birthDate;
  String? gender;
  bool? termsAccepted;

  RegisterClientModel({
    this.fullName,
    this.phone,
    this.cpf,
    this.birthDate,
    this.gender,
    this.termsAccepted,
  });

  // Método toMap para converter o UserModel em um mapa
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phone': phone,
      'cpf': cpf,
      'birthDate': birthDate?.toIso8601String(), // Convertendo DateTime para String
      'gender': gender,
      'termsAccepted': termsAccepted,
    };
  }
}
