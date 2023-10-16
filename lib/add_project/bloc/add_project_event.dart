part of 'add_project_bloc.dart';

abstract class AddProjectEven extends Equatable {
  const AddProjectEven();
  @override
  List<Object> get props => [];
}
class AddProject extends AddProjectEven{
  final String prName;
  final String prDescription;
  final String startDate;
  final String endDate;
  final String color;
  final String owner;

  const AddProject(this.prName,this.prDescription, this.startDate, this.endDate, this.color,this.owner);
}