import 'package:flutter/material.dart';
import '../models/chip_model.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}
class _MyHomePageState extends State<MyHomePage> {
  final List<ItemModel> _chips = [
    ItemModel("Android", Colors.green, false),
    ItemModel("Flutter", Colors.blueGrey, false),
    ItemModel("Ios", Colors.deepOrange, false),
    ItemModel("Python", Colors.cyan, false),
    ItemModel("React JS", Colors.teal, false),
  ];

  final List<String> _textChips = [
    "Android",
    "Flutter",
    "Ios",
    "Python",
    "React JS",
    'Dart',
    'Django'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Flutter Input Chip Demo"),
      ),
      body: Center(
          child: Column(
        children: [
          Wrap(
            spacing: 10,
            children: _chips
                .map((e) => InputChip(
                      label: Text(e.label),
                      labelStyle: const TextStyle(color: Colors.white),
                      backgroundColor: e.color,
                      selected: e.isSelected,
                      selectedColor: Colors.red,
                      onSelected: (bool value) {
                        setState(() {
                          e.isSelected = value;
                        });
                      },
                    ))
                .toList(),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: itemsChips(),
          ),
          // selectable text chips
          Wrap(
            direction: Axis.horizontal,
            children: selectableTextChips(),
          ),
        ],
      )),
    );
  }

  List<Widget> selectableTextChips() {
    List<Widget> textChips = [];

    for (var i = 0; i < _textChips.length; i++) {
      textChips.add(
        InputChip(
          label: Text(_textChips[i]),
          selected: _textChips[i] == "Android",
          onSelected: (bool value) {
            setState(() {
              _textChips[i] = "Android";
            });
          },
          onDeleted: () {
            setState(() {
              _textChips.removeAt(i);
            });
          },
        ),
      );
    }
    return textChips;
  }

  List<Widget> itemsChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chips.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: InputChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              _chips[i].label[0].toUpperCase(),
            ),
          ),
          label: Text(_chips[i].label),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: _chips[i].color,
          selected: _chips[i].isSelected,
          selectedColor: Colors.black54,
          deleteIcon: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10,
            child: Icon(
              Icons.close,
              size: 15,
              color: Colors.red,
            ),
          ),
          deleteIconColor: Colors.red,
          onDeleted: () {
            setState(() {
              _chips.removeAt(i);
            });
          },
          onSelected: (bool value) {
            setState(() {
              _chips[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
