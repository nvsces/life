import 'package:financial_accounting/bloc/expenses_bloc.dart';
import 'package:financial_accounting/bloc/expenses_event.dart';
import 'package:financial_accounting/bloc/expenses_state.dart';
import 'package:financial_accounting/data.dart';
import 'package:financial_accounting/models/category.dart';
import 'package:financial_accounting/models/expenses.dart';
import 'package:financial_accounting/services/finantical_provider.dart';
import 'package:financial_accounting/widgets/card_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

import 'expenses_calculatet.dart';

class ExpensesPage extends StatelessWidget {
  final FinanticalProvider _finanticalProvider = FinanticalProvider();
  ExpensesPage({Key key}) : super(key: key);
  List<CategoryExpenses> listcategory = [
    CategoryExpenses(
      'Продукты',
      Image.asset(
        'assets/images/food.png',
        width: 100,
        height: 100,
      ),
    ),
    CategoryExpenses(
      'Трансорт',
      Image.asset(
        'assets/images/trans.png',
        width: 100,
        height: 100,
      ),
    ),
    CategoryExpenses(
      'Цифровые услуги',
      Image.asset(
        'assets/images/digital.png',
        width: 120,
        height: 120,
      ),
    ),
    CategoryExpenses(
      'Коммунальные услуги',
      Image.asset(
        'assets/images/comus.png',
        //width: 100,
        //height: 100,
      ),
    ),
    CategoryExpenses(
      'Развлечения',
      Image.asset(
        'assets/images/dosug.png',
        width: 130,
        height: 130,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Расходы'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocProvider(
        create: (BuildContext context) => BlocExpenses(_finanticalProvider),
        child:
            BlocBuilder<BlocExpenses, ExpensesState>(builder: (context, state) {
          if (state is ExpensesFirstState) {
            context.read<BlocExpenses>().add(ExpensesStartEvent());
            return Expanded(child: Center(child: CircularProgressIndicator()));
          }
          if (state is ExpensesLoadedState) {
            return Container(
              child: Column(
                children: [
                  RaisedButton(
                      child: Text('Показать диаграмму'),
                      onPressed: () {
                        context.read<BlocExpenses>().add(DiagrammEvent());
                      }),
                  Expanded(
                    child: CardGridView(
                      title: 'Расход',
                      bloc: state.bloc,
                      listcategory: listcategory,
                      price: state.expenses,
                      onTap: (int i) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => ExpensesCalculate(
                                listcategory[i].name, state.bloc),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is DiagrammState) {
            return Column(
              children: [
                RaisedButton(
                    child: Text('Скрыть диаграмму'),
                    onPressed: () {
                      context.read<BlocExpenses>().add(ExpensesStartEvent());
                    }),
                PieChart(
                  colorList: [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                    Colors.orange
                  ],
                  legendOptions: LegendOptions(
                      legendTextStyle: TextStyle(color: Colors.black),
                      legendPosition: LegendPosition.bottom),
                  dataMap: state.dataMap,
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
