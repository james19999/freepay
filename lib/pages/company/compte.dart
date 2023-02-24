import 'package:digitalbank/controllers/transaction_controller.dart';
import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/models/company/company.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/company/company_list.dart';
import 'package:digitalbank/pages/company/compay_card.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:digitalbank/services/company_service.dart';
import 'package:digitalbank/services/image.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class CreateCompte extends ConsumerStatefulWidget {
  const CreateCompte({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateCompteState();
}

class _CreateCompteState extends ConsumerState<CreateCompte> {
  GlobalKey<FormState> _formk = GlobalKey<FormState>();
  TextEditingController _controllername = TextEditingController();
  TextEditingController _controlleradresse = TextEditingController();
  // TextEditingController domaine = TextEditingController();
  TextEditingController _controllerraison = TextEditingController();
  TextEditingController _controllerquartier = TextEditingController();
  TextEditingController _controlleremail = TextEditingController();
  TextEditingController _controllerpassword = TextEditingController();
  TextEditingController _controllerdescription = TextEditingController();
  TextEditingController _searchTextController = TextEditingController();
  var _controllerphone = "";
  // bool obscur = true;
  bool isloade = false;
  final _obscur = StateProvider((ref) => true);
  final _search = StateProvider((ref) => false);
  final _searchtab = StateProvider((ref) => []);
  File? _image;

  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final CompanyList = ref.watch(GlobalProviders);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        bottomSheet: Container(
            height: Get.height * 0.11,
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(5)),
                child: _image != null
                    ? TextButton.icon(
                        onPressed: () async {
                          if (_formk.currentState!.validate()) {
                            Map<String, String> body = {
                              "name": _controllername.text,
                              "phone": _controllerphone,
                              "adress": _controlleradresse.text,
                              "email": _controlleremail.text,
                              "raison": _controllerraison.text,
                              "description": _controllerdescription.text,
                              "password": _controllerpassword.text,
                              "quartier": _controllerquartier.text,
                            };
                            var check = await CompanyService.CreatCompay(
                                body, _image!.path);

                            if (check == true) {
                              Toas.getSnackbarsucess(
                                  appName, "Votre Compte à été bien  créer. ");
                              _controllername.text = '';
                              _controllerphone = '';
                              _controlleradresse.text = '';
                              _controlleremail.text = '';
                              _controllerraison.text = '';
                              _controllerdescription.text = '';
                              _controllerpassword.text = '';
                              _controllerquartier.text = '';
                              _controllerphone = '';
                              _image = null;

                              Toas.message(context,
                                  "Compte  enregister téléchargé l'application ${appName} Agent pour vous connectez à votre entreprise.");
                            } else {
                              Toas.getSnackbarEror(appName,
                                  "Erreur de créaction du compte vérifié vos informations");
                            }
                          }
                          CompanyList.getallcompany();
                        },
                        icon: Icon(
                          Icons.outbound_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Enregistrer ",
                          style: StyleText.copyWith(color: Colors.white),
                        ))
                    : TextButton(
                        onPressed: () {
                          Toas.message(
                              context, "Sélectionnez une image pour continuer");
                        },
                        child: Text(
                          "Enregistrer",
                          style: StyleText.copyWith(
                              fontSize: fontsizes, color: Colors.white),
                        )),
              ),
            )),
        appBar: AppBar(
          elevation: 0,
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
              Tab(
                child: Text(
                  "Etape 3",
                  style: StyleText.copyWith(fontSize: fontsizes),
                ),
              ),
            ],
          ),
          title: const Text(
            'Créer un compte entreprise',
            style: StyleText,
          ),
        ),
        body: Form(
          key: _formk,
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              // fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      width: 0.0, color: Colors.white)),
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
                                    color: Colors.white,
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
                        // TextFormField(
                        //   keyboardType: TextInputType.text,
                        //   controller: domaine,
                        //   validator: (value) =>
                        //       value!.isEmpty ? "Domaine d 'activité" : null,
                        //   decoration: InputDecoration(
                        //       label: Text("Domaine d 'activité"),
                        //       suffixIcon: Icon(Icons.local_activity_rounded),
                        //       isDense: true,
                        //       filled: true,
                        //       enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(5.0),
                        //           borderSide: BorderSide(
                        //             width: 0.0,
                        //           )),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderSide:
                        //             BorderSide(color: AppColors.mainColor),
                        //         borderRadius: BorderRadius.circular(5.0),
                        //       ),
                        //       border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(5.0))),
                        // ),
                        // SizedBox(
                        //   height: Get.height * 0.03,
                        // ),
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
                                    color: Colors.white,
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
                                    color: Colors.white,
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
                          height: Get.height * 0.05,
                        ),
                        InkWell(
                          onTap: () => _openImagePicker,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4)),
                            alignment: Alignment.center,
                            width: Get.width * 0.5,
                            height: Get.height * 0.18,
                            child: TextButton(
                                onPressed: _openImagePicker,
                                child: _buildImage()),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text("Logo/Image de couverture")
                      ]),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                    color: Colors.white,
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
                        IntlPhoneField(
                          initialCountryCode: 'TG',
                          searchText: "Rechercher votre pays",
                          invalidNumberMessage: "Numéro de téléphone invalide",
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            hintText: "Numéro de téléphone",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.0,
                                )),
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
                                    color: Colors.white,
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
                          maxLength: 100,
                          minLines: 5,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          controller: _controllerdescription,
                          validator: (value) => value!.isEmpty
                              ? "Une petite description de votre entreprise"
                              : null,
                          decoration: InputDecoration(
                              label: Text("Une petite description "),
                              suffixIcon: Icon(Icons.description_outlined),
                              isDense: true,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
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
                      ]),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //     padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  //     child: TextFormField(
                  //       controller: _searchTextController,
                  //       onChanged: (value) async {
                  //         if (value != '') {
                  //           CompanyList.companies.forEach((element) {
                  //             if (element.name.contains(value.toLowerCase())) {
                  //               ref
                  //                   .watch(_searchtab.notifier)
                  //                   .state
                  //                   .add(element.name);
                  //               print(ref.watch(_searchtab.notifier).state);
                  //             }
                  //           });
                  //         } else {
                  //           CompanyList.companies;
                  //         }
                  //       },
                  //       decoration: InputDecoration(
                  //           hintText: 'Rechercher une entreprise',
                  //           suffixIcon: Icon(Icons.search_rounded)),
                  //     )),
                  CompanyList.companies.length > 0
                      ? Expanded(
                          child: AnimationLimiter(
                            child: ListView.builder(
                                itemCount: CompanyList.companies.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    child: SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                          child: CardCompany(
                                              company: CompanyList
                                                  .companies[index])),
                                    ),
                                  );
                                }),
                          ),
                        )
                      : Center(
                          child: Column(
                          children: [
                            CircularProgressIndicator(
                              backgroundColor: AppColors.mainColor,
                              strokeWidth: 1,
                            ),
                          ],
                        )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (_image == null) {
      return Icon(
        Icons.photo_camera,
        color: Colors.grey[200],
        size: 50,
      );
    } else {
      return Image.file(_image!, fit: BoxFit.cover);
    }
  }
}
