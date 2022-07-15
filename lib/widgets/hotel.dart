import 'package:flutter/material.dart';
import 'package:travel_ui/models/hotel.model.dart';

import '../models/destination_model.dart';
import '../screens/home_screen.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exclusive Hotels",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "See all",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorItems.blueChaose,
                    letterSpacing: 0),
              ),
            ],
          ),
        ),
        SizedBox(
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotels.length,
                    itemBuilder: (context, index) {
                      Hotel hotel = hotels[index];
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Stack(
                          children: [
                            _whiteContainer(context, hotel),
                            _image(hotel),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Positioned _image(Hotel hotel) {
    return Positioned(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          hotel.imageUrl,
          height: 200,
          width: 380,
          fit: BoxFit.fill,
          color: Colors.white.withOpacity(0.9),
          colorBlendMode: BlendMode.colorBurn,
        ),
      ),
    );
  }

  Positioned _whiteContainer(BuildContext context, Hotel hotel) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: 380,
        height: 100,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black87, offset: Offset(0.0, 2.0), blurRadius: 6.0)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${hotel.address}",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "\$${hotel.price}/night",
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
