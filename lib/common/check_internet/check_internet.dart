// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class CheckInternet extends StatelessWidget {
//   const CheckInternet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: CustomColors.white,
//         body: SafeArea(
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             alignment: Alignment.center,
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Spacer(),
//                 Lottie.asset(Images.icNoInternet,
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     height: MediaQuery.of(context).size.width * 0.6,
//                     animate: true,
//                     repeat: true),
//                 const SizedBox(height: 20),
//                 Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Text(
//                       L10n.of(context).msgap002,
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       style: TxtStyle.League14w300.copyWith(
//                         fontSize: 16,
//                         color: CustomColors.black333333,
//                       ),
//                     )),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30)
//                         .copyWith(top: 10),
//                     child: Text(
//                       L10n.of(context).msgap001,
//                       maxLines: 3,
//                       textAlign: TextAlign.center,
//                       overflow: TextOverflow.ellipsis,
//                       style: TxtStyle.League14w300.copyWith(
//                         fontSize: 16,
//                         color: CustomColors.black333333,
//                       ),
//                     )),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 30,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     primary: CustomColors.red861E00,
//                   ),
//                   onPressed: () => OpenSettings.openWIFISetting(),
//                   child: Text(
//                     L10n.of(context).msgap003,
//                   ),
//                 ),
//                 const Spacer(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
