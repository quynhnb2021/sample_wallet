class IncomeWalletModel {
  double? persent;
  String? title;
  String? balances;

  IncomeWalletModel(
      {required this.persent, required this.title, required this.balances});
}

class TransactionModel {
  String? title;
  String? desc;
  String? balances;

  TransactionModel(
      {required this.title, required this.desc, required this.balances});
}

class ProductSaleModel {
  String? title;
  String? desc;
  String? balances;
  double? persent;

  ProductSaleModel(
      {required this.title,
      required this.desc,
      required this.balances,
      required this.persent});
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
