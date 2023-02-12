import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/transactions/history_transaction.dart';
import 'package:digitalbank/pages/transfer/history_transfert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historique"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: () {
                Get.to(() => HistoryTransaction(), transition: Transition.fade);
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.9,
                color: AppColors.mainColor,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Transaction",
                      textAlign: TextAlign.center,
                      style: StyleText.copyWith(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            InkWell(
              onTap: () {
                Get.to(() => HistoryTransfert(), transition: Transition.fade);
              },
              child: Container(
                height: Get.height * 0.1,
                width: Get.width * 0.9,
                color: AppColors.mainColor,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Transfert",
                      textAlign: TextAlign.center,
                      style: StyleText.copyWith(color: Colors.white)),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
