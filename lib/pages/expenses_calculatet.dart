import 'package:financial_accounting/bloc/expenses_bloc.dart';
import 'package:financial_accounting/bloc/expenses_event.dart';
import 'package:financial_accounting/models/expenses.dart';
import 'package:financial_accounting/services/finantical_provider.dart';
import 'package:flutter/material.dart';

class ExpensesCalculate extends StatefulWidget {
  ExpensesCalculate(this.category, this.blocExpenses, {Key key})
      : super(key: key);
  BlocExpenses blocExpenses;
  String category;

  @override
  _ExpensesCalculateState createState() => _ExpensesCalculateState();
}

class _ExpensesCalculateState extends State<ExpensesCalculate> {
  List<String> numbesList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  final FinanticalProvider _finanticalProvider = FinanticalProvider();
  String currentValue = '';
  Function _onTap(int i) {
    setState(() {
      currentValue = numbesList[i];
    });
  }

  void addExpress() {
    if (currentValue.isNotEmpty) {
      var expenses = Expenses();
      expenses.category = widget.category;
      expenses.price = currentValue;
      _finanticalProvider.addExpenses(expenses);
      setState(() {
        currentValue = 'Расход добавлен';
        widget.blocExpenses.add(ExpensesStartEvent());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Калькулятор расходов'),
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                  child: Text(
                currentValue,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ))),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridView.custom(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                childrenDelegate: SliverChildBuilderDelegate((ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      print('Click');
                      if (currentValue == 'Расход добавлен') currentValue = '';
                      setState(() {
                        currentValue = currentValue + numbesList[i];
                      });
                    },
                    //_onTap(i),
                    child: Card(
                      color: Colors.orange,
                      child: Center(
                        child: Text(numbesList[i]),
                      ),
                    ),
                  );
                }, childCount: numbesList.length),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: GestureDetector(
                      onTap: () {
                        if (currentValue == 'Расход добавлен')
                          currentValue = '';
                        setState(() {
                          currentValue = currentValue + '0';
                        });
                      },
                      child: Card(
                        color: Colors.orange,
                        child: Center(
                          child: Text('0'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentValue = '';
                        });
                      },
                      child: Card(
                        color: Colors.red,
                        child: Center(
                          child: Text('C'),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: GestureDetector(
                      onTap: addExpress,
                      child: Card(
                        color: Colors.green,
                        child: Center(
                          child: Text('Добавить'),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
