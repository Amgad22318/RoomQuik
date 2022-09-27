import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/styles/colors.dart';
import 'package:algoriza_team_6_realestate_app/views/my_booking/completed_booking_item.dart';
import 'package:algoriza_team_6_realestate_app/views/my_booking/upcoming_booking_item.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/cubit/booking_cubit/booking_cubit.dart';
import '../../data/di/di.dart';
import '../../views/my_booking/cancelled_booking_item.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  late List<bool> isSelected;
  late BookingCubit bookingCubit;

  @override
  void initState() {
    isSelected = [true, false, false];
    bookingCubit = sl<BookingCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          toolbarHeight: 8.h,
          floating: true,
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Material(
              borderRadius: BorderRadius.circular(20.sp),
              color: darkOrLightColor(
                  defaultAppWhiteColor.withOpacity(0.2), defaultLightWhite),
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(20.sp),
                constraints: BoxConstraints(
                  minWidth: 28.w,
                  minHeight: 6.h,
                ),
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        if (isSelected[buttonIndex] == false) {
                          isSelected[buttonIndex] = !isSelected[buttonIndex];
                        }
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected,
                children: <Widget>[
                  DefaultText(
                    text: 'UpComing',
                    fontWeight: FontWeight.bold,
                    color: isSelected[0]
                        ? darkOrLightColor(defaultAppColor4, defaultAppColor2)
                        : defaultAppWhiteColor,
                  ),
                  DefaultText(
                    text: 'Completed',
                    fontWeight: FontWeight.bold,
                    color: isSelected[1]
                        ? darkOrLightColor(defaultAppColor4, defaultAppColor2)
                        : defaultAppWhiteColor,
                  ),
                  DefaultText(
                    text: 'Cancelled',
                    fontWeight: FontWeight.bold,
                    color: isSelected[2]
                        ? darkOrLightColor(defaultAppColor4, defaultAppColor2)
                        : defaultAppWhiteColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        BlocConsumer<BookingCubit, BookingStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (isSelected[0] == true) {
              if (bookingCubit.upComingBooking.data.data.isNotEmpty) {
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount:
                            bookingCubit.upComingBooking.data.data.length,
                        (context, index) => UpComingBookingItem(
                            bookingData: bookingCubit
                                .upComingBooking.data.data[index])));
              } else {
                return SliverFillRemaining(
                    child: Center(
                        child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultText(
                        text: 'Go Book Now',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        CupertinoIcons.paperplane,
                        size: 25.sp,
                      ),
                    )
                  ],
                )));
              }
            } else if (isSelected[1] == true) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount:
                          bookingCubit.completedBooking.data.data.length,
                      (context, index) => CompletedBookingItem(
                          bookingData:
                              bookingCubit.completedBooking.data.data[index])));
            } else {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount:
                          bookingCubit.cancelledBooking.data.data.length,
                      (context, index) => CancelledBookingItem(
                          bookingData:
                              bookingCubit.cancelledBooking.data.data[index])));
            }
          },
        )
      ],
    );
  }
}
