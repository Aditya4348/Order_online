import 'package:flutter/material.dart';
import 'package:awal/Fetch/Produk_service.dart';
import 'package:awal/Page/History.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => HomePage();
}

class HomePage extends State<MyWidget> {
  List<Map<String, dynamic>> cartItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Daftar Produk'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Produk(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('ERROR'));
          } else {
            final produk = snapshot.data!;
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(16),
              children: List.generate(produk.length, (index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.amber[100],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(Icons.shopping_bag, size: 40),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            '${produk[index]['title']}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            '${produk[index]['price']}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                cartItem.add(produk[index]);
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => History(cart: cartItem),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: const Text('Masuk Keranjang'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }
        },
      ),
    );
  }
}
