import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sepetim")),
      body: cartItems.isEmpty
          ? const Center(child: Text("Sepetiniz boş"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(item.name),
                        subtitle: Text("\$${item.price}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Toplam Tutar:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("\$${totalPrice.toStringAsFixed(2)}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
                          onPressed: () {},
                          child: const Text("ÖDEME YAP"),
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