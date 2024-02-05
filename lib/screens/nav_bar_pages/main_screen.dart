import 'package:flutter/material.dart';
import 'package:task1/widgets/item_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> productNames = [
    "iphone X",
    "iphone X Max",
    "iphone Xs",
    "iphone Xs Max",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productNames.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(
          productNames[index],
          productName: null,
        );
      },
    );
  }
}
