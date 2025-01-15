// import 'package:flutter/material.dart';
// import 'package:molah_animals_ecosystem/models/container.dart';
// import 'package:molah_animals_ecosystem/models/container_select_connection.dart';

// class SelectConnection extends StatefulWidget {
//   const SelectConnection({super.key});

//   @override
//   State<SelectConnection> createState() => _SelectConnectionState();
// }

// class _SelectConnectionState extends State<SelectConnection> {
//   final List<int> _selectedIndices = []; // Track selected indices

//   void _toggleSelection(int index) {
//     setState(() {
//       if (_selectedIndices.contains(index)) {
//         // Deselect if already selected
//         _selectedIndices.remove(index);
//       } else if (_selectedIndices.length < 2) {
//         // Select if less than 2 items are already selected
//         _selectedIndices.add(index);
//       }
//       // If already two selected, do nothing
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         leading: buildIconBack(context),
//         actions: [buildNextbuton("Save")],
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               buildText("Select connections"),
//               SizedBox(height: height * 0.1),
//               // First Container
//               ContainerSelectConnection(
//                 text: "Producers",
//                 isSelected: _selectedIndices.contains(0),
//                 onTap: () => _toggleSelection(0),
//               ),
//               SizedBox(height: height * 0.02),
//               // Second Container
//               ContainerSelectConnection(
//                 text: "Consumers",
//                 isSelected: _selectedIndices.contains(1),
//                 onTap: () => _toggleSelection(1),
//               ),
//               SizedBox(height: height * 0.02),
//               // Third Container (Example)
//               ContainerSelectConnection(
//                 text: "Decomposers",
//                 isSelected: _selectedIndices.contains(2),
//                 onTap: () => _toggleSelection(2),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
