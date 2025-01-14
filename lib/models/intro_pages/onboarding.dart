// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:molah_animals_ecosystem/models/container.dart';
// import 'package:molah_animals_ecosystem/pages/Home.dart';
// import 'package:molah_animals_ecosystem/utils/onboarding_info_page.dart';

// class Onboarding extends StatefulWidget {
//   const Onboarding({super.key});

//   @override
//   _OnboardingState createState() => _OnboardingState();
// }

// class _OnboardingState extends State<Onboarding> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//   bool _bottomSheetShown = false;

//   @override
//   void initState() {
//     super.initState();
//     // Show the bottom sheet on initial load (for the first page)
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (!_bottomSheetShown) {
//         _showBottomSheet();
//         setState(() {
//           _bottomSheetShown = true; // Set the flag to true after showing it
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           GestureDetector(
//             onTap: () {
//               Navigator.pushReplacement(
//                 context,
//                 CupertinoPageRoute(builder: (context) => const Home()),
//               );
//             },
//             child: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 "Skip",
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView(
//               controller: _pageController,
//               onPageChanged: (index) {
//                 setState(() {
//                   _currentPage = index;
//                 });
//                 _showBottomSheet();
//               },
//               children: [
//                 _buildOnboardingPage1(),
//                 _buildOnboardingPage2(),
//                 _buildOnboardingPage3(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Show bottom sheet for the current page
//   void _showBottomSheet() {
//     if (Navigator.of(context).canPop()) {
//       Navigator.of(context).pop();
//     }

//     showModalBottomSheet(
//       isDismissible: false,
//       context: context,
//       isScrollControlled: true, // permite controlul asupra înălțimii
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         final page = onboardingPages[_currentPage];
//         return Container(
//           padding: const EdgeInsets.all(16),
//           height: 250, // Ajustează înălțimea după nevoie
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(20),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 page.title,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 page.info,
//                 style: const TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//               const Spacer(),
//               buildContainer(
//                 context,
//                 _navigateToNextPage,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // Navigate to the next page
//   void _navigateToNextPage() {
//     if (_currentPage < onboardingPages.length - 1) {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeIn,
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         CupertinoPageRoute(
//           builder: (context) => const Home(),
//         ),
//       );
//     }
//   }

//   Widget _buildOnboardingPage1() {
//     return Center();
//   }

//   Widget _buildOnboardingPage2() {
//     return Center();
//   }

//   Widget _buildOnboardingPage3() {
//     return Center();
//   }
// }
