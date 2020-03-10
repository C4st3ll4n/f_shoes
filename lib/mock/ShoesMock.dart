import 'package:flutter/material.dart';
import 'package:fshoes/model/Shoe.dart';

class ShoesMock {
  static List<String> shoesMarks = [
    'Nike',
    'Adidas',
    'Jordan',
    'Puma',
    'All Star'
  ];

  static List<Shoe> shoesList = [
    Shoe(
        name: 'Shoe-Name1',
        mark: 'Nike',
        price: '\$150.00',
        img:
            'https://images.lojanike.com.br/1024x1024/produto/96332_757086_20190704111447.png',
        color: Colors.red),
    Shoe(
        name: 'Shoe-Name2',
        mark: 'Nike',
        price: '\$150.00',
        img:
            'https://images.lojanike.com.br/1024x1024/produto/186876_1661767_20190909145638.png',
        color: Colors.blue),
    Shoe(
        name: 'Shoe-Name3',
        mark: 'Nike',
        price: '\$150.00',
        img:
            'https://images.lojanike.com.br/1024x1024/produto/182071_1780713_20191029225601.png',
        color: Colors.pink),
    Shoe(
        name: 'Shoe-Name4',
        mark: 'Nike',
        price: '\$150.00',
        img:
            'https://images.lojanike.com.br/1024x1024/produto/14171_389274_20190607111612.png',
        color: Colors.orange),
  ];
}
