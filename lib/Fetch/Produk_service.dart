import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> Produk() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return jsonData['products'];
  } else {
    throw Exception('gagal Dimuat');
  }
}

