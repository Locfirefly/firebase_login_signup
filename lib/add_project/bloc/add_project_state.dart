part of 'add_project_bloc.dart';

abstract class AddProjectState extends Equatable {
  const AddProjectState();

  @override
  List<Object> get props => [];
}
class AddInitial extends AddProjectState {}
class AddSuccess extends AddProjectState {}
class AddFailure extends AddProjectState {}
class AddProcess extends AddProjectState {}