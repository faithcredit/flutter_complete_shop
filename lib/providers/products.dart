import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Shoe',
      description: 'A nice pair of shoes.!',
      price: 29.99,
      imageUrl:
          'assets/images/shoes.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'assets/images/trousers.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'assets/images/scarf.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'assets/images/pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'A Chair',
      description: 'Comfotable and nice chair.',
      price: 120.5,
      imageUrl:
          'assets/images/chair.jpg',
    ),
     Product(
      id: 'p6',
      title: 'A Sofa',
      description: 'Comfotable and nice sofa.',
      price: 200.55,
      imageUrl:
          'assets/images/sofa.jpg',
    ),
     Product(
      id: 'p7',
      title: 'Sunglasses',
      description: 'Comforable and beautiful glasses.',
      price: 50.99,
      imageUrl:
          'assets/images/sunglasses.jpg',
    ),
    Product(
      id: 'p8',
      title: 'A Watch',
      description: 'Very good watch.',
      price: 1000.99,
      imageUrl:
          'assets/images/watch.jpg',
    ),
    Product(
      id: 'p9',
      title: 'A Table',
      description: 'Very good table.',
      price: 300.99,
      imageUrl:
          'assets/images/table.jpg',
    ),
    Product(
      id: 'p10',
      title: 'A Table',
      description: 'Very good table.',
      price: 150.99,
      imageUrl:
          'assets/images/table2.jpg',
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

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
