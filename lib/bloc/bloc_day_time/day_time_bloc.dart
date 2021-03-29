import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_accounting/bloc/bloc_day_time/day_time_event.dart';
import 'package:financial_accounting/bloc/bloc_day_time/day_time_state.dart';
import 'package:financial_accounting/models/day_time.dart';
import 'package:financial_accounting/models/task_managment.dart';
import 'package:financial_accounting/services/finantical_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDayTime extends Bloc<DayTimeEvent, DayTimeState> {
  BlocDayTime() : super(DayTimeFirstState());
  FinanticalProvider _finanticalProvider = FinanticalProvider();
  StreamSubscription _subscription;
  static DayTime dt;
  static List<TaskManagment> timeList = [];

  void updateList(String name) {
    timeList.add(TaskManagment(name, DateTime.now(), false, Duration()));
    DayTime updt;
    if (dt != null) {
      updt = DayTime(dt.time, timeList);
      updt.doc = dt.doc;
      _finanticalProvider.updateDayTime(updt);
    } else {
      updt = DayTime(DateTime.now(), timeList);
      _finanticalProvider.setDayTime(updt);
    }
  }

  void _deleteCategory(int i) {
    BlocDayTime.timeList.removeAt(i);
    DayTime updt = DayTime(BlocDayTime.dt.time, BlocDayTime.timeList);
    updt.doc = BlocDayTime.dt.doc;
    _finanticalProvider.updateDayTime(updt);
  }

  @override
  Stream<DayTimeState> mapEventToState(DayTimeEvent event) async* {
    if (event is FirstDayTimeEvent) {
      await _subscription?.cancel();
      _subscription =
          _finanticalProvider.getDayTimeList().listen((List<DayTime> days) {
        days.sort((a, b) => a.time.compareTo(b.time));
        dt = days.last;
        timeList = days.last.taskmanagments;
        add(UpdateListDayTime(dt));
      });
    }
    if (event is UpdateListDayTime) yield DayTimeLoadedState(event.days);

    if (event is AddDayTimeEvent) updateList(event.nameCategoty);

    if (event is DeleteCategoryDayTimeEvent)
      _deleteCategory(event.indexCategory);

    if (event is PressTimerEvent) _pressTimer(event.pressIndex);

    if (event is SaveDayEvent) _saveDay();
  }

  _resetTimer(int index) {
    for (int i = 0; i < BlocDayTime.timeList.length; i++) {
      var dururation = BlocDayTime.timeList[i].currentDuration;
      if (i != index) {
        var tasktime = TaskManagment(
            BlocDayTime.timeList[i].name, DateTime.now(), false, dururation);
        BlocDayTime.timeList[i] = tasktime;
      }
    }
  }

  void _saveDay() {
    List<TaskManagment> nextTimeList = [];
    for (int i = 0; i < BlocDayTime.timeList.length; i++) {
      var timeItem = TaskManagment(
          BlocDayTime.timeList[i].name, DateTime.now(), false, Duration());
      nextTimeList.add(timeItem);
    }
    DayTime nextDayTime = DayTime(DateTime.now(), nextTimeList);
    _finanticalProvider.setDayTime(nextDayTime);
  }

  _pressTimer(int i) {
    _resetTimer(i);
    TaskManagment task;
    Duration duration;
    duration = BlocDayTime.timeList[i].currentDuration;

    if (!BlocDayTime.timeList[i].istime) {
      task = TaskManagment(
          BlocDayTime.timeList[i].name, DateTime.now(), true, duration);
    } else {
      task = TaskManagment(
          BlocDayTime.timeList[i].name, DateTime.now(), false, duration);
    }

    BlocDayTime.timeList[i] = task;
    DayTime updt = DayTime(BlocDayTime.dt.time, BlocDayTime.timeList);
    updt.doc = BlocDayTime.dt.doc;
    _finanticalProvider.updateDayTime(updt);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
