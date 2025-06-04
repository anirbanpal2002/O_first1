import 'package:flutter/material.dart';

class Autocompletesearch extends StatefulWidget {
  const Autocompletesearch({super.key});

  @override
  State<Autocompletesearch> createState() => _AutocompletesearchState();
}

const List<String> _kOptions = <String>[
  'andrew',
  'Ben',
  'Cameron',
  'David',
  'Faf',
  'Grame',
];

class _AutocompletesearchState extends State<Autocompletesearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Autocompletesearch"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }
              return _kOptions.where(
                (String item) => item.toLowerCase().contains(
                  textEditingValue.text.toLowerCase(),
                ),
              );
            },
            onSelected: (String selection) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You selected: $selection')),
              );
            },
            fieldViewBuilder: (
              context,
              controller,
              focusNode,
              onFieldSubmitted,
            ) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  labelText: 'Search fruits',
                  border: OutlineInputBorder(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
