import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late RangeValues _priceRange;
  @override
  void initState() {
    _priceRange = const RangeValues(50, 200);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          RangeSlider(
            semanticFormatterCallback: (double newValue) {
              return '${newValue.round()} dollars';
            },
            divisions: 20,
            labels: RangeLabels(
                _priceRange.start.toString(), _priceRange.end.toString()),
            values: _priceRange,
            max: 500,
            min: 0,
            onChanged: (value) {
              setState(() {
                _priceRange = value;
              });
            },
          )
        ],
      )),
    );
  }
}
