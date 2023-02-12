import 'package:digitalbank/pages/transactions/widget_card.dart';
import 'package:digitalbank/pages/transfer/add_transfert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class TransfertList extends ConsumerStatefulWidget {
  const TransfertList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransfertListState();
}

class _TransfertListState extends ConsumerState<TransfertList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => AddTransfert(), transition: Transition.fade);
              },
              icon: Icon(
                Icons.add_circle,
                size: 36,
              ))
        ],
        title: Text("Transfert"),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: 50,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                Padding(padding: const EdgeInsets.all(10.0), child: Text("dd")),
          ),
        ),
      ]),
    );
  }
}
