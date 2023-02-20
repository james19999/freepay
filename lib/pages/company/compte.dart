import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/models/company.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/company/company_list.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/services/company_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CreateCompte extends ConsumerWidget {
  CreateCompte({super.key});
  GlobalKey<FormState> _formk = GlobalKey<FormState>();
  TextEditingController _controllername = TextEditingController();
  TextEditingController _controlleradresse = TextEditingController();
  TextEditingController _controllerdomaine = TextEditingController();
  TextEditingController _controllerraison = TextEditingController();
  TextEditingController _controllerquartier = TextEditingController();
  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllerpassword = TextEditingController();
  var _controllerphone = "";
  // bool obscur = true;
  bool isloade = false;
  final _obscur = StateProvider((ref) => true);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomSheet: Container(
            height: Get.height * 0.1,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainColor.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton.icon(
                    onPressed: () async {
                      if (_formk.currentState!.validate()) {
                        var companies = Company(
                            name: _controllername.text,
                            phone: _controllerphone,
                            adress: _controlleradresse.text,
                            email: _controlleremail.text,
                            raison: _controllerraison.text,
                            domaine: _controllerdomaine.text,
                            password: _controllerpassword.text,
                            quartier: _controllerquartier.text);
                        CompanyService.CreatCompay(companies);
                      }
                    },
                    icon: Icon(
                      Icons.outbound_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Enregistrer ",
                      style: StyleText.copyWith(color: Colors.white),
                    )),
              ),
            )),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => CompanyList(), transition: Transition.fade);
                },
                icon: Icon(
                  Icons.remove_red_eye_sharp,
                  color: Colors.white,
                ))
          ],
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: AppColors.mainColor,
            tabs: [
              Tab(
                child: Text(
                  "Etape 1   ",
                  style: StyleText.copyWith(fontSize: fontsizes),
                ),
              ),
              Tab(
                child: Text(
                  "Etape 2",
                  style: StyleText.copyWith(fontSize: fontsizes),
                ),
              ),
            ],
          ),
          title: const Text('Créer un compte '),
        ),
        body: Form(
          key: _formk,
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _controllername,
                          keyboardType: TextInputType.text,
                          // controller: _amount,
                          validator: (value) => value!.isEmpty
                              ? "Le nom de votre entreprise"
                              : null,
                          decoration: InputDecoration(
                              label: Text("Nom de l'entreprise"),
                              suffixIcon: Icon(Icons.home),
                              isDense: true,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    width: 0.0,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _controlleradresse,
                          validator: (value) =>
                              value!.isEmpty ? "Adresse" : null,
                          decoration: InputDecoration(
                              label: Text("Adresse de l'entreprise"),
                              suffixIcon: Icon(Icons.location_city),
                              isDense: true,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    width: 0.0,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _controllerdomaine,
                          validator: (value) =>
                              value!.isEmpty ? "Domaine d 'activité" : null,
                          decoration: InputDecoration(
                              label: Text("Domaine d 'activité"),
                              suffixIcon: Icon(Icons.local_activity_rounded),
                              isDense: true,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    width: 0.0,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _controllerraison,
                          // validator: (value) =>
                          //     value!.isEmpty ? "Raison sociale" : null,
                          decoration: InputDecoration(
                              hintText: "Optionnel",
                              label: Text("Raison sociale"),
                              suffixIcon: Icon(Icons.block_flipped),
                              isDense: true,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    width: 0.0,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _controllerquartier,
                          validator: (value) =>
                              value!.isEmpty ? "Quartier" : null,
                          decoration: InputDecoration(
                              label: Text("Quartier"),
                              suffixIcon: Icon(Icons.home),
                              isDense: true,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    width: 0.0,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )
                      ]),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _controlleremail,
                      validator: (value) => value!.isEmpty ? "Email" : null,
                      decoration: InputDecoration(
                          label: Text("Email"),
                          suffixIcon: Icon(Icons.mail),
                          isDense: true,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                width: 0.0,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    IntlPhoneField(
                      initialCountryCode: 'TG',
                      searchText: "Rechercher votre pays",
                      invalidNumberMessage: "Numéro de téléphone invalide",
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Numéro de téléphone",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      onChanged: (phone) {
                        _controllerphone = phone.completeNumber;
                      },
                      onCountryChanged: (country) {
                        // print('Country changed to: ' + country.name);
                      },
                    ),
                    TextFormField(
                      obscureText: ref.watch(_obscur),
                      keyboardType: TextInputType.text,
                      controller: _controllerpassword,
                      validator: (value) =>
                          value!.isEmpty ? "Mot de passe" : null,
                      decoration: InputDecoration(
                          label: Text("Choisissez un  Mot de passe"),
                          suffixIcon: IconButton(
                              onPressed: () {
                                ref.watch(_obscur.notifier).state =
                                    !ref.watch(_obscur.notifier).state;
                              },
                              icon: Icon(
                                  color: AppColors.mainColor,
                                  ref.watch(_obscur)
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                          isDense: true,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                width: 0.0,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.mainColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
