import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vixor_project/cubit/cashe%20helper.dart';
import 'package:vixor_project/utils/app_imagse.dart';
class Photobook extends StatefulWidget {
  const Photobook({super.key});

  @override
  State<Photobook> createState() => _PhotobookState();
}

class _PhotobookState extends State<Photobook> {
  final List<XFile> _imageFiles = [];
  final List<XFile> like = [];
  List<String> images = [];
  List<int> indexForImages = [];

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imageFiles.add(pickedImage);
        images.add(pickedImage.path);
        CachHelper.saveImages(key: 'images', value: images);
      });
    }
  }

  @override
  void initState() {
    images = CachHelper.getImages(key: 'images')!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          // Background image
          Image.asset(
            Assets.wall, // Replace with your image asset path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Semi-transparent color overlay
          Container(
            color: const Color(0xFF8D502F).withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          // Grid view of images
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    if (!indexForImages.contains(index)) {
                      indexForImages.add(index);
                      like.add(XFile(images[index]));
                    } else {
                      indexForImages.remove(index);
                      like.remove(XFile(images[index]));
                    }
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.file(File(images[index])),
                    indexForImages.contains(index)
                        ? const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    )
                        : const SizedBox.shrink(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              images.removeAt(index);
                              indexForImages.remove(index);
                              CachHelper.saveImages(
                                  key: 'images', value: images);
                            });
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.amber,
                            size: 28,
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor:Colors.white,
            shape: const CircleBorder(),
            onPressed: () async {
              if (like.isNotEmpty) {
                await Share.shareXFiles(like, subject: 'Look what I made!');
              }
            },
            tooltip: 'Send',
            child: const Icon(IconlyLight.send, color: Color(0xFF8D502F)),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
              backgroundColor:Colors.white,
              shape: const CircleBorder(),
              onPressed: () => _pickImage(ImageSource.gallery),
              tooltip: '48'.tr,
              child: const Icon(Icons.photo_library,  color: Color(0xFF8D502F))
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            backgroundColor:Colors.white,
            shape: const CircleBorder(),
            onPressed: () => _pickImage(ImageSource.camera),
            tooltip: '49'.tr,
            child: const Icon(Icons.camera_alt, color: Color(0xFF8D502F)),
          ),

        ],
      ),
    );
  }
}
