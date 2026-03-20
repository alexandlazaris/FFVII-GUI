class PartyLead {
  final int level;
  final String name;

  PartyLead({required this.level, required this.name});

  factory PartyLead.fromJson(Map<String, dynamic> json) {
    return PartyLead(level: json['level'], name: json['name']);
  }
}

class Save {
  final String id;
  final String location;
  final List<String> party;
  final PartyLead? partyLead;

  Save({
    required this.id,
    required this.location,
    required this.party,
    this.partyLead,
  });

  factory Save.fromJson(Map<String, dynamic> json) {
    PartyLead partyLead;
    final partyLeadResponseKey = json['party_lead'];
    partyLead = PartyLead.fromJson(
      Map<String, dynamic>.from(partyLeadResponseKey),
    );

    return Save(
      id: json['id']! as String,
      location: json['location']! as String,
      party: (json['party'] as List<dynamic>).map((e) => e as String).toList(),
      partyLead: partyLead,
    );
  }
}

class CreateSave {
  final String location;

  CreateSave({
    required this.location,
  });

  factory CreateSave.fromJson(Map<String, dynamic> json) {
    return CreateSave(
      location: json['location']! as String,
    );
  }
}

class CreateSaveResponse {
  final String location;
  final String id;

  CreateSaveResponse({
    required this.location,
    required this.id
  });

  factory CreateSaveResponse.fromJson(Map<String, dynamic> json) {
    return CreateSaveResponse(
      location: json['location']! as String,
      id: json['id'] as String
    );
  }
}