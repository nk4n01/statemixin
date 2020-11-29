import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class PhotosController extends GetxController with StateMixin<List<Photo>> {
  ScrollController scrollController;
  int albumId = 1;
  List<Photo> photos = [];

  @override
  void onInit() {
    scrollController = ScrollController();

    getPhotos();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print(scrollController.position.pixels);
        print(scrollController.position.maxScrollExtent);
        albumId++;
        getPhotos();
      }
    });
    super.onInit();
  }

  Future<void> getPhotos() async {
    final String url =
        'https://jsonplaceholder.typicode.com/photos/?albumId=$albumId';

    await Future.delayed(Duration(seconds: 1));

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        List<Photo> data = Photo.listFromJson(responseBody);
        photos.addAll(data);
        change(photos, status: RxStatus.success());
      } else {
        final String errMessage =
            'statusCode: ${response.statusCode}\nreason: ${response.reasonPhrase}';
        change(null, status: RxStatus.error(errMessage));
      }
    } catch (e) {
      print(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
