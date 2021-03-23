import 'dart:async';

import 'package:financial_accounting/bloc/expenses_event.dart';
import 'package:financial_accounting/bloc/expenses_state.dart';
import 'package:financial_accounting/models/expenses.dart';
import 'package:financial_accounting/services/finantical_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExpenses extends Bloc<ExpensesEvent, ExpensesState> {
  final FinanticalProvider _finanticalProvider;
  BlocExpenses(this._finanticalProvider) : super(ExpensesFirstState());
  List<int> priceList = [];
  List<String> list = [
    'Продукты',
    'Трансорт',
    'Цифровые услуги',
    'Коммунальные услуги',
    'Развлечения',
  ];

  @override
  Stream<ExpensesState> mapEventToState(ExpensesEvent event) async* {
    if (event is ExpensesStartEvent) {
      priceList.clear();
      for (int i = 0; i < list.length; i++) {
        var prprr = _finanticalProvider.getExpenses(list[i]).first;
        var listr = await prprr;
        var cheek = 0;
        for (int j = 0; j < listr.length; j++) {
          cheek = cheek + int.parse(listr[j].price);
        }
        priceList.add(cheek);
      }
      add(ExpensesUpdateListEvent(priceList));
    }
    if (event is ExpensesUpdateListEvent) {
      yield ExpensesLoadedState(event.expenses, this);
    }
    if (event is DiagrammEvent) {
      Map<String, double> dataMap = Map();
      for (int i = 0; i < list.length; i++) {
        dataMap.putIfAbsent(list[i], () => priceList[i].toDouble());
      }
      yield DiagrammState(dataMap);
    }
  }
}
