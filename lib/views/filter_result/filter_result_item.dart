import 'package:algoriza_team_6_realestate_app/constants/screens.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_cached_network_image.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_icon_button.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../styles/colors.dart';

import '../../constants/constants.dart';
import '../../data/models/base/hotel/hotel_data.dart';
import '../../widgets/default_rating_bar_indicator.dart';
import '../../widgets/default_rich_text.dart';
import '../../widgets/default_text_span.dart';

class FilterResultItem extends StatefulWidget {
  final HotelData hotelData;
  final TextDirection textDirection;
  final Color background;
  const FilterResultItem(
      {Key? key,
      required this.hotelData,
      this.textDirection = TextDirection.rtl,
      required this.background})
      : super(key: key);

  @override
  State<FilterResultItem> createState() => _FilterResultItemState();
}

class _FilterResultItemState extends State<FilterResultItem> {
  final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.textDirection,
      child: Container(
        height: 20.h,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp),
            color: widget.background),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.sp),
          onTap: () {
            Navigator.pushNamed(context, hotelDetailsRoute,
                arguments: widget.hotelData);
          },
          child: Row(children: [
            Flexible(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    children: widget.hotelData.hotelImages.isNotEmpty
                        ? List.generate(
                            widget.hotelData.hotelImages.length,
                            (index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 3.w)
                                      .copyWith(top: 1.h),
                                  child: ClipRRect(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(16.sp),
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
                      padding: EdgeInsets.only(bottom: 1.h),
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
            Flexible(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: Column(
                  crossAxisAlignment: widget.textDirection == TextDirection.ltr
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultText(
                      text: widget.hotelData.name,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: DefaultRichText(
                          text: defaultTextSpan(children: [
                        defaultTextSpan(
                            text: widget.hotelData.price,
                            color: defaultAppWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                        defaultTextSpan(
                            text: '\$',
                            color: defaultAppColor2,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                        defaultTextSpan(
                            text: '/per night',
                            color: defaultAppWhiteColor.withOpacity(0.7),
                            fontSize: 10.sp),
                      ])),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          DefaultText(text: widget.hotelData.address),
                          DefaultIconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, hotelLocationRoute,
                                    arguments: LatLng(
                                        double.parse(widget.hotelData.latitude),
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
                        itemSize: 13.sp),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
