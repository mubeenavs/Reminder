import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/repository/reminder_repository.dart';
import 'package:meta/meta.dart';
import 'package:reminder/model/to_do.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  final ReminderRepository _reminderRepository;

  ReminderBloc(this._reminderRepository) : super(ReminderLoadingState()) {
    on<LoadReminderEvent>((event, emit) async{
      // TODO: implement event handler
      emit(ReminderLoadingState());
      try{
        final reminder=await _reminderRepository.getReminder();
        emit(ReminderLoadedState(reminder));
      }
      catch(e){
        emit(ReminderErrorState(e.toString()));
      }
    });
  }
}


