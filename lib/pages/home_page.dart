import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart.dart';
import 'detail_page.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Product> get products => const [
        Product(
          id: 1,
          title: "Network Scanner Pro",
          description: "Advanced port scanning and vulnerability assessment tool.",
          assetPath: "assets/images/asset_1.png",
          price: 299.00,
          category: "NETWORK",
        ),
        Product(
          id: 2,
          title: "Firewall Sentinel",
          description: "Robust, enterprise-grade stateful inspection firewall.",
          assetPath: "assets/images/asset_2.png",
          price: 1500.00,
          category: "NETWORK",
        ),
        Product(
          id: 3,
          title: "IDS Sentinel",
          description: "Real-time network intrusion detection system with threat intel.",
          assetPath: "assets/images/asset_3.png",
          price: 850.00,
          category: "NETWORK",
        ),
        Product(
          id: 4,
          title: "CloudGuard AWS",
          description: "Automated security posture management and compliance for AWS.",
          assetPath: "assets/images/asset_4.png",
          price: 1200.00,
          category: "CLOUD",
        ),
        Product(
          id: 5,
          title: "DeepGuard AI",
          description: "AI-powered threat hunting engine for detecting zero-day attacks.",
          assetPath: "assets/images/asset_5.png",
          price: 950.00,
          category: "SECURITY",
        ),
        Product(
          id: 6,
          title: "VoltGo Encryption",
          description: "End-to-end data encryption module for EV infrastructure.",
          assetPath: "assets/images/asset_6.png",
          price: 450.00,
          category: "IOT",
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117), // Kali Dark Theme
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "SECURITY ASSETS",
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 18),
        ),
        actions: [
          // YUVARLAK SEPET İKONU
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.tealAccent.withOpacity(0.5)),
              ),
              child: const Icon(Icons.shopping_bag_outlined,
                  size: 18, color: Colors.tealAccent),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BOŞLUĞU YOK EDEN KISIM
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 5), 
            child: Text(
              "PRODUCTS",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 12),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(product: product)),
                  ),
                  child: Card(
                    color: const Color(0xFF161B22),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          // ÜRÜN RESMİ
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              product.assetPath,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 15),
                          // ÜRÜN BİLGİSİ
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "\$${product.price.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      color: Colors.tealAccent,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          // YUVARLAK EKLEME BUTONU
                          IconButton(
                            icon: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.tealAccent.withOpacity(0.1),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.tealAccent.withOpacity(0.5)),
                              ),
                              child: const Icon(Icons.add,
                                  color: Colors.tealAccent, size: 20),
                            ),
                            onPressed: () {
                              context.read<Cart>().addToCart(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Added to queue"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}