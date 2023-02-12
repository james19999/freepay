import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/transactions/widget_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryTransfert extends ConsumerStatefulWidget {
  const HistoryTransfert({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HistoryTransfertState();
}

class _HistoryTransfertState extends ConsumerState<HistoryTransfert> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: AppColors.mainColor,
            tabs: [
              Tab(
                child: Text(
                  "Journée",
                  style: StyleText,
                ),
              ),
              Tab(
                child: Text(
                  "Semaine",
                  style: StyleText,
                ),
              ),
              Tab(
                child: Text(
                  "Mois",
                  style: StyleText,
                ),
              ),
            ],
          ),
          title: Text('Historiques des transferts'),
        ),
        body: TabBarView(
          children: [
            Column(children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0), child: Text("d")),
                ),
              ),
            ]),
            Column(children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0), child: Text("d")),
                ),
              ),
            ]),
            Column(children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0), child: Text("d")),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
