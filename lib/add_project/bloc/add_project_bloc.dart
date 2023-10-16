import 'package:equatable/equatable.dart';
import 'package:firebase_login_signup/repository/model/project.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/repo.dart';

part 'add_project_event.dart';
part 'add_project_state.dart';

class AddProjectBloc extends Bloc<AddProjectEven,AddProjectState>{
  final UserRepository _userRepository;
  AddProjectBloc({
    required UserRepository userRepository
  }): _userRepository = userRepository,
        super(AddInitial()){
    on<AddProjectRequire>((event, emit) async {
      emit(AddProcess());
      try{
        _userRepository.addProject(Project(
            name: event.name,
            description: event.description,
            start: event.start,
            end: event.end,
            color: event.color,
            owner: event.owner
        ));
        emit(AddSuccess());
      }
      catch(e){
        emit(AddFailure());
      }

    });
  }

}