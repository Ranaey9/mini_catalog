import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onNotify;

  const ProductCard({super.key, required this.product, required this.onNotify});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsScreen(product: product)),
      ).then((_) => onNotify()),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(product.imageUrl, fit: BoxFit.cover, width: double.infinity),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
                  Text("\$${product.price}", style: const TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}