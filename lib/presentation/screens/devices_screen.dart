import 'package:flutter/material.dart';
import 'package:untitled6/presentation/widgets/box.dart';

import '../../data/model/devices_model.dart';
import 'device_details_screen.dart';

class DevicesScreen extends StatelessWidget {
  DevicesScreen({Key? key}) : super(key: key);
  // List devices = [
  //   ['Smart Light', 'assets/images/air.png','livingroom', true],
  //   ['Smart Tv', 'assets/images/Group 11.png','livingroom', true],
  //   ['Light Room', 'assets/images/Group 11.png','livingroom', false],
  //   ['Light Room', 'assets/images/lamp.png','livingroom', true]
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141415),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              itemCount: devices.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsDevice(
                          name: devices[index].deviceName,
                          imageUrl: devices[index].imageRoom,
                          switchStatus: devices[index].checkStateRoom,
                        ),
                      ),
                    );
                  },
                  child: Box(
                    devicesModel: devices[index],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
                itemCount: devices.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Box(
                    devicesModel: devices[index],
                  );
                }),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
                itemCount: devices.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Box(
                    devicesModel: devices[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
