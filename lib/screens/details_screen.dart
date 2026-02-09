import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/dummy_data.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: Image.network(product.imageUrl, fit: BoxFit.contain)),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("\$${product.price}", style: const TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                Text(product.description),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                    onPressed: () {
                      cartItems.add(product);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ürün sepete eklendi!")));
                      Navigator.pop(context);
                    },
                    child: const Text("SEPETE EKLE"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}