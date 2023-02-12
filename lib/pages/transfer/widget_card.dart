import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:flutter/material.dart';

class TransferCard extends StatelessWidget {
  const TransferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.2,
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            Icons.outbound_outlined,
            color: Colors.green,
            size: 30,
          ),
          title: const Text("Achat de chemise"),
          subtitle: const Text("# 000185967"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("1 oct"),
              Text(
                "2500000 fcfa",
                style: StyleText.copyWith(color: AppColors.mainColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
