import 'package:flutter/material.dart';
import 'package:dependent_multiselect_search_dropdown/dependent_multiselect_search_dropdown.dart'
    show CascadingDropdown, DropdownController, DropdownItem;

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  final countryController = DropdownController<String>();

  final List<DropdownItem<String>> countries = [
    DropdownItem(id: "1", name: "India", value: "India"),
    DropdownItem(id: "2", name: "United State America", value: "USA"),
    DropdownItem(id: "3", name: "United Kingdom", value: "UK"),
    DropdownItem(id: "4", name: "NewZealand", value: "NZ"),
    DropdownItem(id: "5", name: "Bangladesh", value: "Bangladesh"),
  ];

  @override
  void initState() {
    super.initState();
    countryController.setOptions(List.from(countries));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Searchable Select"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 500,
          child: SingleChildScrollView(
            child: CascadingDropdown<String>(
              controller: countryController,
              hintText: "Select Country",
              searchHint: "Search Country",
              validateHint: "Please select at least one country",
              isMultiSelect: true,
              onItemsChanged: (selectedCountries) {
                // Do something with selectedCountries
                for (var country in selectedCountries) {
                  debugPrint("Selected country: ${country.name}");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
