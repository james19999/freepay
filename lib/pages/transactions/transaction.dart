import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/transactions/widget_card.dart';
import 'package:digitalbank/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Transactionlist extends ConsumerStatefulWidget {
  const Transactionlist({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionlistState();
}

class _TransactionlistState extends ConsumerState<Transactionlist> {
  List<Transaction> transactions = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loader();
  }

  loader() async {
    transactions = await TransactionService.getalltransaction();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            : Center(
                child: CircularProgressIndicator(
                strokeWidth: 1,
                color: AppColors.mainColor,
              )),
      ]),
    );
  }
}
