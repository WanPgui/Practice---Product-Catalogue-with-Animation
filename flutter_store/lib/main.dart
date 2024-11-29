import 'package:flutter/material.dart';
import 'theme.dart'; // Ensure you have a theme.dart file
import 'product.dart'; // Ensure you have a product.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Store',
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: CatalogPage(
        toggleTheme: toggleTheme,
        isDarkMode: isDarkMode,
      ),
    );
  }
}

class CatalogPage extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const CatalogPage(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: 'Product 1',
        imageUrl:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fillustration%2Fproduct-icon.html&psig=AOvVaw3Qpe4ZerxR0xjdfK9Zj8F5&ust=1732988721645000&source=images&cd=vfe&opi=89978449&ved=0CBcQjhxqFwoTCIDUwZuMgooDFQAAAAAdAAAAABAQ',
        price: 29.99,
      ),
      Product(
        name: 'Product 2',
        imageUrl:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fillustration%2Fproduct-icon.html&psig=AOvVaw3Qpe4ZerxR0xjdfK9Zj8F5&ust=1732988721645000&source=images&cd=vfe&opi=89978449&ved=0CBcQjhxqFwoTCIDUwZuMgooDFQAAAAAdAAAAABAQ',
        price: 19.99,
      ),
      Product(
        name: 'Product 3',
        imageUrl:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fillustration%2Fproduct-icon.html&psig=AOvVaw3Qpe4ZerxR0xjdfK9Zj8F5&ust=1732988721645000&source=images&cd=vfe&opi=89978449&ved=0CBcQjhxqFwoTCIDUwZuMgooDFQAAAAAdAAAAABAQ',
        price: 39.99,
      ),
      Product(
        name: 'Product 4',
        imageUrl:
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fillustration%2Fproduct-icon.html&psig=AOvVaw3Qpe4ZerxR0xjdfK9Zj8F5&ust=1732988721645000&source=images&cd=vfe&opi=89978449&ved=0CBcQjhxqFwoTCIDUwZuMgooDFQAAAAAdAAAAABAQ',
        price: 49.99,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Store'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(product.name),
                    content: Text('\$${product.price.toStringAsFixed(2)}'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text('\$${product.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
