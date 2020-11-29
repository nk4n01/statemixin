import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_mixin_ex/controllers/photos_controller.dart';

class PhotosPage extends GetView<PhotosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: controller.obx(
        (state) {
          return ListView.builder(
            controller: controller.scrollController,
            itemCount: state.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == state.length) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: CupertinoActivityIndicator(
                    radius: 20,
                  ),
                );
              }
              final photo = state[index];
              return Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Image.network(
                        photo.url,
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Text(photo.title),
                    ],
                  ),
                  Text(
                    '${index + 1}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 60),
                  ),
                ],
              );
            },
          );
        },
        onLoading: Center(child: CircularProgressIndicator()),
        onError: (error) {
          return Center(
            child: Text(
              'Error: $error',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
