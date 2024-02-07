import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(String productNam, {super.key, required productName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green[400], borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.shopify),
            const Text("Item"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const Text("100\$"),
          ],
        ),
      ),
    );
  }
}
