import 'package:flutter/material.dart';
import 'package:untitled6/core/constant/app_image.dart';

class LivingRoomUi extends StatefulWidget {
  const LivingRoomUi({super.key});

  @override
  State<LivingRoomUi> createState() => _LivingRoomUiState();
}

class _LivingRoomUiState extends State<LivingRoomUi> {
  List<String> nameIOT = ['Ac', "Camera", 'TV', 'Water'];
  List<IconData> iconIOT = [
    Icons.ac_unit,
    Icons.camera_alt_outlined,
    Icons.tv,
    Icons.water_drop_rounded,
  ];
  double _sliderValue = 0;

  final List<double> _intervals = [0, 10, 15, 20, 25, 30, 35, 40];
  final List<double> _intervalsText = [0, 5, 10, 15, 20, 25, 30, 35, 40];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD58A85),
      appBar: AppBar(
        backgroundColor: const Color(0xffD58A85),
      ),
      drawer: myDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/rr.jpg',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.bed_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  'Bed Room',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  '24 c',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.thermostat,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Appliences',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                nameIOT.length,
                (index) => Container(
                  height: 100,
                  width: 80,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF7E8E5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        iconIOT[index],
                        color: Colors.blue,
                        size: 40,
                      ),
                      Text(nameIOT[index])
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              children: [
                const Text(
                  'Light intensity',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Switch(
                  activeTrackColor: Colors.white.withOpacity(0.5),
                  activeColor: Colors.blue,
                  value: true,
                  onChanged: (v) {},
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.4),
            ),
            child: Column(
              children: [
                Slider(
                  value: _sliderValue,
                  min: _intervals.first,
                  max: _intervals.last,
                  activeColor: Colors.blue.shade900,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  divisions: _intervals.length,
                  label: '${_sliderValue.toInt()}',
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        _intervalsText.length,
                        (index) => Text(
                          _intervalsText[index].toInt().toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Drawer myDrawer() {
    return Drawer(
      backgroundColor: Colors.white.withOpacity(0.7),
      width: 180,
      child: ListView(
        children: [
          const Text(
            "Your Rooms",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          drawarItem(image: AppImage.hotelRoom),
          const SizedBox(height: 20),
          drawarItem(image: AppImage.livingRoom),
          const SizedBox(height: 20),
          drawarItem(image: AppImage.mettingRoom),
          const SizedBox(height: 20),
          drawarItem(image: AppImage.mainRoom),
          const SizedBox(height: 60),
          Container(
            height: 160,
            margin: const EdgeInsets.symmetric(horizontal: 60),
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.white,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.light_mode),
                Icon(Icons.tv),
                Icon(Icons.wifi),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container drawarItem({
    required String image,
  }) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Image.asset(
        image,
        color: Colors.blue,
      ),
    );
  }
}
