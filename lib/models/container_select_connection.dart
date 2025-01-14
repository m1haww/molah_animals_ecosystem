// import 'package:flutter/material.dart';

// class ContainerSelectConnection extends StatelessWidget {
//   final String text;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const ContainerSelectConnection({
//     super.key,
//     required this.text,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return GestureDetector(
//         onTap: onTap, // Trigger the parent's onTap callback
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.1),
//                 blurRadius: 3,
//                 offset: const Offset(0, 1),
//               ),
//             ],
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Imaginea
//               Image.asset(
//                 'images/Frame 36.png',
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(width: 8), // Spațiu între imagine și text
//               // Text dinamic
//               const Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "titlu",
//                       style: TextStyle(fontSize: 17, color: Colors.black),
//                     ),
//                     SizedBox(height: 4),
//                     // Text dinamic care poate avea dimensiuni variabile
//                     Text(
//                       'Acesta este un text mai lung care se va ajusta automat.',
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: Color(0xff585858),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Icon-ul final
//               Container(
//                 height: 20,
//                 width: 20,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: isSelected ? Colors.red : Colors.transparent,
//                   image: !isSelected
//                       ? const DecorationImage(
//                           image: AssetImage("images/Status Icon Container.png"),
//                           fit: BoxFit.cover,
//                         )
//                       : null,
//                 ),
//                 child: isSelected
//                     ? const Icon(
//                         Icons.check,
//                         color: Colors.white,
//                         size: 17,
//                       )
//                     : null,
//               ),
//             ],
//           ),
//         ));
//   }
// }
