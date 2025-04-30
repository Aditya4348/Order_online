import 'package:flutter/material.dart';

class History extends StatefulWidget {
  final List<Map<String, dynamic>> cart;

  const History({super.key, required this.cart});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late List<Map<String, dynamic>> localCart;

  @override
  void initState() {
    super.initState();
    localCart = List.from(widget.cart); // Buat salinan agar bisa diubah
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Keranjang'),
            Text("Total Belanja:200k"),
          ],
        ),
      ),
      body: localCart.isEmpty
          ? const Center(child: Text('Keranjang Kosong'))
          : ListView.builder(
              itemCount: localCart.length,
              itemBuilder: (context, index) {
                final item = localCart[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: Text(item['title']),
                    subtitle: Text('Rp ${item['price']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          localCart.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
