import 'package:financial_accounting/bloc/expenses_bloc.dart';
import 'package:financial_accounting/models/category.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class CardGridView extends StatelessWidget {
  List<CategoryExpenses> listcategory;
  List<int> price;
  BlocExpenses bloc;
  String title;
  Null Function(int index) onTap;

  CardGridView({
    @required this.listcategory,
    @required this.price,
    @required this.bloc,
    @required this.title,
    this.onTap,
    Key key,
  }) : super(key: key);

  Widget buildCard(int price, int index, Null Function(int i) onTap) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: greyvk,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ColumnCard(
            title: title,
            index: index,
            price: price,
            listcategory: listcategory,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listcategory.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 2),
        ),
        itemBuilder: (context, index) {
          return buildCard(price[index], index, onTap);
        });
  }
}

class ColumnCard extends StatelessWidget {
  int price;
  int index;
  String title;
  List<CategoryExpenses> listcategory;
  ColumnCard(
      {@required this.index,
      @required this.title,
      @required this.price,
      @required this.listcategory,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          listcategory[index].name,
          style: TextStyle(color: Colors.black),
        ),
        listcategory[index].image,
        Text(
          '$title: $price',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}

// Widget buildGridView(BuildContext context, List<int> price, BlocExpenses bloc) {
//   return GridView.builder(
//       itemCount: listcategory.len
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: MediaQuery.of(context).size.width /
//             (MediaQuery.of(context).size.height / 2),
//       ),
//       itemBuilder: (context, index) {
//         return buildCard(price[index], index, () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (ctx) => ExpensesCalculate(list[index], bloc)));
//         }, buildWidgetW(price[index], index));
//       });
// }
