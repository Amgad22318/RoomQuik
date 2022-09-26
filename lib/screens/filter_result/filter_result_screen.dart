import 'package:flutter/material.dart';

import '../../data/models/responses/hotels_model/hotels_model.dart';

class FilterResultScreen extends StatefulWidget {
  final Hotels filterHotels;

  const FilterResultScreen({Key? key, required this.filterHotels})
      : super(key: key);

  @override
  State<FilterResultScreen> createState() => _FilterResultScreenState();
}

class _FilterResultScreenState extends State<FilterResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
