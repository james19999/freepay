import 'package:digitalbank/controllers/transaction_controller.dart';
import 'package:digitalbank/helper/date_convert.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/transactions/transaction_detail.dart';
import 'package:digitalbank/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class CardTransaction extends ConsumerWidget {
  final Transaction transaction;
  const CardTransaction({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(GlobalProviders);
    return InkWell(
      onTap: () {
        Get.to(() => DetailTransaction(transactions: transaction),
            transition: Transition.fade);
        // Get.defaultDialog(
        //   title: "Annuler la transaction ${transaction.code_tansaction}",
        //   middleText: "",
        //   onConfirm: () async {
        //     await data.canceledtransaction(transaction.code_tansaction);
        //     data.getcarttransaction();
        //   },
        //   onCancel: () {},
        //   radius: 10,
        //   textCancel: "Non",
        //   textConfirm: "Oui",
        //   confirmTextColor: Colors.white,
        //   cancelTextColor: AppColors.mainColor,
        //   buttonColor: AppColors.mainColor,
        // );
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
            title: Text(
              transaction.title,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
            subtitle: Text("# ${transaction.code_tansaction}"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(DateConverter.formatDate(transaction.created)),
                Text(
                  "${transaction.amount} XOF",
                  style: StyleText.copyWith(
                    fontSize: 14,
                    // color: transaction.status == 'pending'
                    //     ? Colors.orange
                    //     : transaction.status == 'success'
                    //         ? Colors.green
                    //         : transaction.status == 'cancelled'
                    //             ? Colors.red
                    //             : Colors.transparent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
