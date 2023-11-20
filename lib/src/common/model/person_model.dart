class PersonModel {
  final int id;
  final String name;
  final String phoneNumber;

  const PersonModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  PersonModel copyWith({
    int? id,
    String? name,
    String? phoneNumber,
  }) {
    return PersonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          phoneNumber == other.phoneNumber;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ phoneNumber.hashCode;

  @override
  String toString() {
    return 'PersonModel{id: $id, name: $name, phoneNumber: $phoneNumber}';
  }
}
