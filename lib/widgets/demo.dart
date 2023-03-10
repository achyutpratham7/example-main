import 'package:flutter/material.dart';

class CardsHolderWidget extends StatefulWidget {
  const CardsHolderWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CardsHolderWidgetState();
}

class _CardsHolderWidgetState extends State<CardsHolderWidget> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => setState(() => selected = index),
        child: CardWidget(selected == index, '$index'),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final bool selected;
  final String index;

  const CardWidget(this.selected, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected ? Colors.red : Colors.blue,
      child: Text(index),
    );
  }
}
