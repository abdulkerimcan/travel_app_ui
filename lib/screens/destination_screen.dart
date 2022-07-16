import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/activity_model.dart';
import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/screens/home_screen.dart';

class DestinatinPage extends StatefulWidget {
  final Destination destination;
  const DestinatinPage({Key? key, required this.destination}) : super(key: key);

  @override
  State<DestinatinPage> createState() => _DestinatinPageState();
}

class _DestinatinPageState extends State<DestinatinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppbar(),
      body: Column(
        children: [
          _topImg(),
          Expanded(
            child: ListView.builder(
                itemCount: widget.destination.activities.length,
                itemBuilder: (context, index) {
                  Activity activity = widget.destination.activities[index];
                  return Stack(
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                          height: 150,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(100, 20, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        activity.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        activity.type,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                      _ratingBar(activity),
                                      Row(
                                        children: [
                                          _timeContainer(
                                              activity.startTimes[0]),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          _timeContainer(
                                              activity.startTimes[1]),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text("\$${activity.price}",style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    const Text("per pax"),
                                  ],
                                )
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 10),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            height: 130,
                            width: 110,
                            activity.imageUrl,
                            fit: BoxFit.fill,
                            color: Colors.white.withOpacity(0.9),
                            colorBlendMode: BlendMode.colorBurn,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Container _timeContainer(String startTime) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorItems.blueChaose),
      child: Text(
        startTime,
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  RatingBar _ratingBar(Activity activity) {
    return RatingBar.builder(
      itemSize: 20,
      initialRating: activity.rating.toDouble(),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Hero _topImg() {
    return Hero(
      tag: widget.destination.imageUrl,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Stack(
          children: [
            Image.asset(
              widget.destination.imageUrl,
              height: 350,
              fit: BoxFit.fill,
              color: Colors.white.withOpacity(0.9),
              colorBlendMode: BlendMode.colorBurn,
            ),
            const Positioned(
              bottom: 15,
              right: 15,
              child: Icon(
                FontAwesomeIcons.locationDot,
                color: Colors.white,
              ),
            ),
            Positioned(
              left: 5,
              bottom: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.city,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        color: Colors.grey[200],
                      ),
                      Text(
                        widget.destination.country,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          FontAwesomeIcons.arrowLeftLong,
          color: Colors.black,
        ),
        iconSize: 45,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.black,
            ),
            iconSize: 30),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.arrowDownWideShort,
              color: Colors.black,
            ),
            iconSize: 30),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
