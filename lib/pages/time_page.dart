import 'dart:async';

import 'package:financial_accounting/bloc/bloc_day_time/day_time_bloc.dart';
import 'package:financial_accounting/bloc/bloc_day_time/day_time_event.dart';
import 'package:financial_accounting/bloc/bloc_day_time/day_time_state.dart';
import 'package:financial_accounting/models/chart_model.dart';
import 'package:financial_accounting/models/day_time.dart';
import 'package:financial_accounting/models/statistics_model.dart';
import 'package:financial_accounting/models/task_managment.dart';
import 'package:financial_accounting/screens/test_charst.dart';
import 'package:financial_accounting/services/finantical_provider.dart';
import 'package:financial_accounting/widgets/slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimePage extends StatefulWidget {
  TimePage({Key key}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  final FinanticalProvider _finanticalProvider = FinanticalProvider();

  void dismissSlidableItem(SlidableAction action, int i) {
    switch (action) {
      case SlidableAction.delete:
        context.read<BlocDayTime>().add(DeleteCategoryDayTimeEvent(i));
        break;
      default:
    }
  }

  List<ChartMode> createMode() {
    List<ChartMode> rezult = [];
    for (int i = 0; i < BlocDayTime.timeList.length; i++) {
      var mode = ChartMode(BlocDayTime.timeList[i].name,
          BlocDayTime.timeList[i].duration, barColors[i]);
      rezult.add(mode);
    }

    return rezult;
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      for (int i = 0; i < BlocDayTime.timeList.length; i++) {
        if (BlocDayTime.timeList[i].istime) {
          BlocDayTime.timeList[i].currentDuration =
              DateTime.now().difference(BlocDayTime.timeList[i].time) +
                  BlocDayTime.timeList[i].duration;
        }
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocDayTime, DayTimeState>(
      builder: (BuildContext context, state) {
        if (state is DayTimeFirstState) {
          context.read<BlocDayTime>().add(FirstDayTimeEvent());
        }
        if (state is DayTimeLoadedState) {
          BlocDayTime.timeList = state.days.taskmanagments;
        }
        return Container(
            child: Column(
          children: [
            RaisedButton(
                child: Text('Статистика'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => TestCgarts(createMode())));
                }),
            Expanded(
              child: ListView.builder(
                  itemCount: BlocDayTime.timeList.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: SlidableWidget(
                        onDismissed: (action) => dismissSlidableItem(action, i),
                        child: ListTile(
                          onTap: () => context
                              .read<BlocDayTime>()
                              .add(PressTimerEvent(i)),
                          title: Text(BlocDayTime.timeList[i].name),
                          subtitle: !BlocDayTime.timeList[i].istime
                              ? Text('')
                              : Text(BlocDayTime.timeList[i].name),
                          trailing:
                              BlocDayTime.timeList[i].currentDuration != null
                                  ? Text(BlocDayTime.timeList[i].currentDuration
                                      .toString()
                                      .split('.')[0])
                                  : Text(''),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
      },
    );
  }
}
