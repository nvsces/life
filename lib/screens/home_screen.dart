import 'package:financial_accounting/bloc/bloc_day_time/day_time_bloc.dart';
import 'package:financial_accounting/bloc/bloc_day_time/day_time_event.dart';
import 'package:financial_accounting/bloc/bloc_day_time/day_time_state.dart';
import 'package:financial_accounting/models/day_time.dart';
import 'package:financial_accounting/models/task_managment.dart';
import 'package:financial_accounting/pages/home_page.dart';
import 'package:financial_accounting/pages/statistics_time_page.dart';
import 'package:financial_accounting/pages/task_page.dart';
import 'package:financial_accounting/pages/time_page.dart';
import 'package:financial_accounting/screens/test_charst.dart';
import 'package:financial_accounting/services/finantical_provider.dart';
import 'package:financial_accounting/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FinanticalProvider _finanticalProvider = FinanticalProvider();
  TextEditingController _textEditingController = TextEditingController();

  DayTime dayTime;

  int _currentPage = 0;
  Function(int) onTapNavigation(BuildContext context, int index) {
    setState(() {
      _currentPage = index;
    });
  }

  _addCategory() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Введите название сферы'),
              content: TextField(
                controller: _textEditingController,
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context
                          .read<BlocDayTime>()
                          .add(AddDayTimeEvent(_textEditingController.text));
                    },
                    child: Text('OK')),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Отмена')),
              ],
            ));
  }

  Text getTitleAppBar() {
    switch (_currentPage) {
      case 0:
        return Text('Финансы');
        break;
      case 1:
        {
          if (BlocDayTime.dt != null)
            return Text(BlocDayTime.dt.time.toString());
          else
            return Text(DateTime.now().toString());
        }

        break;
    }
  }

  List<Widget> _getActions() {
    switch (_currentPage) {
      case 0:
        return [];
        break;
      case 1:
        return [
          RaisedButton(
              child: Text('S'),
              onPressed: () {
                Navigator.push(
                    context,
                    //MaterialPageRoute(builder: (ctx) => TestCgarts()));
                    MaterialPageRoute(builder: (ctx) => StatisticsTimePage()));
              }),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.save),
              onPressed: () => context.read<BlocDayTime>().add(SaveDayEvent()),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _addCategory(),
            ),
          ),
          SizedBox.shrink()
        ];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitleAppBar(),
        actions: _getActions(),
      ),
      body: IndexedStack(
        index: _currentPage,
        children: [
          HomePage(),
          //TaskPage(),
          TimePage(),
        ],
      ),
      bottomNavigationBar: navigationBar(
        currentIndex: _currentPage,
        titleIcons: ['Финансы', 'Задачи'],
        onTap: (int index) => onTapNavigation(context, index),
      ),
    );
  }
}
