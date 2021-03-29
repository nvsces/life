import 'package:financial_accounting/models/day_time.dart';

abstract class DayTimeEvent {}

class AddDayTimeEvent extends DayTimeEvent {
  String nameCategoty;
  AddDayTimeEvent(this.nameCategoty);
}

class FirstDayTimeEvent extends DayTimeEvent {}

class SaveDayEvent extends DayTimeEvent {}

class UpdateListDayTime extends DayTimeEvent {
  DayTime days;
  UpdateListDayTime(this.days);
}

class DeleteCategoryDayTimeEvent extends DayTimeEvent {
  int indexCategory;
  DeleteCategoryDayTimeEvent(this.indexCategory);
}

class PressTimerEvent extends DayTimeEvent {
  int pressIndex;
  PressTimerEvent(this.pressIndex);
}
