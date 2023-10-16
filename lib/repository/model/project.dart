import 'package:equatable/equatable.dart';
import '../entity/project_entity.dart';

//ignore: must_be_immutable
class Project extends Equatable {
  String? id;
  String name;
  String description;
  String start;
  String end;
  String color;
  String owner;

  Project({
    this.id,
    required this.name,
    required this.description,
    required this.start,
    required this.end,
    required this.color,
    required this.owner,
  });

  /// Empty user which represents an unauthenticated user.
  static final empty = Project(
    id: '',
    name: '',
    description: '',
    start: '',
    end: '',
    color: '',
    owner: '',
  );

  /// Modify MyUser parameters
  Project copyWith({
    String? id,
    String? name,
    String? description,
    String? start,
    String? end,
    String? color,
    String? owner,
  }) {
    return Project(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        start: start ?? this.start,
        end: end ?? this.end,
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
      id: id,
      name: name,
      description: description,
      start: start,
      end: end,
      color: color,
      owner: owner,
    );
  }

  static Project fromEntity(ProjectEntity entity) {
    return Project(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      start: entity.start,
      end: entity.end,
      color: entity.color,
      owner: entity.owner,
    );
  }

  @override
  String toString() {
    return '''Project: {
      id: $id
      name: $name
      description: $description
      start: $start
      end: $end
      color: $color
      owner: $owner
    }''';
  }

  @override
  List<Object?> get props => throw UnimplementedError();

}