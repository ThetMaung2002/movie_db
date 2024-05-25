import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/constants/string.dart';
import 'package:movie_db/page/home_page.dart';
import 'package:movie_db/page/saved_page.dart';
import 'package:movie_db/widgets/shared/drawer_ui.dart';
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
    kSaved,
  ];

  final List<Widget> _body = [
    const HomePage(),
    const SavedPage(),
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
        actions: [
          IconButton(
            onPressed: () {
              showDevelopmentDialog(context);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: _body[_index],
      drawer: DrawerUI(
        child: ListView(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 200,

              /// color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      child: Expanded(
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmGV54mXe6z95ZZZ87M46jUldnlsFv7Yfnifrza443HQ&s',
                          width: 76,
                          height: 76,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: const TextUI(label: kTitle),
              titleAlignment: ListTileTitleAlignment.titleHeight,
              leading: const Icon(Icons.home),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: const TextUI(label: kSaved),
              leading: const Icon(Icons.bookmark),
            ),
          ],
        ),
      ),
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
