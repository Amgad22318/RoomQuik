import 'package:algoriza_team_6_realestate_app/business_logic/cubit/booking_cubit/booking_cubit.dart';
import 'package:algoriza_team_6_realestate_app/constants/constant_methods.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_loading_indicator.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_material_button.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_rating_bar_indicator.dart';
import 'package:algoriza_team_6_realestate_app/widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/constants.dart';
import '../../constants/screens.dart';
import '../../data/di/di.dart';
import '../../data/models/base/hotel/hotel_data.dart';
import '../../styles/colors.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/default_text.dart';

class HotelDetails extends StatefulWidget {
  final HotelData hotelData;

  const HotelDetails({Key? key, required this.hotelData}) : super(key: key);

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  final PageController pageController = PageController();
  late bool _isBooked;
  late BookingCubit bookingCubit;
  @override
  void initState() {
    bookingCubit = sl<BookingCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                height: 35.h,
                margin: EdgeInsets.symmetric(
                  vertical: 2.h,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      children: widget.hotelData.hotelImages.isNotEmpty
                          ? List.generate(
                              widget.hotelData.hotelImages.length,
                              (index) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: ClipRRect(
                                      clipBehavior: Clip.antiAlias,
                                      borderRadius:
                                          BorderRadius.circular(16.sp),
                                      child: DefaultCachedNetworkImage(
                                        imageUrl: imageBaseURL +
                                            widget.hotelData.hotelImages[index]
                                                .image,
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
                      visible: widget.hotelData.hotelImages.length > 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SmoothPageIndicator(
                          count: widget.hotelData.hotelImages.length,
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
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: DefaultText(
                                  text: widget.hotelData.name,
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
                                        text: '${widget.hotelData.price}\$ ',
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
                                    DefaultText(text: widget.hotelData.address),
                                    DefaultIconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, hotelLocationRoute,
                                              arguments: LatLng(
                                                  double.parse(widget
                                                      .hotelData.latitude),
                                                  double.parse(widget
                                                      .hotelData.longitude)));
                                        },
                                        icon: const Icon(
                                          Icons.location_on,
                                        )),
                                  ],
                                ),
                              ),
                              DefaultRatingBarIndicator(
                                  rating: double.parse(widget.hotelData.rate),
                                  itemCount: 5,
                                  itemSize: 13.sp)
                            ],
                          ),
                        ],
                      ),
                      const HorizontalDivider(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: DefaultText(
                          text: 'Description',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: DefaultText(
                          text: widget.hotelData.description,
                          color: defaultGray,
                          maxLines: 4,
                        ),
                      ),
                      // const HorizontalDivider(),
                      // Visibility(
                      //   visible: widget.hotelData.hotelFacilities.isNotEmpty,
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(vertical: 2.h),
                      //     child: DefaultText(
                      //       text: 'Facilities',
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 16.sp,
                      //     ),
                      //   ),
                      // ),
                    ]),
              ),
            ],
          ),
        ),
        // SliverList(
        //     delegate: SliverChildBuilderDelegate(
        //         childCount: widget.hotelData.hotelFacilities.length,
        //         (context, index) => ListTile(
        //               leading: DefaultText(
        //                   text: widget.hotelData.hotelFacilities[index].name),
        //             )))
        SliverToBoxAdapter(
          child: BlocConsumer<BookingCubit, BookingStates>(
            listener: (context, state) {
              if (state is BookingFailureState) {
                showToastMsg(msg: state.msg, toastState: ToastStates.ERROR);
              } else if (state is BookingSuccessState) {
                showToastMsg(msg: state.msg, toastState: ToastStates.SUCCESS);
              }
            },
            builder: (context, state) {
              _isBooked = bookingCubit.upComingBooking.data.data.any((element) {
                return element.hotelId == widget.hotelData.id.toString();
              });

              if (state is BookingLoadingState ||
                  state is GetBookingDataLoadingState) {
                return const DefaultLoadingIndicator();
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
                  child: DefaultMaterialButton(
                    disabledColor: defaultAppColor2.withOpacity(0.7),
                    onPressed: _isBooked
                        ? null
                        : () {
                            bookingCubit.book(
                                hotelID: widget.hotelData.id.toInt());
                          },
                    text: _isBooked ? 'Already Booked' : 'Book Now',
                  ),
                );
              }
            },
          ),
        )
      ],
    )));
  }
}
