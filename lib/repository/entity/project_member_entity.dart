
class ProjectMemberEntity {
  String prId;
  String uId;


  ProjectMemberEntity({
    required this.prId,
    required this.uId,
  });

  Map<String, Object?> toDocument() {
    return {
      'prId': prId,
      'uId': uId,
    };
  }

  static ProjectMemberEntity fromDocument(Map<String, dynamic> doc) {
    return ProjectMemberEntity(
      prId: doc['prId'] as String,
      uId: doc['uId'] as String,
    );
  }

  List<Object?> get props => [prId, uId];

  @override
  String toString() {
    return '''ProjectEntity: {
      prId: $prId
      prName: $uId
    }''';
  }
}