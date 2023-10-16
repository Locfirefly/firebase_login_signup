
class ProjectEntity {
  String? id;
  String name;
  String description;
  String start;
  String end;
  String color;
  String owner;

  ProjectEntity({
    this.id,
    required this.name,
    required this.description,
    required this.start,
    required this.end,
    required this.color,
    required this.owner,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'start': start,
      'end': end,
      'color' : color,
      'owner' : owner,
    };
  }

  static ProjectEntity fromDocument(Map<String, dynamic> doc) {
    return ProjectEntity(
      id: doc['id'] as String,
      name: doc['name'] as String,
      description: doc['description'] as String,
      start: doc['start'] as String,
      end: doc['end'] as String,
      color: doc['color'] as String,
      owner: doc['owner'] as String,
    );
  }

  List<Object?> get props => [id, name, description, start,end,color,owner];

  @override
  String toString() {
    return '''ProjectEntity: {
      id: $id
      name: $name
      description: $description
      start: $start
      end: $end
      color: $color
      owner: $owner
    }''';
  }
}