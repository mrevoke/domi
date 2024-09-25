import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'image_scroll.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.1,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            children: [
              _buildHeader(),
              _buildSection(context, Constants.sectionTitle1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HorizontalImageScroll(),
              ),
              const SizedBox(height: 20),
              _buildSection(context, Constants.sectionTitle2),
              _buildSearchField(),
              _buildDocItems(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Container(
        height: 5,
        width: 40,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search docs',
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildDocItems() {
    return Column(
      children: [
        _buildDocItem('100 Martinique Ave Title', 'Dec 4, 2023'),
        _buildDocItem('Chase Bank Statement - November 2023', 'Dec 3, 2023'),
        _buildDocItem('Backyard Remodel Renderings', 'Nov 11, 2023'),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _buildDocItem(String title, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: ListTile(
          leading: const Icon(Icons.insert_drive_file, color: Colors.red),
          title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
          subtitle: Text('Opened $date', style: const TextStyle(color: Colors.grey, fontSize: 12)),
          dense: true,
        ),
      ),
    );
  }
}
