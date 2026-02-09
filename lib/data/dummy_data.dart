import '../models/product.dart';

final List<Product> allProducts = [
Product(
    id: 1, 
    name: "iPhone 15 Pro", 
    description: "Titanyum tasarım, A17 Pro çip ve en gelişmiş iPhone kamera sistemi.", 
    price: 999.0, 
    category: "Telefon", 
    imageUrl: "https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_120148186?x=536&y=402&format=jpg&quality=80&sp=yes&strip=yes&trim&ex=536&ey=402&align=center&resizesource&unsharp=1.5x1+0.7+0.02&cox=0&coy=0&cdx=536&cdy=402"),
  Product(
    id: 2, 
    name: "Macbook Pro M4", 
    description: "M4 çipli profesyonel güç ve Liquid Retina XDR ekran.", 
    price: 1599.0, 
    category: "Bilgisayar", 
    imageUrl: "https://images.pexels.com/photos/18105/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=800"
  ),
  Product(
    id: 3, 
    name: "AirPods Pro 2", 
    description: "Aktif gürültü engelleme ve uzamsal ses deneyimi.", 
    price: 249.0, 
    category: "Aksesuar", 
    imageUrl: "https://images.pexels.com/photos/3780681/pexels-photo-3780681.jpeg?auto=compress&cs=tinysrgb&w=800"
  ),
  Product(
    id: 4, 
    name: "Apple Watch Ultra", 
    description: "En zorlu şartlar için tasarlanmış dayanıklı akıllı saat.", 
    price: 799.0, 
    category: "Saat", 
    imageUrl: "https://images.pexels.com/photos/437037/pexels-photo-437037.jpeg?auto=compress&cs=tinysrgb&w=800"
  ),
  Product(
    id: 5, 
    name: "Samsung S24 Ultra", 
    description: "AI özellikli amiral gemisi ve 200MP kamera.", 
    price: 1199.0, 
    category: "Telefon", 
    imageUrl: "https://images.pexels.com/photos/404280/pexels-photo-404280.jpeg?auto=compress&cs=tinysrgb&w=800"
  ),
];

List<Product> cartItems = [];