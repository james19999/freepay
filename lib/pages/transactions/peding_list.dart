import 'package:digitalbank/controllers/transaction_controller.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/transactions/widget_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class PadingList extends ConsumerWidget {
  const PadingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalProvider = ref.watch(GlobalProviders);

    return Scaffold(
      appBar: AppBar(
        title: Text("En cours".tr),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GlobalProvider.pading.length > 0
            ? Expanded(
                child: ListView.builder(
                    itemCount: GlobalProvider.pading.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var t = GlobalProvider.pading[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: CardTransaction(transaction: t),
                            ),
                          ),
                        ),
                      );
                    }))
            : Center(
                child: Column(
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 1,
                    color: AppColors.mainColor,
                  ),
                  Text("Aucune transaction en cours".tr)
                ],
              )),
      ]),
    );
  }
}
