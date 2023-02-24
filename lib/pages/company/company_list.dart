// import 'package:digitalbank/controllers/transaction_controller.dart';
// import 'package:digitalbank/pages/colors/color.dart';
// import 'package:digitalbank/pages/company/compay_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// class CompanyList extends ConsumerStatefulWidget {
//   const CompanyList({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CompanyListState();
// }

// class _CompanyListState extends ConsumerState<CompanyList> {
//   @override
//   Widget build(BuildContext context) {
//     final CompanyList = ref.watch(GlobalProviders);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text("Actif compte"),
//         centerTitle: true,
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           CompanyList.getallcompany();
//         },
//         child: Column(
//           children: [
//             CompanyList.companies.length > 0
//                 ? Expanded(
//                     child: AnimationLimiter(
//                       child: ListView.builder(
//                           itemCount: CompanyList.companies.length,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return AnimationConfiguration.staggeredList(
//                               position: index,
//                               duration: const Duration(milliseconds: 375),
//                               child: SlideAnimation(
//                                 verticalOffset: 50.0,
//                                 child: FadeInAnimation(
//                                     child: CardCompany(
//                                         company: CompanyList.companies[index])),
//                               ),
//                             );
//                           }),
//                     ),
//                   )
//                 : Center(
//                     child: CircularProgressIndicator(
//                     backgroundColor: AppColors.mainColor,
//                     strokeWidth: 2,
//                   )),
//           ],
//         ),
//       ),
//     );
//   }
// }
