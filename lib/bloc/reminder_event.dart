part of 'reminder_bloc.dart';

@immutable
abstract class ReminderEvent extends Equatable{
  const ReminderEvent();
}
class LoadReminderEvent extends ReminderEvent{
  @override
  List<Object> get props =>[];
}
class AddReminder extends ReminderEvent {
  @override
  final String alertText;
  final String alertDate;
  final String alertTime;
  AddReminder({
    required this.alertText,
    required this.alertDate,
    required this.alertTime,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}