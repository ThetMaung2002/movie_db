import 'package:flutter/material.dart';
import 'package:movie_db/constants/string.dart';
import 'package:movie_db/page/home_page.dart';
import 'package:movie_db/page/search_page.dart';
import 'package:movie_db/widgets/ui/text_ui.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  final int _index = 0;

  final List<String>? title = [
    kTitle,
  ];

  final List<Widget> _body = [
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: TextUI(
          label: title![_index],
        ),
        leading: IconButton(
          onPressed: () {
            showDevelopmentDialog(context);
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: _body[_index],
    );
  }

  Future<dynamic> showDevelopmentDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const TextUI(label: "Search"),
        content: const TextUI(
          label: "This feature is in still under development.",
          fontSize: 16,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const TextUI(
              label: "Close",
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
