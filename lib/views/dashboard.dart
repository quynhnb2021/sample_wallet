import 'package:flutter/material.dart';
import 'package:mywallet/constants.dart';
import 'package:mywallet/model.dart';
import 'package:mywallet/themes.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
        child: AppBar(
          title: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Overview',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              const SizedBox(
                width: 16,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(2),
                child: const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://upanh123.com/wp-content/uploads/2020/10/Anh-gai-xinh-lam-anh-dai-dien-facebook1.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFFFD2B1E),
          elevation: 0,
        ),
      ),
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [chartView(context), Expanded(child: transactionsView())],
          )),
    );
  }

  chartView(BuildContext context) => Container(
        color: const Color(0xFFFD2B1E),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF011F48),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'REVENUE OVERVIEW',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white54,
                  ),
                ],
              ),
              Center(
                  child: SizedBox(
                child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    // borderColor: Colors.red,
                    enableMultiSelection: true,
                    // crosshairBehavior: CrosshairBehavior(enable: true),
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      minorGridLines: const MinorGridLines(width: 0),
                    ),
                    trackballBehavior: TrackballBehavior(enable: true),
                    primaryYAxis: NumericAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      minorGridLines: const MinorGridLines(width: 0),
                      isVisible: false,
                    ),

                    // Initialize category axis
                    series: <SplineSeries<SalesData, String>>[
                      SplineSeries<SalesData, String>(
                          // Bind data source
                          dataSource: <SalesData>[
                            SalesData('MON', 10),
                            SalesData('TUE', 20),
                            SalesData('WED', 22),
                            SalesData('THU', 28),
                            SalesData('FRI', 35),
                            SalesData('SUR', 55),
                            SalesData('SUN', 30),
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales),
                      SplineSeries<SalesData, String>(
                          // Bind data source
                          dataSource: <SalesData>[
                            SalesData('MON', 3),
                            SalesData('TUE', 8),
                            SalesData('WED', 15),
                            SalesData('THU', 22),
                            SalesData('FRI', 28),
                            SalesData('SUR', 54),
                            SalesData('SUN', 44),
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales)
                    ]),
              ))
            ],
          ),
        ),
      );

  transactionsView() => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'product sales'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Show all',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 238, 26, 11),
                    fontSize: 14),
              )
            ],
          ),
          Expanded(child: transactionList())
        ]),
      );

  transactionList() => ListView.builder(
      shrinkWrap: true,
      itemCount: dataProductSales.length,
      itemBuilder: ((context, index) =>
          itemTrans(context, dataProductSales[index])));

  itemTrans(BuildContext context, ProductSaleModel item) => Column(
        children: [
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            title: Text(
              item.title ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(item.desc ?? ""),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.balances!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 200,
                  child: LinearPercentIndicator(
                    width: 200.0,
                    lineHeight: 4.0,
                    percent: item.persent!,
                    progressColor: Color.fromARGB(255, 239, 25, 10),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          )
        ],
      );
}
