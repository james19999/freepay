import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/transactions/widget_card.dart';
import 'package:digitalbank/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class HistoryTransaction extends ConsumerStatefulWidget {
  const HistoryTransaction({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HistoryTransactionState();
}

class _HistoryTransactionState extends ConsumerState<HistoryTransaction> {
  List<Transaction> transactions = [];
  List<Transaction> transactionsweek = [];
  List<Transaction> transactionsmonth = [];
  var today;
  var week;
  var month;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loader();
  }

  loader() async {
    transactions = await TransactionService.getcarttransactions();
    transactionsweek = await TransactionService.gettransactionoffweek();
    transactionsmonth = await TransactionService.gettransactionoffmonth();

    try {
      today = transactions
          .where((e) => e.status == 'success')
          .map((e) => e.amount)
          .reduce((x, y) => x + y);
    } catch (e) {}

    try {
      week = transactionsweek
          .where((e) => e.status == 'success')
          .map((e) => e.amount)
          .reduce((x, y) => x + y);
    } catch (e) {}

    try {
      month = transactionsmonth
          .where((e) => e.status == 'success')
          .map((e) => e.amount)
          .reduce((x, y) => x + y);
    } catch (e) {}

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: AppColors.mainColor,
            tabs: [
              Tab(
                child: Text(
                  "Jour   ",
                  style: StyleText.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Semaine",
                  style: StyleText.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Mois",
                  style: StyleText.copyWith(fontSize: 14),
                ),
              ),
              Tab(
                child: Text(
                  "Vue",
                  style: StyleText.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
          title: const Text('Historiques des transactions'),
        ),
        body: TabBarView(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              transactions.length > 0
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: transactions.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.all(10.0),
                                child: CardTransaction(
                                  transaction: transactions[index],
                                ),
                              )),
                    )
                  : transactions.length > 0
                      ? Center(
                          child: CircularProgressIndicator(
                          strokeWidth: 1,
                          color: AppColors.mainColor,
                        ))
                      : Text("Vous n'avez pas effectue des transactions ."),
            ]),
            Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: transactionsweek.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CardTransaction(
                            transaction: transactionsweek[index],
                          ),
                        )),
              ),
            ]),
            Column(children: [
              Expanded(
                child: ListView.builder(
                    itemCount: transactionsmonth.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CardTransaction(
                            transaction: transactionsmonth[index],
                          ),
                        )),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.02),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Card(
                                elevation: 2.5,
                                child: Container(
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ), //BoxDecoration
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Jours",
                                        style: StyleText.copyWith(fontSize: 14),
                                      ),
                                      Image.asset(
                                        found,
                                        height: 40,
                                      ),
                                      Text(
                                        today == null ? "0 F" : "  ${today} F",
                                        style: StyleText.copyWith(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              ), //Container
                            ), //Flexible
                            SizedBox(
                              width: Get.width * 0.04,
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Card(
                                elevation: 2.5,
                                child: Container(
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ), //BoxDecoration
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Semaine",
                                        style: StyleText.copyWith(fontSize: 14),
                                      ),
                                      Image.asset(
                                        found,
                                        height: 40,
                                      ),
                                      Text(
                                        week == null ? "0 F" : "${week} F",
                                        style: StyleText.copyWith(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              ), //Container
                            ),

                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Card(
                                elevation: 2.5,
                                child: Container(
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ), //BoxDecoration
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Mois",
                                        style: StyleText.copyWith(fontSize: 14),
                                      ),
                                      Image.asset(
                                        found,
                                        height: 40,
                                      ),
                                      Text(
                                        month == null ? "0 F" : "${month} F",
                                        style: StyleText.copyWith(fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              ), //Container
                            ), //SizedBox
                            //Flexible
                          ], //<Widget>[]
                          mainAxisAlignment: MainAxisAlignment.center,
                        ), //Row
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
