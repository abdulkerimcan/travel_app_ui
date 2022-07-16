import 'package:flutter/material.dart';

import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/screens/destination_screen.dart';

import '../screens/home_screen.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({Key? key}) : super(key: key);

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
                "Top Destination",
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
        Container(
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      Destination destination = destinations[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DestinatinPage(destination: destination))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Stack(
                            children: [
                              _whiteContainer(context, destination),
                              _image(destination),
                              _textInImg(destination, context),
                            ],
                          ),
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

  Positioned _textInImg(Destination destination, BuildContext context) {
    return Positioned(
      top: 150,
      left: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${destination.city}",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "${destination.country}",
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.grey[300], fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Positioned _image(Destination destination) {
    return Positioned(
      child: Hero(
        tag: destination.imageUrl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "${destination.imageUrl}",
            height: 200,
            width: 200,
            fit: BoxFit.fill,
            color: Colors.white.withOpacity(0.9),
            colorBlendMode: BlendMode.colorBurn,
          ),
        ),
      ),
    );
  }

  Positioned _whiteContainer(BuildContext context, Destination destination) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: Colors.black87, offset: Offset(0.0, 2.0), blurRadius: 6.0)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${destination.description}",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
