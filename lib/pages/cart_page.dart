import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "DEPLOYMENT QUEUE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2),
        ),
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF161B22),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.tealAccent.withOpacity(0.5)),
            ),
            child: const Icon(Icons.arrow_back_ios_new, size: 14, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(
              child: Text(
                "Queue is empty.",
                style: TextStyle(color: Colors.white54, fontSize: 16),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return Card(
                      color: const Color(0xFF161B22),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(item.product.assetPath, width: 50, height: 50, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.title,
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$${(item.product.price * item.quantity).toStringAsFixed(2)}",
                                    style: const TextStyle(color: Colors.tealAccent, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            
                            // MİKTAR KONTROLÜ (+ VE - BUTONLARI)
                            Row(
                              children: [
                                // EKSİ (-) BUTONU
                                _buildCircularButton(
                                  icon: Icons.remove,
                                  color: Colors.white54,
                                  onTap: () => cart.updateQuantity(item.product, item.quantity - 1),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "${item.quantity}",
                                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                
                                // ARTI (+) BUTONU
                                _buildCircularButton(
                                  icon: Icons.add,
                                  color: Colors.tealAccent,
                                  onTap: () => cart.updateQuantity(item.product, item.quantity + 1),
                                ),
                                
                                const SizedBox(width: 8),
                                
                                // SİLME (ÇÖP KUTUSU)
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                                  onPressed: () => cart.removeFromCart(item.product),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              // TOPLAM PANELİ
              Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("TOTAL PRICE", style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(
                          "\$${cart.totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(color: Colors.tealAccent, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      child: const Text("DEPLOY", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // YUVARLAK BUTON TASARIMI
  Widget _buildCircularButton({required IconData icon, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color.withOpacity(0.4), width: 1),
        ),
        child: Icon(icon, color: color, size: 16),
      ),
    );
  }
}