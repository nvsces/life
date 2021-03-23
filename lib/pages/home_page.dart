import 'package:financial_accounting/pages/revenue_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'expenses_calculatet.dart';
import 'expenses_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  void _openFinancial() {}

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(),
        // body:
        Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (cys) => RevenuePage()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/moneyvh.png',
                          width: 130,
                          height: 130,
                        ),
                        Text(
                          'Доходы',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ],
                    ),
                    Text(
                      'Застваь деньги работать на себя',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ExpensesPage()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/moneyvn.png',
                          width: 130,
                          height: 130,
                        ),
                        Text(
                          'Расходы',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                      ],
                    ),
                    Text(
                      'Трать с умом',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
    // );
  }
}
