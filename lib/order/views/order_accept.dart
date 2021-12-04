// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:merchant/controller/order_controller.dart';

// class OrderAcceptedView extends StatefulWidget {
//   @override
//   _OrderAcceptedViewState createState() => _OrderAcceptedViewState();
// }

// class _OrderAcceptedViewState extends State<OrderAcceptedView> {
//   final orderDetails = Get.find<OrderController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white70,
//       appBar: _appBar(),
//     );
//   }

//   AppBar _appBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       brightness: Brightness.light,
//       elevation: 0,
//       title: Text(
//         '',
//         style: TextStyle(
//             color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//       ),
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.black),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       centerTitle: true,
//     );
//   }
//    Widget body() {
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           Text('Transaction Fee',
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 24,
//                 color: Colors.black,
//               )),
//           Divider(),
//           ListTile(
//             contentPadding: EdgeInsets.all(0),
//             subtitle: Text(
//                 "${orderDetails.orderList[orderDetails.selected].}",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20,
//                 )),
//             title: Text('Amount',
//                 style: TextStyle(
//                   color: Colors.black,
//                 )),
//             // leading: icons[index],
//             // trailing: Text('Completed',
//             //     style: TextStyle(
//             //       fontWeight: FontWeight.w600,
//             //       color: Colors.green,
//             //     ))
//           ),
//           Divider(),
//           Column(children: [
//             Text('Transaction Detaiils',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 24,
//                   color: Colors.black,
//                 )),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Date'),
//                 Text(
//                     "${wallet.top_up_history.value.resultObject![wallet.selected].transDate}",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                     )),
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text('Reference ID'),
//                   flex: 1,
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Text(
//                       '${wallet.top_up_history.value.resultObject![wallet.selected].id}',
//                       textAlign: TextAlign.end,
//                       overflow: TextOverflow.fade,
//                       maxLines: 1,
//                       softWrap: false,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                       )),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Status'),
//                 Text("Completed",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                     )),
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//           ])
//         ],
//       ),
//     );
//   }
// }
