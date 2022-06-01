import 'package:flutter/material.dart';
import 'package:mywallet/constants.dart';
import 'package:mywallet/model.dart';
import 'package:mywallet/themes.dart';
import 'package:mywallet/views/dashboard.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyWalletPage extends StatelessWidget {
  const MyWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://upanh123.com/wp-content/uploads/2020/10/Anh-gai-xinh-lam-anh-dai-dien-facebook1.jpg'),
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
        backgroundColor: const Color(0xFF011F48),
        elevation: 0,
      ),
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              mywalletView(context),
              Expanded(child: transactionsView())
            ],
          )),
    );
  }

  mywalletView(BuildContext context) => Container(
        padding: const EdgeInsets.all(16.0),
        color: const Color(0xFF011F48),
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'My Wallet',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                '\$385',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          const Text(
            '27 Nov 2018',
            style: TextStyle(color: Colors.white30, fontSize: 12),
          ),
          const SizedBox(
            height: 16,
          ),
          listIncomes(context)
        ]),
      );

  listIncomes(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: dataIncomeWallets.length,
            itemBuilder: (context, index) =>
                item(context, dataIncomeWallets[index])),
      );

  item(BuildContext context, IncomeWalletModel item) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        ),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          width: 150,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularPercentIndicator(
                  radius: 20.0,
                  lineWidth: 6.0,
                  percent: item.persent!,
                  center: Text(
                    "${item.persent! * 100}",
                    style: const TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  progressColor:
                      item.persent == 0.75 ? Colors.red : Colors.purple,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title ?? "",
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Text(
                    item.balances ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ]),
        ),
      );

  transactionsView() => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            boxShadow: boxShadow),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions'.toUpperCase(),
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
      itemCount: dataTransactions.length,
      itemBuilder: ((context, index) =>
          itemTrans(context, dataTransactions[index])));

  itemTrans(BuildContext context, TransactionModel item) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        ),
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    'https://upanh123.com/wp-content/uploads/2020/10/Anh-gai-xinh-lam-anh-dai-dien-facebook1.jpg'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                item.title ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(item.desc ?? ""),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  item.balances!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: item.balances!.contains('-')
                          ? Colors.red
                          : Colors.green),
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            )
          ],
        ),
      );
}
