class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Hotel 0',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel 1',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel 2',
    address: '404 Great St',
    price: 240,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel3.jpg',
    name: 'Hotel 3',
    address: '404 Great St',
    price: 240,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel4.jpg',
    name: 'Hotel 4',
    address: '404 Great St',
    price: 550,
  ),
];