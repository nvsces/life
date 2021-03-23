class Expenses {
  String category;
  String price;

  Expenses({this.category, this.price});

  Expenses.fromJson(Map<String, dynamic> data) {
    category = data['category'];
    price = data['price'];
  }

  Map<String, dynamic> toMap() {
    return {'price': price, 'category': category};
  }
}
