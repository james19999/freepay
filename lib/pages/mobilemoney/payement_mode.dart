import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/mobilemoney/flooz.dart';
import 'package:digitalbank/pages/mobilemoney/t_money.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
class PayementMode extends ConsumerWidget {
   PayementMode({super.key});

   List<dynamic> choice = [
      {"name":"T-money","img" :tg},
      {"name":"Flooz","img" :mv},
   ];
  
   final  isselected =StateProvider((ref) => '');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
       backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          title: Text("Mode de recharge".tr),
          centerTitle: true,
        ),

        body: SafeArea(child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  ...choice.map((e) =>
                        InkWell(
                    onTap: () {
                        ref.watch(isselected.notifier).state=e['name'];
                         if(e['name']=="T-money"){
                         Get.to(()=>Tmoney());
                          
                         }else if(e['name']=="Flooz"){
                         Get.to(()=>Flooz());
                            
                         }
                    },
                     child: Container(height: Get.height *0.15, width: Get.width *0.4, 
                     decoration: BoxDecoration(
                       color: Colors.white,
                       border: Border.all(color:ref.watch(isselected)==e['name']?AppColors.mainColor:Colors.transparent, width: 1.2),
                      borderRadius: BorderRadius.circular(5)),
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(
                             height: Get.height *0.05,
                             width: Get.width *0.5,
                             child: Image.asset(e['img']),
                           ),
                           SizedBox(height: Get.height*0.03,),
                           Text(e['name'],style: TextStyle(fontSize: fontsizes,fontWeight: FontWeight.bold),),
                         ],
                       ),
                      ),
                   )
                   ).toList()
                 
                ],),
              )
        ],)),
    );
  }
}