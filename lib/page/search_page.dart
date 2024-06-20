import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.shower),
              border: OutlineInputBorder(),
              label: Text("Search"),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   width: double.maxFinite,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       IconButton.filled(
                //         style: IconButton.styleFrom(
                //           padding: EdgeInsets.all(16.0),
                //         ),
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //         icon: Icon(Icons.arrow_back),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 32.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
