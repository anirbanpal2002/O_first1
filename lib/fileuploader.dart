// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class Fileuploader extends StatefulWidget {
//   const Fileuploader({super.key});
//
//   @override
//   State<Fileuploader> createState() => _FileuploaderState();
// }
//
// class _FileuploaderState extends State<Fileuploader> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: Text("File Uploader")),
//         body: ElevatedButton(onPressed: () {}, child: Text("File Upload")),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileUploader extends StatefulWidget {
  @override
  _FileUploaderState createState() => _FileUploaderState();
}

class _FileUploaderState extends State<FileUploader> {
  List<String> uploadedFiles = [];

  Future<void> requestPermission() async {
    if (Platform.isAndroid) {
      await Permission.storage.request();
    }
  }

  Future<void> pickSingleFile() async {
    await requestPermission();
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      await saveFileToLocalStorage(result.files.single);
    }
  }

  Future<void> pickMultipleFiles() async {
    await requestPermission();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      for (var file in result.files) {
        if (file.path != null) {
          await saveFileToLocalStorage(file);
        }
      }
    }
  }

  Future<void> saveFileToLocalStorage(PlatformFile file) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final savedFile = File('${appDocDir.path}/${file.name}');

    await savedFile.writeAsBytes(File(file.path!).readAsBytesSync());

    setState(() {
      uploadedFiles.add(savedFile.path);
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Saved: ${file.name}')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter File Uploader',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickSingleFile,
              child: Text('Upload Single File'),
            ),
            ElevatedButton(
              onPressed: pickMultipleFiles,
              child: Text('Upload Multiple Files'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: uploadedFiles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(uploadedFiles[index].split('/').last),
                    subtitle: Text(uploadedFiles[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
