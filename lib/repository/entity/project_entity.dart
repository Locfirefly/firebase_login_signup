
class ProjectEntity {
  String prId;
  String prName;
  String prDescription;
  DateTime? startDate;
  DateTime? endDate;
  String color;
  String owner;

  ProjectEntity({
    required this.prId,
    required this.prName,
    required this.prDescription,
    required this.startDate,
    required this.endDate,
    required this.color,
    required this.owner,
  });

  Map<String, Object?> toDocument() {
    return {
      'prId': prId,
      'prName': prName,
      'prDescription': prDescription,
      'startDate': startDate,
      'endDate': endDate,
      'color' : color,
      'owner' : owner,
    };
  }

  static ProjectEntity fromDocument(Map<String, dynamic> doc) {
    return ProjectEntity(
      prId: doc['prId'] as String,
      prName: doc['prName'] as String,
      prDescription: doc['prDescription'] as String,
      startDate: doc['startDate'] as DateTime,
      endDate: doc['endDate'] as DateTime,
      color: doc['color'] as String,
      owner: doc['owner'] as String,
    );
  }

  List<Object?> get props => [prId, prName, prDescription, startDate,endDate,color,owner];

  @override
  String toString() {
    return '''ProjectEntity: {
      prId: $prId
      prName: $prName
      prDescription: $prDescription
      startDate: $startDate
      endDate: $endDate
      color: $color
      owner: $owner
    }''';
  }
}