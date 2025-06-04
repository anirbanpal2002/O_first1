import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crop_your_image/crop_your_image.dart';

class Imagecropper extends StatefulWidget {
  const Imagecropper({super.key});

  @override
  State<Imagecropper> createState() => _ImagecropperState();
}

class _ImagecropperState extends State<Imagecropper> {
  Uint8List? uintImage;
  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  final _controller = CropController();

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      imageFile = pickedFile!;
    });
    uintImage = await imageFile!.readAsBytes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Crop UI'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          uintImage != null
              ? Image.memory(uintImage!, height: 300)
              : Placeholder(fallbackHeight: 300),
          SizedBox(height: 20),
          Container(
            width: 200,
            child: Card(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => takePhoto(ImageSource.camera),
                    icon: Icon(Icons.camera_alt),
                    label: Text('Camera'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => takePhoto(ImageSource.gallery),
                    icon: Icon(Icons.photo),
                    label: Text('Gallery'),
                  ),

                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.rotate_right),
                    label: Text('Rotate'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return Column(
                            children: [
                              Expanded(
                                child: Crop(
                                  image: uintImage!,
                                  controller: _controller,
                                  onCropped: (result) {
                                    switch (result) {
                                      case CropSuccess(:final croppedImage):
                                        setState(() {
                                          uintImage = croppedImage;
                                        });
                                      case CropFailure(:final cause):
                                      // do something with error
                                    }
                                  },
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.crop();
                                  Navigator.pop(context);
                                },
                                child: Text("preview"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Crop"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
