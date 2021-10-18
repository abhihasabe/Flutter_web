import 'package:flutter/material.dart';

class DashboardAutoComplete extends StatefulWidget {
  const DashboardAutoComplete({Key? key}) : super(key: key);

  @override
  _DashboardAutoCompleteState createState() => _DashboardAutoCompleteState();
}

class Continent {
  const Continent({
    required this.name,
    required this.size,
  });

  final String name;
  final int size;

  @override
  String toString() {
    return '$name ($size)';
  }
}

const List<Continent> continentOptions = <Continent>[
  Continent(name: 'one', size: 30370000),
  Continent(name: 'two', size: 14000000),
  Continent(name: 'three', size: 44579000),
  Continent(name: 'four', size: 8600000),
  Continent(name: 'five', size: 10180000),
];

class _DashboardAutoCompleteState extends State<DashboardAutoComplete> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<Continent>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return continentOptions
            .where((Continent continent) => continent.name
                .toLowerCase()
                .startsWith(textEditingValue.text.toLowerCase()))
            .toList();
      },
      displayStringForOption: (Continent option) => option.name,
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,

          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.all(5),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          // style: const TextStyle(fontWeight: FontWeight.bold),
        );
      },
      onSelected: (Continent selection) {
        print('Selected: ${selection.name}');
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Continent> onSelected,
          Iterable<Continent> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              width: 300,
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final Continent option = options.elementAt(index);

                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(option.name,
                          style: const TextStyle(color: Colors.black)),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
