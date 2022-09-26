import 'package:algoriza_team_6_realestate_app/business_logic/cubit/booking_cubit/booking_cubit.dart';
import 'package:algoriza_team_6_realestate_app/constants/screens.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_cached_network_image.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_icon_button.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_loading_indicator.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_material_button.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/constants.dart';
import '../../data/di/di.dart';
import '../../data/models/responses/hotels_model/get_booking_model.dart';
import '../../styles/colors.dart';
import '../../widgets/default_rating_bar_indicator.dart';

class CompletedBookingItem extends StatefulWidget {
  final BookingData bookingData;

  const CompletedBookingItem({Key? key, required this.bookingData})
      : super(key: key);

  @override
  State<CompletedBookingItem> createState() => _CompletedBookingItemState();
}

class _CompletedBookingItemState extends State<CompletedBookingItem> {
  late BookingCubit bookingCubit;
  final PageController pageController = PageController();

  @override
  void initState() {
    bookingCubit = sl<BookingCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp), color: defaultLightWhite),
      child: BlocBuilder<BookingCubit, BookingStates>(
        builder: (context, state) {
          if (state is ChangeBookingStatusLoadingState &&
              state.bookingId == widget.bookingData.id) {
            return SizedBox(
                height: 40.h, child: const DefaultLoadingIndicator());
          } else {
            return InkWell(
              borderRadius: BorderRadius.circular(16.sp),
              onTap: () {
                Navigator.pushNamed(context, hotelDetailsRoute,
                    arguments: widget.bookingData.hotel);
              },
              child: Column(children: [
                SizedBox(
                  height: 35.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      PageView(
                        controller: pageController,
                        children: widget
                                .bookingData.hotel.hotelImages.isNotEmpty
                            ? List.generate(
                                widget.bookingData.hotel.hotelImages.length,
                                (index) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w)
                                              .copyWith(top: 1.5.h),
                                      child: ClipRRect(
                                        clipBehavior: Clip.antiAlias,
                                        borderRadius:
                                            BorderRadius.circular(16.sp),
                                        child: DefaultCachedNetworkImage(
                                          imageUrl: imageBaseURL +
                                              widget.bookingData.hotel
                                                  .hotelImages[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ))
                            : [
                                const DefaultCachedNetworkImage(
                                    imageUrl: '', fit: BoxFit.cover)
                              ],
                      ),
                      Visibility(
                        visible:
                            widget.bookingData.hotel.hotelImages.length > 1,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                          child: SmoothPageIndicator(
                            count: widget.bookingData.hotel.hotelImages.length,
                            effect: const WormEffect(
                              spacing: 5.0,
                              radius: 5.0,
                              dotWidth: 10.0,
                              dotHeight: 10.0,
                              strokeWidth: 0,
                              dotColor: defaultGray,
                              activeDotColor: defaultAppWhiteColor,
                            ),
                            controller: pageController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: DefaultText(
                                text: widget.bookingData.hotel.name,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: DefaultText(
                                      text:
                                          '${widget.bookingData.hotel.price}\$ ',
                                      maxLines: 2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  const Flexible(
                                    child: DefaultText(
                                      text: '/per night',
                                      maxLines: 2,
                                      color: defaultGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  DefaultText(
                                      text: widget.bookingData.hotel.address),
                                  DefaultIconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, hotelLocationRoute,
                                            arguments: LatLng(
                                                double.parse(widget.bookingData
                                                    .hotel.latitude),
                                                double.parse(widget.bookingData
                                                    .hotel.longitude)));
                                      },
                                      icon: const Icon(
                                        Icons.location_on,
                                      )),
                                ],
                              ),
                            ),
                            DefaultRatingBarIndicator(
                                rating:
                                    double.parse(widget.bookingData.hotel.rate),
                                itemCount: 5,
                                itemSize: 13.sp)
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.5.h),
                  child: Row(
                    children: [
                      const Spacer(),
                      Flexible(
                        flex: 8,
                        child: DefaultMaterialButton(
                          onPressed: () {
                            bookingCubit.updateBookingStatus(
                                bookingId: widget.bookingData.id,
                                newBookingStatus: BookingStatus.upcomming);
                          },
                          text: 'UpComing',
                          background: defaultAppColor2.withOpacity(0.7),
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 8,
                        child: DefaultMaterialButton(
                          onPressed: () {
                            bookingCubit.updateBookingStatus(
                                bookingId: widget.bookingData.id,
                                newBookingStatus: BookingStatus.cancelled);
                          },
                          text: 'Cancel',
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                )
              ]),
            );
          }
        },
      ),
    );
  }
}
