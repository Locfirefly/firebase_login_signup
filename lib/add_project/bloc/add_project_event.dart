part of 'add_project_bloc.dart';

abstract class AddProjectEven extends Equatable {
  const AddProjectEven();
  @override
  List<Object> get props => [];
}
class AddProjectRequire extends AddProjectEven{
  final String name;
  final String description;
  final String start;
  final String end;
  final String color;
  final String owner;

  const AddProjectRequire( this.name,this.description, this.start, this.end, this.color,this.owner);
}