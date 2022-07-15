import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/destinations.dart';
import 'package:travel_ui/widgets/hotel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late int _currentIndex;
  int _selected = 0;
  final double _notchedValue = 5;

  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      _currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
          child: ListView(
        children: [
          _buildTitle(context),
          const SizedBox(
            height: 20.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  icons.asMap().entries.map((e) => _buildIcon(e.key)).toList()),
          const SizedBox(
            height: 20.0,
          ),
          const DestinationWidget(),
          const SizedBox(
            height: 20.0,
          ),
          const HotelWidget()
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: ColorItems.blueChaose,
          onPressed: () {},
          child: const Icon(Icons.search)),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  BubbleBottomBar _buildBottomBar() {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: _currentIndex,
      onTap: changePage,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,
      fabLocation: BubbleBottomBarFabLocation.end,
      hasNotch: true,
      hasInk: true,
      inkColor: Colors.black12,
      items: const [
        BubbleBottomBarItem(
            backgroundColor: ColorItems.blueChaose,
            icon: Icon(
              FontAwesomeIcons.house,
              color: Colors.black,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.house,
              color: ColorItems.blueChaose,
            ),
            title: Text("Home")),
        BubbleBottomBarItem(
            backgroundColor: ColorItems.blueChaose,
            icon: Icon(
              Icons.map,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.map,
              color: ColorItems.blueChaose,
            ),
            title: Text("Near me")),
        BubbleBottomBarItem(
            backgroundColor: ColorItems.blueChaose,
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.person,
              color: ColorItems.blueChaose,
            ),
            title: Text("Profile")),
        BubbleBottomBarItem(
            backgroundColor: ColorItems.blueChaose,
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.menu,
              color: ColorItems.blueChaose,
            ),
            title: Text("Menu"))
      ],
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 160.0, left: 20.0, top: 30.0),
      child: Text(
        "What you would like to find?",
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildIcon(int index) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selected == index
              ? ColorItems.sweetDreams
              : ColorItems.sparkling),
      child: IconButton(
          onPressed: () {
            setState(() {
              setState(() {
                _selected = index;
              });
            });
          },
          icon: Icon(
            icons[index],
            color: _selected == index
                ? ColorItems.blueChaose
                : ColorItems.heavyMetal,
          )),
    );
  }
}

class ColorItems {
  static const Color blueChaose = Color(0xff6699ff);
  static const Color sweetDreams = Color(0xffb4ddf8);
  static const Color sparkling = Color(0xffd3d6d9);
  static const Color heavyMetal = Color(0xff878a8c);
}
