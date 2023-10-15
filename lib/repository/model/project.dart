import 'package:equatable/equatable.dart';
import '../entity/project_entity.dart';

//ignore: must_be_immutable
class Project extends Equatable {
  String prId;
  String prName;
  String prDescription;
  DateTime? startDate;
  DateTime? endDate;
  String color;
  String owner;

  Project({
    required this.prId,
    required this.prName,
    required this.prDescription,
    required this.startDate,
    required this.endDate,
    required this.color,
    required this.owner,
  });

  /// Empty user which represents an unauthenticated user.
  static final empty = Project(
    prId: '',
    prName: '',
    prDescription: '',
    startDate: null,
    endDate: null,
    color: '',
    owner: '',
  );

  /// Modify MyUser parameters
  Project copyWith({
    String? prId,
    String? prName,
    String? prDescription,
    DateTime? startDate,
    DateTime? endDate,
    String? color,
    String? owner,
  }) {
    return Project(
        prId: prId ?? this.prId,
        prName: prName ?? this.prName,
        prDescription: prDescription ?? this.prDescription,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        color: color ?? this.color,
        owner: owner ?? this.owner,

    );
  }

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == Project.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != Project.empty;
  ProjectEntity toEntity() {
    return ProjectEntity(
      prId: prId,
      prName: prName,
      prDescription: prDescription,
      startDate: startDate,
      endDate: endDate,
      color: color,
      owner: owner,
    );
  }

  static Project fromEntity(ProjectEntity entity) {
    return Project(
      prId: entity.prId,
      prName: entity.prName,
      prDescription: entity.prDescription,
      startDate: entity.startDate,
      endDate: entity.endDate,
      color: entity.color,
      owner: entity.owner,
    );
  }

  @override
  String toString() {
    return '''Project: {
      prId: $prId
      prName: $prName
      prDescription: $prDescription
      startDate: $startDate
      endDate: $endDate
      color: $color
      owner: $owner
    }''';
  }

  @override
  List<Object?> get props => throw UnimplementedError();

}