import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomTextEditor extends StatefulWidget {
  const CustomTextEditor({super.key});

  @override
  State<CustomTextEditor> createState() => _CustomTextEditorState();
}

class _CustomTextEditorState extends State<CustomTextEditor> {
  final TextEditingController _controller = TextEditingController();
  bool _isBold = false;
  bool _isItalic = false;
  bool _isUpperCase = false;
  TextAlign _alignment = TextAlign.left;
  double _fontSize = 16;
  File? _image;
  String? _link;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  Widget _buildTextPreview() {
    String text = _controller.text;
    if (_isUpperCase) text = text.toUpperCase();
    if (_link != null && _link!.isNotEmpty) {
      return GestureDetector(
        onTap: () => print('Navigate to $_link'),
        child: Text(
          text,
          textAlign: _alignment,
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
            fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Text(
      text,
      textAlign: _alignment,
      style: TextStyle(
        fontSize: _fontSize,
        fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: _isItalic ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }

  void _setHeading(int level) {
    setState(() {
      switch (level) {
        case 1:
          _fontSize = 32;
          break;
        case 2:
          _fontSize = 28;
          break;
        case 3:
          _fontSize = 24;
          break;
        case 4:
          _fontSize = 20;
          break;
        case 5:
          _fontSize = 18;
          break;
        default:
          _fontSize = 16;
      }
    });
  }

  void _promptForLink() async {
    final url = await showDialog<String>(
      context: context,
      builder: (context) {
        final TextEditingController linkCtrl = TextEditingController();
        return AlertDialog(
          title: const Text('Add Link'),
          content: TextField(
            controller: linkCtrl,
            decoration: const InputDecoration(hintText: 'Enter URL'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, linkCtrl.text),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    if (url != null) {
      setState(() => _link = url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Text Editor')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              children: [
                IconButton(
                  icon: const Icon(Icons.format_bold),
                  onPressed: () => setState(() => _isBold = !_isBold),
                ),
                IconButton(
                  icon: const Icon(Icons.format_italic),
                  onPressed: () => setState(() => _isItalic = !_isItalic),
                ),
                IconButton(
                  icon: const Icon(Icons.text_fields),
                  onPressed: () => setState(() => _isUpperCase = !_isUpperCase),
                ),
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: _pickImage,
                ),
                IconButton(
                  icon: const Icon(Icons.link),
                  onPressed: _promptForLink,
                ),
                PopupMenuButton<int>(
                  onSelected: _setHeading,
                  itemBuilder:
                      (_) => List.generate(5, (i) {
                        final level = i + 1;
                        return PopupMenuItem(
                          value: level,
                          child: Text('H$level'),
                        );
                      }),
                  child: const Icon(Icons.title),
                ),
                PopupMenuButton<TextAlign>(
                  onSelected: (align) => setState(() => _alignment = align),
                  itemBuilder:
                      (_) => [
                        const PopupMenuItem(
                          value: TextAlign.left,
                          child: Text('Left'),
                        ),
                        const PopupMenuItem(
                          value: TextAlign.center,
                          child: Text('Center'),
                        ),
                        const PopupMenuItem(
                          value: TextAlign.right,
                          child: Text('Right'),
                        ),
                      ],
                  child: const Icon(Icons.format_align_left),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your text...',
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              'Preview:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTextPreview(),
            if (_image != null) ...[
              const SizedBox(height: 10),
              Image.file(_image!, height: 200),
            ],
          ],
        ),
      ),
    );
  }
}
