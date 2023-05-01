import 'package:digitalbank/models/cart_data.dart';
import 'package:digitalbank/pages/card/Cards.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Tmoney extends ConsumerWidget {
   Tmoney({super.key});
     bool isloded=false;
    GlobalKey<FormState> _formk = GlobalKey<FormState>();
    TextEditingController _controllercode =TextEditingController(text:Cartes.code);
    TextEditingController _controlleramount =TextEditingController();
    TextEditingController _controllercompanyphone =TextEditingController();
    TextEditingController _controlleruserphone =TextEditingController();
    TextEditingController _controllersecret =TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
       appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Tmoney"),
       ),

              bottomSheet: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
               width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton.icon(
                    onPressed: () async {
                      Toas.message(
                      context,
                      "Action indisponible."
                      .tr);
                      // if (_formk.currentState!.validate()) {
                        
                      //      Get.defaultDialog(
                      //       title: "${"Recharge de :".tr} ${_controlleramount.text} XOF",
                      //       // middleText: company,
                      //        content: Column(children: [
                      //          Row(children: [
                      //            Text("Destinataire: ".tr),
                      //            Expanded(child: Text(company)),
                      //          ],),
                      //          SizedBox(height: Get.height *0.01,),

                      //          Row(children: [
                      //            Text("Téléphone: ".tr),
                      //            Expanded(child: Text(_controllercompanyphone.text)),
                      //          ],),
                      //          SizedBox(height: Get.height *0.01,),
                               

                      //          Divider(height: 0.2,color:Colors.black ,),
                      //          SizedBox(height: Get.height *0.01,),
                      //          Row(children: [
                      //            Text("Téléphone: ".tr),
                      //            Expanded(child: Text(_controlleruserphone.text)),
                      //          ],),
                      //          SizedBox(height: Get.height *0.01,),

                      //          Row(children: [
                      //            Text("Numéro de la carte: ".tr),
                      //            Expanded(child: Text(_controllercode.text)),
                      //          ],),
                      //          SizedBox(height: Get.height *0.03,),

                      //          Row(
                      //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //           InkWell(
                      //             onTap: () {
                      //               Get.back();
                      //             },
                      //             child: Container(
                      //               child: Align(
                      //                  alignment: Alignment.center,
                      //                 child: Text("Annuler".tr,textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
                      //                decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(5),
                      //                 color: Colors.red),
                      //               height: Get.height *0.06,width: Get.width *0.3,),
                      //           ),
                      //           InkWell(
                      //             onTap: () {
                      //               Get.to(()=>Cards(),transition: Transition.fade);
                      //             },
                      //             child: Container(
                      //               child: Align(
                      //                  alignment: Alignment.center,
                      //                 child: Text("Valider".tr,style: TextStyle(color: Colors.white),)),
                      //                decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(5),
                      //                 color: AppColors.mainColor),
                      //               height: Get.height *0.06,width: Get.width *0.3,),
                      //           ),
                      //          ],)
                      //        ],),
                      //       radius: 5
                      //      );
                      // }
                    },
                    icon: isloded == false
                        ? Icon(
                            Icons.outbound_outlined,
                            color: Colors.white,
                          )
                        : CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 2,
                          ),
                    label: Text(
                      "Envoyer".tr,
                      style: StyleText.copyWith(color: Colors.white),
                    )),
              ),
       ),
       body: SafeArea(child: SingleChildScrollView(
               physics: BouncingScrollPhysics(),
                child: Column(children: [
                           Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                       key: _formk,
                      child: Column(children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        // controller: _controllercode,
                        readOnly: true,
                        initialValue: Cartes.code,
                        validator: (value) => value!.isEmpty
                            ? "Entrer le numéro de votre carte".tr
                            : null,
                        decoration: InputDecoration(
                            label: Text("Entrer le numéro de votre carte".tr),
                            hintText: "".tr,
                            suffixIcon:
                                Icon(Icons.payment),
                            isDense: true,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: AppColors.mainColor,
                                  width: 0.0,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.mainColor),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(5.0))),
                      ),
                      SizedBox(height: Get.height *0.02,),
       
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _controlleramount,
                        validator: (value) => value!.isEmpty
                            ? "Entrer le montant".tr
                            : null,
                        decoration: InputDecoration(
                            label: Text("Entrer le montant".tr),
                            hintText: "".tr,
                            suffixIcon:
                                Icon(Icons.monetization_on_outlined),
                            isDense: true,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: AppColors.mainColor,
                                  width: 0.0,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.mainColor),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(5.0))),
                      ),
                      SizedBox(height: Get.height *0.02,),
                       
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _controllercompanyphone,
                        validator: (value) => value!.isEmpty
                            ? "Téléphone de l'entreprise".tr
                            : null,
                        decoration: InputDecoration(
                            label: Text("Téléphone de l'entreprise".tr),
                            hintText: "Ex:+228 92 21 25 30".tr,
                            suffixIcon:
                                Icon(Icons.phone_android),
                            isDense: true,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: AppColors.mainColor,
                                  width: 0.0,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.mainColor),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(5.0))),
                      ),
                      SizedBox(height: Get.height *0.02,),
                       
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _controlleruserphone,
                        validator: (value) => value!.isEmpty
                            ? "Votre numéro de Téléphone".tr
                            : null,
                        decoration: InputDecoration(
                            label: Text("Votre numéro de Téléphone".tr),
                            hintText: "".tr,
                            suffixIcon:
                                Icon(Icons.phone_android),
                            isDense: true,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: AppColors.mainColor,
                                  width: 0.0,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.mainColor),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(5.0))),
                      ),
                      SizedBox(height: Get.height *0.02,),
                       
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _controllersecret,
                        validator: (value) => value!.isEmpty
                            ? "Code secret T-money".tr
                            : null,
                        decoration: InputDecoration(
                            label: Text("Code secret T-money".tr),
                            hintText: "".tr,
                            suffixIcon:
                                Icon(Icons.lock_outline),
                            isDense: true,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: AppColors.mainColor,
                                  width: 0.0,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.mainColor),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(5.0))),
                      ),

                     SizedBox(height: Get.height *0.04,),
                     Row(children: [
                      
                      Icon(Icons.warning_amber_rounded ,color: Colors.amber, size: 30,),
                      SizedBox(width: Get.width *0.02,),
                      
                      Text("Vérifier les informations de l'entreprise.".tr),

                  
                     ],),

                     SizedBox(height: Get.height *0.03,),

                     Row(children: [
                     Icon(Icons.home ,color: AppColors.mainColor,size: 30),
                      SizedBox(width: Get.width *0.02,),
                      
                     Text(company)
                  
                     ],),
                     SizedBox(height: Get.height *0.03,),
                     Row(children: [
                     Icon(Icons.phone_android ,color: AppColors.mainColor,size: 30),
                      SizedBox(width: Get.width *0.02,),
                     Text(companyphone)
                  
                     ],),

                ],)),
              )
         ],),
       )),
    );
  }
}