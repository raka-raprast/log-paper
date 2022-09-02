// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:log_paper/function/screen_size.dart';
import 'package:log_paper/models/custom_image.dart';
import 'package:log_paper/style/colors.dart';
import 'package:log_paper/widget/photo_widget.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({Key? key, required this.imageFiles}) : super(key: key);
  final List<CustomImage> imageFiles;
  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  Future<File> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return File("");
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
      return File("");
    }
  }

  Future<File> takeImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return File("");
      final imageTemp = File(image.path);
      return imageTemp;
    } on PlatformException catch (e) {
      log('Failed to take image: $e');
      return File("");
    }
  }

  List<CustomImage> imageFiles = [];
  @override
  void initState() {
    setState(() {
      imageFiles = widget.imageFiles;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: Container()),
          SizedBox(
            height: screenHeight(context) * .75,
            child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(25),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: imageFiles.length < 6 ? 6 : imageFiles.length,
                itemBuilder: (context, i) {
                  return PhotoWidget(
                    imageFile: i < imageFiles.length ? imageFiles[i] : null,
                    onTap: () {},
                    // onHoldTap: (image) {},
                  );
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          Column(
            children: [
              TextButton(
                  onPressed: () async {
                    var val = await showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: darkGrey(),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    var val = await takeImage();
                                    if (val.path.isNotEmpty) {
                                      Navigator.pop(context, val.path);
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(30),
                                      padding: EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: skyBlue()),
                                      child: Icon(
                                        Icons.camera,
                                        size: 50,
                                        color: Colors.white,
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    var val = await pickImage();
                                    if (val.path.isNotEmpty) {
                                      Navigator.pop(context, val.path);
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(30),
                                      padding: EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: skyBlue()),
                                      child: Icon(
                                        Icons.file_copy_rounded,
                                        size: 50,
                                        color: Colors.white,
                                      )),
                                ),
                              ]),
                        );
                      },
                    );
                    if (val.isNotEmpty) {
                      setState(() {
                        imageFiles.add(CustomImage(customImage: val));
                      });
                    }
                  },
                  child: Text("Add Photo")),
              SizedBox(
                height: MediaQuery.of(context).size.height * .025,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context, imageFiles);
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: darkBlue()),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Text("Done")),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
