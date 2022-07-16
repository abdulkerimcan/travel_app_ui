

import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
   required this.city,
   required this.country,
   required this.description,
   required this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/ayasofya.jpg',
    name: 'Ayasofya Mosque',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/sultan.jpg',
    name: 'Blue Mosque',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/galata.jpg',
    name: 'Galata Tower',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/yerebatan.jpg',
    name: 'Yerebatan Sarnıcı',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/dolmabahce.jpg',
    name: 'Dolmabahçe Palace',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/gaziantep.jpg',
    city: 'Gaziantep',
    country: 'Turkey',
    description: 'Visit Gaziantep for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/istanbul.jpg',
    city: 'Istanbul',
    country: 'Turkey',
    description: 'Visit Istanbul for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/antalya.jpg',
    city: 'Antalya',
    country: 'Turkey',
    description: 'Visit Antalya for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/baku.jpg',
    city: 'Baku',
    country: 'Azerbaijan',
    description: 'Visit Baku for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/marmaris.jpg',
    city: 'Marmaris',
    country: 'Turkey',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];