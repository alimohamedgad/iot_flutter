import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/dumy_data.dart';
import '../../../data/model/days.dart';
import '../../widgets/text_form_field.dart';
import '../project/widget/custom_drop_down.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List devices = [
    ['Air condition', 'assets/images/air.png', 'living room', true],
    ['Mt-256', 'assets/images/Group 11.png', 'Sleeping room ', true],
    ['Mt-565', 'assets/images/Group 11.png', 'Childern room', false],
    ['Light Living Room', 'assets/images/lamp.png', 'living room', true]
  ];

  final TextEditingController timePickerOnController = TextEditingController();
  final TextEditingController timePickerOFFController = TextEditingController();
  var device = '';
  List<DayInWeek> daysSelected = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(
              hintText: 'Choose Device',
              item: devices
                  .map((e) => DropdownMenuItem(
                        value: "${e[0]}",
                        child: Text("${e[0]}"),
                      ))
                  .toList(),
              onChange: (v) {
                device = v.toString();
              },
            ),
            const SizedBox(height: 15),
            const Text('Select Your Days'),
            const SizedBox(height: 15),
            buildDoctorDays(),
            const SizedBox(height: 15),
            const Text('When to ON'),
            const SizedBox(height: 15),
            CustomTextField(
              readOnly: true,
              hintText: 'Set Time...',
              controller: timePickerOnController,
              onTap: () async {
                TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (timeOfDay != null) {
                  setState(() {
                    timePickerOnController.text = timeOfDay.format(context);
                  });
                }
              },
            ),
            const SizedBox(height: 15),
            const Text('When to OFF'),
            const SizedBox(height: 15),
            CustomTextField(
              readOnly: true,
              hintText: 'Set Time...',
              controller: timePickerOFFController,
              onTap: () async {
                TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (timeOfDay != null) {
                  setState(() {
                    timePickerOFFController.text = timeOfDay.format(context);
                  });
                }
              },
            ),
            const SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add Your Schedule'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDoctorDays() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ...List.generate(
              days.length,
              (index) => Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (daysSelected.contains(days[index])) {
                        daysSelected.remove(days[index]);
                      } else {
                        daysSelected.add(days[index]);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeIn,
                    height: 35,
                    alignment: Alignment.center,
                    // height: daysSelected.contains(days[index]) ? 35 : 30,
                    decoration: BoxDecoration(
                      color: daysSelected.contains(days[index])
                          ? Colors.blue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    margin: const EdgeInsets.all(2),
                    child: Text(
                      days[index].dayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: daysSelected.contains(days[index])
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
