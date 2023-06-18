import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './product.dart';

class Products with ChangeNotifier {
  // List<Product> _items = [
  //   Product(
  //     id: 'p1',
  //     title: 'Shoe',
  //     description: 'A nice pair of shoes.!',
  //     price: 29.99,
  //     imageUrl:
  //         'assets/images/shoes.jpg',
  //   ),
  //   Product(
  //     id: 'p2',
  //     title: 'Trousers',
  //     description: 'A nice pair of trousers.',
  //     price: 59.99,
  //     imageUrl:
  //         'assets/images/trousers.jpg',
  //   ),
  //   Product(
  //     id: 'p3',
  //     title: 'Yellow Scarf',
  //     description: 'Warm and cozy - exactly what you need for the winter.',
  //     price: 19.99,
  //     imageUrl:
  //         'assets/images/scarf.jpg',
  //   ),
  //   Product(
  //     id: 'p4',
  //     title: 'A Pan',
  //     description: 'Prepare any meal you want.',
  //     price: 49.99,
  //     imageUrl:
  //         'assets/images/pan.jpg',
  //   ),
  //   Product(
  //     id: 'p5',
  //     title: 'A Chair',
  //     description: 'Comfotable and nice chair.',
  //     price: 120.5,
  //     imageUrl:
  //         'assets/images/chair.jpg',
  //   ),
  //    Product(
  //     id: 'p6',
  //     title: 'A Sofa',
  //     description: 'Comfotable and nice sofa.',
  //     price: 200.55,
  //     imageUrl:
  //         'assets/images/sofa.jpg',
  //   ),
  //    Product(
  //     id: 'p7',
  //     title: 'Sunglasses',
  //     description: 'Comforable and beautiful glasses.',
  //     price: 50.99,
  //     imageUrl:
  //         'assets/images/sunglasses.jpg',
  //   ),
  //   Product(
  //     id: 'p8',
  //     title: 'A Watch',
  //     description: 'Very good watch.',
  //     price: 1000.99,
  //     imageUrl:
  //         'assets/images/watch.jpg',
  //   ),
  //   Product(
  //     id: 'p9',
  //     title: 'A Table',
  //     description: 'Very good table.',
  //     price: 300.99,
  //     imageUrl:
  //         'assets/images/table.jpg',
  //   ),
  //   Product(
  //     id: 'p10',
  //     title: 'A Table',
  //     description: 'Very good table.',
  //     price: 150.99,
  //     imageUrl:
  //         'assets/images/table2.jpg',
  //   ),
  // ];
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Future<void> addProduct(Product product) {
    const url =
        'https://flutter-update-d4823-default-rtdb.asia-southeast1.firebasedatabase.app/products.json';
    return http
        .post(
      Uri.parse(url),
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'isFavorite': product.isFavorite,
      }),
    )
        .then((response) {
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    });
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
