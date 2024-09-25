import 'package:flutter/material.dart';
import '../widgets/custom_map.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/invite_dialog.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showMap = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appTitle),
        actions: [
          IconButton(
            icon: Icon(showMap ? Icons.arrow_drop_down : Icons.arrow_drop_up),
            onPressed: () => setState(() {
              showMap = !showMap;
            }),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Half-screen map and bottom blue half
          Column(
            children: [
              if (showMap) const Expanded(child: CustomMap()), // Display map in the top half
              Expanded(
                child: Container(
                  color: Colors.blue.shade400, // Bottom half in blue
                ),
              ),
            ],
          ),
          const BottomSheetWidget(), // Refactored bottom sheet
          const InviteDialog(), // Refactored invite dialog
        ],
      ),
    );
  }
}
