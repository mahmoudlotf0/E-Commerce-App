import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFFCDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);
const kSecondaryColor = Color(0xff979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(microseconds: 500);
const String baseUrl = 'https://fakestoreapi.com/';
List<String> images = [
  'assets/icons/electronics.jpeg',
  'assets/icons/jewelery.jpg',
  'assets/icons/menclothing.jpg',
  'assets/icons/womenclothing.jpg',
];
List<String> categoryName = [
  'Electronics',
  'Jewelery',
  'Men\'s clothing',
  'Women\'s clothing',
];
