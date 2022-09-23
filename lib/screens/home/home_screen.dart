import 'package:algoriza_team_6_realestate_app/views/home/hotels_item.dart';
import 'package:algoriza_team_6_realestate_app/views/home/home_carousal_item.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_loading_indicator.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../business_logic/cubit/home_cubit/home_cubit.dart';
import '../../constants/screens.dart';
import '../../data/di/di.dart';
import '../../widgets/default_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          collapsedHeight: 10.h,
          expandedHeight: 30.h,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0.h),
              child: CarouselSlider(
                options: CarouselOptions(
                    clipBehavior: Clip.antiAlias,
                    enlargeCenterPage: true,
                    height: 40.h,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 0.9,
                    enableInfiniteScroll: true),
                items: List.generate(
                    6,
                    (index) => HomeCarousalItem(
                        imagePath: 'assets/image/home_carosal_$index.jpg')),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                    text: 'Best Hotels',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
                DefaultIconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, filterScreenRoute);
                    },
                    icon: const Icon(Icons.filter_list_alt)),
              ],
            ),
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetHotelsSuccessState) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: sl<HomeCubit>().homeHotels.data.data.length,
                (context, index) => HotelsItem(
                    hotelData: sl<HomeCubit>().homeHotels.data.data[index]),
              ));
            } else {
              return const SliverFillRemaining(
                child: DefaultLoadingIndicator(),
              );
            }
          },
        )
      ],
    ));
  }
}
