// ignore_for_file: public_member_api_docs, sort_constructors_first
class DevicesModel {
  final String deviceName;
  final String roomName;
  final String imageRoom;
  final bool checkStateRoom;
  final int kwh;
  DevicesModel({
    required this.deviceName,
    required this.roomName,
    required this.imageRoom,
    required this.checkStateRoom,
    required this.kwh,
  });
}

List<DevicesModel> devices = [
  DevicesModel(
    deviceName: 'Air condition',
    roomName: 'living room',
    imageRoom: 'assets/images/air.png',
    checkStateRoom: true,
    kwh: 10,
  ),
  DevicesModel(
    deviceName: 'Mt-256',
    roomName: 'living room',
    imageRoom: 'assets/images/Group 11.png',
    checkStateRoom: true,
    kwh: 20,
  ),
  DevicesModel(
    deviceName: 'Mt-565',
    roomName: 'living room',
    imageRoom: 'assets/images/Group 11.png',
    checkStateRoom: false,
    kwh: 15,
  ),
  DevicesModel(
    deviceName: 'Light Room',
    roomName: 'living room',
    imageRoom: 'assets/images/lamp.png',
    checkStateRoom: true,
    kwh: 30,
  ),
];
