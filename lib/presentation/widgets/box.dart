// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:untitled6/core/constant/color_manager.dart';
import 'package:untitled6/data/model/devices_model.dart';

class Box extends StatefulWidget {
  Box({
    Key? key,
    required this.devicesModel,
  }) : super(key: key);

  final DevicesModel devicesModel;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  bool switchStatus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        width: 150,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: const Color(0xFF1D1E23).withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.5))),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8,
            top: 8,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.devicesModel.deviceName,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    widget.devicesModel.roomName,
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Transform.rotate(
                    angle: pi,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          switchStatus = !switchStatus;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 30,
                            // Adjust the width to control the size of the track
                            height: 60,
                            // Adjust the height to control the size of the track
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: switchStatus
                                  ? AppColor.primary
                                  : Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          Positioned(
                            top: switchStatus ? 33 : 4,
                            // Adjust the position of the thumb vertically
                            left: 5,
                            // Adjust the position of the thumb horizontally
                            child: Container(
                              width: 20,
                              // Adjust the width to control the size of the thumb
                              height: 20,
                              // Adjust the height to control the size of the thumb
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: switchStatus
                                    ? Colors.white
                                    : const Color(0xFF1D1E23),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20)),
                          child: Image.asset(
                            widget.devicesModel.imageRoom,
                            height: 100,
                          )))
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '${widget.devicesModel.kwh} KWH',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
