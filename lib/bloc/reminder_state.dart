part of 'reminder_bloc.dart';

@immutable
abstract class ReminderState extends Equatable {}

class ReminderLoadingState extends ReminderState {
  @override
  List<Object?> get props=>[];
}
class ReminderLoadedState extends ReminderState{
  final ReminderModel reminder;
  ReminderLoadedState(this.reminder);
  @override
  List<Object> get props => [reminder];
}
class ReminderErrorState extends ReminderState{
  final String error;
  ReminderErrorState(this.error);
  @override
  List<Object> get props => [error];
}