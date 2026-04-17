import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    // Uygulamanın en tepesine sepeti (Cart) koyuyoruz ki her sayfa erişebilsin
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // O sağ üstteki kırmızı bandı kaldırır
      title: 'Security Assets',
      theme: ThemeData.dark(), // Kali'ye yakışır karanlık tema
      home: const HomePage(),
    );
  }
}