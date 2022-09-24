import 'package:algoriza_team_6_realestate_app/business_logic/cubit/filter_cubit/filter_cubit.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:algoriza_team_6_realestate_app/widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../data/di/di.dart';
import '../../styles/colors.dart';
import '../../widgets/search_form_field.dart';

class FilterScreen extends StatefulWidget {
  final String searchText;

  const FilterScreen({Key? key, required this.searchText}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late RangeValues _priceRange;
  final TextEditingController searchController = TextEditingController();
  late double distance;
  late FilterCubit filterCubit;

  @override
  void initState() {
    searchController.text = widget.searchText;
    _priceRange = const RangeValues(200, 1200);
    distance = 20.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FilterCubit>()..getFacilities(),
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, searchController.text);

          return true;
        },
        child: Scaffold(
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
            child: BlocConsumer<FilterCubit, FilterState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                filterCubit = sl<FilterCubit>();

                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: SearchFormField(
                              horizontalPadding: 2.w,
                              controller: searchController,
                              backgroundColor: defaultBlack.withOpacity(0.4),
                              keyboardType: TextInputType.text,
                              hintText: 'Where are you going',
                            ),
                          ),
                          Row(
                            children: [
                              DefaultText(
                                  text: 'Price ',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: defaultGray),
                              DefaultText(
                                  text: '(for 1 night)',
                                  fontSize: 14.sp,
                                  color: defaultGray),
                              const Spacer()
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.0.w,
                            ).copyWith(top: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DefaultText(
                                    text: '${_priceRange.start.round()}\$',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                                DefaultText(
                                    text: '${_priceRange.end.round()}\$',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ],
                            ),
                          ),
                          RangeSlider(
                            divisions: 30,
                            semanticFormatterCallback: (double newValue) {
                              return '${newValue.round()} dollars';
                            },
                            values: _priceRange,
                            max: 1500,
                            min: 50,
                            onChanged: (value) {
                              setState(() {
                                _priceRange = value;
                              });
                            },
                          ),
                          const HorizontalDivider(color: defaultGray),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: DefaultText(
                              text: 'Distance from city center',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: defaultGray,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: DefaultText(
                                text: 'Less than ${distance.round()} Km',
                                fontSize: 14.sp),
                          ),
                          Slider(
                            max: 100,
                            min: 1,
                            value: distance,
                            onChanged: (value) {
                              setState(() {
                                distance = value;
                              });
                            },
                          ),
                          const HorizontalDivider(color: defaultGray),
                        ],
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: filterCubit.facilities.data.length,
                            (context, index) => CheckboxListTile(
                                  title: DefaultText(
                                      text: filterCubit
                                          .facilities.data[index].name),
                                  value: filterCubit
                                      .facilities.data[index].checked,
                                  onChanged: (value) {
                                    setState(() {
                                      filterCubit.facilities.data[index]
                                              .setChecked =
                                          !filterCubit
                                              .facilities.data[index].checked;
                                    });
                                  },
                                ))),
                  ],
                );
              },
            ),
          )),
        ),
      ),
    );
  }
}
