import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/dummy_data.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Product> displayedProducts = allProducts;
  String selectedCategory = "Hepsi";
  String searchQuery = "";

  void filterProducts() {
    setState(() {
      displayedProducts = allProducts.where((p) {
        bool matchesCategory = selectedCategory == "Hepsi" || p.category == selectedCategory;
        bool matchesSearch = p.name.toLowerCase().contains(searchQuery.toLowerCase());
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GIFT STORE", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())).then((_) => setState(() {})),
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    child: Text("${cartItems.length}", style: const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) {
                  searchQuery = value;
                  filterProducts();
                },
                decoration: InputDecoration(
                  hintText: "Ürün ara...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: ["Hepsi", "Telefon", "Bilgisayar", "Aksesuar", "Saat"].map((cat) {
                  bool isSelected = selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      onSelected: (val) {
                        setState(() {
                          selectedCategory = cat;
                          filterProducts();
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: displayedProducts.length,
              itemBuilder: (context, index) => ProductCard(
                product: displayedProducts[index],
                onNotify: () => setState(() {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}