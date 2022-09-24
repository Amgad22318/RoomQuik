import 'package:algoriza_team_6_realestate_app/widgets/default_material_button.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_rating_bar_indicator.dart';
import 'package:algoriza_team_6_realestate_app/widgets/horizontal_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/constants.dart';
import '../../constants/screens.dart';
import '../../data/models/responses/hotels_model/hotels_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 35.h,
                margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      children: widget.hotelData.hotelImages.isNotEmpty
                          ? List.generate(
                              widget.hotelData.hotelImages.length,
                              (index) => ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(16.sp),
                                    child: DefaultCachedNetworkImage(
                                      imageUrl: imageBaseURL +
                                          widget.hotelData.hotelImages[index]
                                              .image,
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                          : [
                              const DefaultCachedNetworkImage(
                                  imageUrl: '', fit: BoxFit.cover)
                            ],
                    ),
                    Visibility(
                      visible: widget.hotelData.hotelImages.isNotEmpty,
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
                                          double.parse(
                                              widget.hotelData.latitude),
                                          double.parse(
                                              widget.hotelData.longitude)));
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
        ),
        // SliverList(
        //     delegate: SliverChildBuilderDelegate(
        //         childCount: widget.hotelData.hotelFacilities.length,
        //         (context, index) => ListTile(
        //               leading: DefaultText(
        //                   text: widget.hotelData.hotelFacilities[index].name),
        //             )))
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 6.h),
            child: DefaultMaterialButton(
              onPressed: () {},
              text: 'Book now',
            ),
          ),
        )
      ],
    )));
  }
}
