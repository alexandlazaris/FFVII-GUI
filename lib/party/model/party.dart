class CreateParty {
  final String name;

  CreateParty({required this.name});

  factory CreateParty.fromJson(Map<String, dynamic> json) {
    return CreateParty(
      name: json['name'] as String
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

class CreatePartyResponse {
  final String name;
  final String level;

  CreatePartyResponse({required this.name, required this.level});

  factory CreatePartyResponse.fromJson(Map<String, dynamic> json) {
    return CreatePartyResponse(
      name: json['name'] as String,
      level: json['level'] as String
    );
  }
}