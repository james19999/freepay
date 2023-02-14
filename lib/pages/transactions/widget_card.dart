import 'package:digitalbank/helper/date_convert.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTransaction extends StatelessWidget {
  final Transaction transaction;
  const CardTransaction({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: "Annuler la transaction ${transaction.code_tansaction}",
          middleText: "",
          onCancel: () {},
          onConfirm: () {
            TransactionService.canceledtransaction(transaction.code_tansaction);
          },
          radius: 10,
          textCancel: "Non",
          textConfirm: "Oui",
          confirmTextColor: Colors.white,
          cancelTextColor: AppColors.mainColor,
          buttonColor: AppColors.mainColor,
        );
      },
      child: Container(
        child: Card(
          elevation: 2.2,
          color: Colors.white,
          child: ListTile(
            leading: Icon(
              Icons.outbound_outlined,
              color: transaction.status == 'pending'
                  ? Colors.orange
                  : transaction.status == 'success'
                      ? Colors.green
                      : transaction.status == 'cancelled'
                          ? Colors.red
                          : Colors.transparent,
              size: 30,
            ),
            title: Text(transaction.title),
            subtitle: Text("# ${transaction.code_tansaction}"),
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
      ),
    );
  }
}
