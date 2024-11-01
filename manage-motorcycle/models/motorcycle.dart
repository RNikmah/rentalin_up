class Motorcycle {
  String merkMotor;
  String motorName;
  String typeMotor;
  String platMotor;
  double pricePerDay;
  bool isRecommended;

  Motorcycle({
    required this.merkMotor,
    required this.motorName,
    required this.typeMotor,
    required this.platMotor,
    required this.pricePerDay,
    required this.isRecommended,
  });

  // Convert Firestore document to Motorcycle instance
  factory Motorcycle.fromMap(Map<String, dynamic> map) {
    return Motorcycle(
      merkMotor: map['merkMotor'] ?? '',
      motorName: map['motorName'] ?? '',
      typeMotor: map['typeMotor'] ?? '',
      platMotor: map['platMotor'] ?? '',
      pricePerDay: (map['pricePerDay'] ?? 0).toDouble(),
      isRecommended: map['isRecommended'] ?? false,
    );
  }

  // Convert Motorcycle instance to Map (useful for saving to Firestore)
  Map<String, dynamic> toMap() {
    return {
      'merkMotor': merkMotor,
      'motorName': motorName,
      'typeMotor': typeMotor,
      'platMotor': platMotor,
      'pricePerDay': pricePerDay,
      'isRecommended': isRecommended,
    };
  }
}
