import 'package:financial_accounting/models/day_time.dart';
import 'package:financial_accounting/models/statistics_model.dart';
import 'package:financial_accounting/models/task_managment.dart';
import 'package:financial_accounting/screens/test_charst.dart';
import 'package:financial_accounting/services/finantical_provider.dart';
import 'package:flutter/material.dart';

class StatisticsTimePage extends StatefulWidget {
  const StatisticsTimePage({Key key}) : super(key: key);

  @override
  _StatisticsTimePageState createState() => _StatisticsTimePageState();
}

class _StatisticsTimePageState extends State<StatisticsTimePage> {
  List<DayTime> days = [];
  FinanticalProvider _finanticalProvider = FinanticalProvider();
  bool show = false;

  List<StatisticsModel> stmodels = [];
  Set<String> nameTask = {};

  loadData() async {
    var stream = _finanticalProvider.getDayTimeList();
    stream.listen((daysList) {
      setState(() {
        for (int i = 0; i < daysList.length; i++) {
          for (int j = 0; j < daysList[i].taskmanagments.length; j++) {
            nameTask.add(daysList[i].taskmanagments[j].name);
          }
        }
        for (var k in nameTask) {
          if (k != null) {
            var st = StatisticsModel.create(daysList, k);
            stmodels.add(st);
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  List<Widget> getCreateColumn(StatisticsModel model) {
    List<Widget> outList = [];

    for (int i = 0; i < model.durations.length; i++) {
      Widget w = Row(
        children: [
          Text('${model.durTimes[i].toString().split('.')[0]}  --  '),
          Text('${model.durations[i].toString().split('.')[0]}'),
        ],
      );
      outList.add(w);
    }

    return outList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Статистика'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: stmodels.length,
          itemBuilder: (context, i) => Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      stmodels[i].show = !stmodels[i].show;
                    });
                  },
                  title: Text(stmodels[i].nameCategory),
                ),
                if (stmodels[i].show)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => TestCgarts(stmodels[i].data)));
                    },
                    child: Column(
                      children: getCreateColumn(stmodels[i]),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
