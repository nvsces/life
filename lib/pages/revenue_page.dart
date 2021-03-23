import 'package:financial_accounting/models/category.dart';
import 'package:financial_accounting/widgets/card_builder.dart';
import 'package:flutter/material.dart';

class RevenuePage extends StatelessWidget {
  RevenuePage({Key key}) : super(key: key);

  List<CategoryExpenses> listcategory = [
    CategoryExpenses(
      'Работа',
      Image.asset(
        'assets/images/work.png',
        width: 130,
        height: 130,
      ),
    ),
    CategoryExpenses(
      'Криптовалюта',
      Image.asset(
        'assets/images/crypto.png',
        width: 130,
        height: 130,
      ),
    ),
    CategoryExpenses(
      'Акции',
      Image.asset(
        'assets/images/akcii.png',
        width: 130,
        height: 130,
      ),
    ),
    CategoryExpenses(
      'Учёба',
      Image.asset(
        'assets/images/shcoll.png',
        width: 130,
        height: 130,
      ),
    ),
    CategoryExpenses(
      'Другие доходы',
      Image.asset(
        'assets/images/drugie.png',
        width: 130,
        height: 130,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        children: [
          Text(
            'Cуммарный доход 25500',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Expanded(
            child: CardGridView(
              title: 'Доход',
              listcategory: listcategory,
              price: [15000, 0, 0, 10500, 1400],
              bloc: null,
            ),
          ),
        ],
      )),
    );
  }
}
