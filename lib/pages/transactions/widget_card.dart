import 'package:digitalbank/helper/date_convert.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:flutter/material.dart';

class CardTransaction extends StatelessWidget {
  final Transaction transaction;
  const CardTransaction({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.2,
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            Icons.outbound_outlined,
            color: transaction.status == 0 ? Colors.orange : Colors.green,
            size: 30,
          ),
          title: Text(transaction.title),
          subtitle: Text("# ${transaction.cartcode}"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(DateConverter.estimatedDate(transaction.created)),
              Text(
                "${transaction.amount} fcfa",
                style: StyleText.copyWith(color: AppColors.mainColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
