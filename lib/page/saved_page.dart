import 'package:flutter/material.dart';
import 'package:movie_db/widgets/ui/text_ui.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextUI(label: "Saved Page"),
      ),
    );
  }
}
