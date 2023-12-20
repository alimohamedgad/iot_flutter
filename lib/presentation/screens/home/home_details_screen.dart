// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/core/constant/app_image.dart';

import '../../../data/model/devices_model.dart';

class HomeDetailsScreen extends StatelessWidget {
  final DevicesModel devices;
  const HomeDetailsScreen({
    Key? key,
    required this.devices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 90),
                    padding: const EdgeInsets.only(top: 40),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      // border: Border.all(color: Colors.deepOrange.withOpacity(0.5), width: 2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          devices.deviceName,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Set Working Time',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.add_circle_outline_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'From 1:00 PM to 8:00 PM ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 150,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.4),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.5), width: 1),
                            gradient: LinearGradient(
                              colors: [
                                Colors.brown.shade200,
                                Colors.white,
                                Colors.brown.shade200,
                                Colors.white,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Maximum Power',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '50 W',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Working Hours',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '125',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Avg Daily Working Hrs',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    '25 ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 20),
              child: Image.asset(
                devices.imageRoom,
                height: 100,
              ),
            ),
            // .animate().fade().scale(
            //       duration: 450.ms,
            //       curve: Curves.fastOutSlowIn,
            //     ),
          ],
        ),
      ),
    );
  }
}
