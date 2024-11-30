import 'package:flutter/material.dart';
import 'details_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// Home Screen with a List of Clothing Items
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> clothingItems = const [
    {
      'name': 'T-shirt',
      'image': 'https://hips.hearstapps.com/bestproducts/assets/16/32/1470926030-jcrew-new-york-graphic-tee-shirt.jpg',
      'description': 'A comfortable cotton T-shirt.',
      'price': '\$20',
    },
    {
      'name': 'Jeans',
      'image': 'https://rollasjeans.com/_next/image?url=https%3A%2F%2Fcdn.shopify.com%2Fs%2Ffiles%2F1%2F0258%2F5896%2F5558%2Ffiles%2F13497L-5369-BRAD-BLUE_925.jpg%3Fv%3D1719970050&w=3840&q=80',
      'description': 'Stylish blue denim jeans.',
      'price': '\$50',
    },
    {
      'name': 'Sneakers',
      'image': 'https://d1lfxha3ugu3d4.cloudfront.net/exhibitions/images/2015_Sneaker_Culture_1._AJ_1_from_Nike_4000W.jpg.jpg',
      'description': 'Trendy and durable sneakers.',
      'price': '\$95',
    },
    {
      'name': 'Jacket',
      'image': 'https://aveclesfilles.com/cdn/shop/files/83594_womens_genuine_leather_belted_black_jacket_Avec_Les_Filles.jpg?v=1724431378&width=1200',
      'description': 'Stylish leather jacket.',
      'price': '\$100',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index: 212004'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 3 / 4,
        ),
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            elevation: 4,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      name: item['name']!,
                      image: item['image']!,
                      description: item['description']!,
                      price: item['price']!,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      item['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}