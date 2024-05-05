import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vixor_project/const/reusable.dart';
import 'package:vixor_project/cubit/cashe%20helper.dart';

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
      appBar: AppBar(
        title:  Text("46".tr,style: const TextStyle(color: Color(0xff8E4F2E))),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () async {
                if(like.isNotEmpty){
                  await Share.shareXFiles(like,
                      subject: 'Look what I made!');
                }
              },
              child: const Card(
                elevation: 10,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    IconlyLight.send,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
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
                }else{
                  indexForImages.remove(index);
                  like.remove(like[index]);
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
                        onTap: (){
                          setState(() {
                            images.remove(images[index]);
                            indexForImages.remove(index);
                            CachHelper.saveImages(key: 'images', value: images);
                          });
                        },
                        child: const Icon(Icons.delete_outline,color: Colors.red,size: 28,))),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () => _pickImage(ImageSource.gallery),
            tooltip: '48'.tr,
            child: const Icon(Icons.photo_library),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () => _pickImage(ImageSource.camera),
            tooltip: '49'.tr,
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
