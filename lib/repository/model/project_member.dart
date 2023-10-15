import 'package:equatable/equatable.dart';
import 'package:firebase_login_signup/repository/entity/project_member_entity.dart';

//ignore: must_be_immutable
class ProjectMember extends Equatable{
  String prId;
  String uId;

  ProjectMember({
    required this.prId,
    required this.uId,

  });

  static final empty = ProjectMember(
      prId: '',
      uId: '',
  );

  /// Modify MyUser parameters
  ProjectMember copyWith({
    String? prId,
    String? uId,
  }) {
    return ProjectMember(
      prId: prId ?? this.prId,
      uId: uId ?? this.uId,
    );
  }

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == ProjectMember.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != ProjectMember.empty;

  ProjectMemberEntity toEntity() {
    return ProjectMemberEntity(
      prId: prId,
      uId: uId,
    );
  }

  static ProjectMember fromEntity(ProjectMemberEntity entity) {
    return ProjectMember(
      prId: entity.prId,
      uId: entity.uId,
    );
  }


  @override
  List<Object?> get props => [prId, uId];
}