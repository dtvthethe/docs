import 'dart:async';
import 'dart:convert';

class WebJson {
  String _data = '''
    {
      "id": 100,
      "company": {
        "id": 10,
        "name": "N/A Co. LTE"
      },
      "products": [
        {
          "id": 1,
          "name": "Clothe",
          "price": 1000
        },
        {
          "id": 2,
          "name": "Hat",
          "price": 2000
        },
        {
          "id": 1,
          "name": "Accessories",
          "price": 2500
        },
        {
          "id": 1,
          "name": "Skin Care",
          "price": 1500
        },
        {
          "id": 1,
          "name": "Huxley",
          "price": 6000
        }
      ]
    }
  ''';

  Info getInfo() {
    return Info.parseJson(jsonDecode(this._data));
  }
}

class Info {
  late int id;
  late Company company;
  late List<Product> products;

  Info({required this.id, required this.company, required this.products});

  Info.parseJson(Map<String, dynamic> jsonData) {
    this.id = jsonData['id'];
    this.company = Company.parseJson(jsonData['company']);
    this.products = List<Product>.from(jsonData['products']
        .map((productJson) => Product.parseJson(productJson)));
  }
}

class Company {
  late int id;
  late String name;

  Company({required this.id, required this.name});
  Company.parseJson(Map<String, dynamic> jsonData) {
    this.id = jsonData['id'];
    this.name = jsonData['name'];
  }
}

class Product {
  late int id;
  late String name;
  late double price;

  Product({required this.id, required this.name, required this.price});
  Product.parseJson(Map<String, dynamic> jsonData) {
    this.id = jsonData['id'];
    this.name = jsonData['name'];
    this.price = jsonData['price'];
  }
}
