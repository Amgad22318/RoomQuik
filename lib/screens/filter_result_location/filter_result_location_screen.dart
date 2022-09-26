import 'package:flutter/material.dart';

import '../../data/models/responses/hotels_model/hotels_model.dart';

class FilterResultLocationScreen extends StatefulWidget {
  final Hotels filterHotels;

  const FilterResultLocationScreen({Key? key, required this.filterHotels})
      : super(key: key);

  @override
  State<FilterResultLocationScreen> createState() =>
      _FilterResultLocationScreenState();
}

class _FilterResultLocationScreenState
    extends State<FilterResultLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
