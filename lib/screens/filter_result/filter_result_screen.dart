import 'package:algoriza_team_6_realestate_app/constants/screens.dart';
import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/views/filter_result/filter_result_item.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constant_methods.dart';
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
    return Scaffold(
      floatingActionButton: Visibility(
        visible: widget.filterHotels.data.data.isNotEmpty,
        child: FloatingActionButton(
            tooltip: 'Show Result On Map',
            onPressed: () {
              Navigator.pushNamed(context, filterResultLocationRoute,
                  arguments: widget.filterHotels);
            },
            child: const Icon(
              Icons.map,
            )),
      ),
      body: SafeArea(
        child: widget.filterHotels.data.data.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => FilterResultItem(
                      hotelData: widget.filterHotels.data.data[index],
                      textDirection: index % 2 == 0
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      background: darkOrLightColor(
                          defaultAppWhiteColor.withOpacity(0.2),
                          defaultLightWhite),
                    ),
                itemCount: widget.filterHotels.data.data.length)
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultText(
                        text: 'No Result Found',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search_off, size: 25.sp),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
