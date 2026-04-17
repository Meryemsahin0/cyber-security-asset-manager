import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/cart.dart';
import 'cart_page.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117), // Kali Dark Theme
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ÜST KISIM: Görsel ve Yuvarlak Butonlar
          Stack(
            children: [
              Hero(
                tag: product.id,
                child: Image.asset(
                  product.assetPath,
                  width: double.infinity,
                  height: 250, // Boşluğu azaltmak için sabit yükseklik
                  fit: BoxFit.cover,
                ),
              ),
              // BACK BUTTON (Yuvarlak ve Şık)
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.tealAccent.withOpacity(0.5)),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.white),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              // CART BUTTON (Yuvarlak ve Şık)
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.tealAccent.withOpacity(0.5)),
                    ),
                    child: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.tealAccent),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  ),
                ),
              ),
            ],
          ),

          // İÇERİK BÖLÜMÜ (Resmin hemen altında, sıfır boşluk)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 0), // Üst boşluk sadece 15
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Başlık ve Fiyat yan yana
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 26, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 22, 
                        color: Colors.tealAccent, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 5), // İsim ve Kategori arası minimal boşluk
                
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    product.category.toUpperCase(),
                    style: const TextStyle(color: Colors.tealAccent, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 20), // Açıklama başlığına geçiş

                const Text(
                  "DESCRIPTION",
                  style: TextStyle(
                    fontSize: 14, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.grey,
                    letterSpacing: 1.2,
                  ),
                ),
                
                const SizedBox(height: 8),

                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16, 
                    color: Colors.white70, 
                    height: 1.4, // Okunabilirlik için satır aralığı
                  ),
                ),
              ],
            ),
          ),

          const Spacer(), // Butonu en alta iter

          // ADD TO CART BUTTON
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 10,
                ),
                onPressed: () {
                  context.read<Cart>().addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.tealAccent,
                      content: Text(
                        "${product.title} deployed to queue!",
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart, size: 20),
                label: const Text(
                  "ADD TO DEPLOYMENT",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}