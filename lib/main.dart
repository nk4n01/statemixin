import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/photos_binding.dart';
import 'pages/photos_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'StateMixin',
      initialRoute: '/photos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: '/photos',
          page: () => PhotosPage(),
          binding: PhotosBinding(),
        ),
      ],
    );
  }
}
