import 'package:financial_accounting/models/day_time.dart';

abstract class DayTimeState {}

class DayTimeFirstState extends DayTimeState {}

class DayTimeAllerDialogState extends DayTimeState {}

class DayTimeLoadedState extends DayTimeState {
  DayTime days;
  DayTimeLoadedState(this.days);
}
