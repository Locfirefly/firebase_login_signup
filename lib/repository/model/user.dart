import 'package:equatable/equatable.dart';

import '../entity/user_entity.dart';

//ignore: must_be_immutable
class MyUser extends Equatable {
  final String id;
  final String email;
  final String? name;
  String? picture;

  MyUser({
    required this.id,
    required this.email,
    this.name,
    this.picture,
  });

  /// Empty user which represents an unauthenticated user.
  static final empty = MyUser(
      id: '',
      email: '',
      name: '',
      picture: ''
  );

  /// Modify MyUser parameters
  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? picture,
  }) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      picture: picture ?? this.picture,
    );
  }

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == MyUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name.toString(),
      picture: picture.toString(),
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      picture: entity.picture,
    );
  }


  @override
  List<Object?> get props => [id, email, name, picture];

}