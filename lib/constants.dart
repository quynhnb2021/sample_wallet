import 'package:mywallet/model.dart';

final dataIncomeWallets = [
  IncomeWalletModel(persent: 0.75, title: 'Incomes', balances: '\$348.02'),
  IncomeWalletModel(persent: 0.65, title: 'Expenses', balances: '\$125.34'),
  IncomeWalletModel(persent: 0.75, title: 'Incomes 11', balances: '\$322.02'),
  IncomeWalletModel(persent: 0.85, title: 'Expenses 22', balances: '\$155.22'),
  IncomeWalletModel(persent: 0.15, title: 'Incomes 55', balances: '\$100.02'),
];

final dataTransactions = [
  TransactionModel(
      desc: 'Received', title: 'Connor Davidson', balances: '\$348.02'),
  TransactionModel(
      desc: 'Visa *** 3451', title: 'Airline Ticket', balances: '-\$125.34'),
  TransactionModel(
      desc: 'Visa *** 3451', title: 'Connor Davidson', balances: '-\$322.34'),
  TransactionModel(
      desc: 'Visa *** 3451', title: 'Internet', balances: '-\$125.34'),
  TransactionModel(
      desc: 'Visa *** 3451', title: 'Gas & Light', balances: '-\$322.34'),
  TransactionModel(
      desc: 'Visa *** 3451', title: 'Connor Davidson', balances: '\$125.34'),
  TransactionModel(
      desc: 'Received', title: 'Connor Davidson', balances: '\$322.34'),
  TransactionModel(
      desc: 'Received', title: 'Connor Davidson', balances: '-\$125.34'),
];

final dataProductSales = [
  ProductSaleModel(
      persent: 0.35,
      title: 'Harry Poster',
      desc: 'Released 12.12.2015',
      balances: '\$354/\$3200'),
  ProductSaleModel(
      persent: 0.65,
      title: '101 Theory Book',
      desc: 'Released 12.8.2016',
      balances: '\$136/\$200'),
  ProductSaleModel(
      persent: 0.85,
      title: 'Skylines',
      desc: 'Released 12.5.2014',
      balances: '\$89/\$100'),
  ProductSaleModel(
      persent: 0.25,
      title: 'Clouds & Sky 3',
      desc: 'Released 12.12.2015',
      balances: '\$58/\$300'),
  ProductSaleModel(
      persent: 0.15,
      title: 'Incomes 55',
      desc: 'Released 12.12.2015',
      balances: '\$354/\$3200'),
];

List<SalesData> data = [
  SalesData('Jan', 35),
  SalesData('Feb', 28),
  SalesData('Mar', 34),
  SalesData('Apr', 32),
  SalesData('May', 40)
];
