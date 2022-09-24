import 'package:algoriza_team_6_realestate_app/constants/screens.dart';
import 'package:algoriza_team_6_realestate_app/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/horizontal_divider.dart';

class HotelDetails extends StatelessWidget {
  const HotelDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
        title: Text(
          'Name Hotel',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image(
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: 200,
            image: NetworkImage(
              'https://media-cdn.tripadvisor.com/media/photo-s/16/1a/ea/54/hotel-presidente-4s.jpg',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DefaultText(
                        text: 'Price / Night',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DefaultText(
                      text: '180 \$',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DefaultText(
                        text: 'Location',
                        textStyle: TextStyle(
                          height: 1.5,
                        ),
                        fontSize: 15.sp,
                        color: Colors.black45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HotelLocationRoute);
                      },
                      icon: Icon(Icons.location_on),
                      padding: EdgeInsets.zero,
                      iconSize: 35,
                    )
                  ],
                ),
                HorizontalDivider(),
                DefaultText(
                  text: 'Summary',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                DefaultText(
                  text: 'Description',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12.sp,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
                HorizontalDivider(),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: DefaultText(
                      text: 'Rating',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    )),
                    DefaultText(
                      text: '10.5',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
