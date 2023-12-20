// import 'dart:developer';

// import 'package:flutter/material.dart';

// import '../models/MQTTAppState.dart';
// import 'package:mqtt5_client/mqtt5_server_client.dart';
// import 'package:mqtt5_client/mqtt5_client.dart';

// class MQTTManager extends ChangeNotifier {
//   // Private instance of client
//   final MQTTAppState currentState = MQTTAppState();
//   MqttServerClient? _client;
//   late String _identifier;
//   String? host;
//   String _topic = "";
//   var pubTopic = 'Dart/Mqtt5_client/testtopic';
//   bool topicNotified = false;

//   void initializeMQTTClient({
//     required String host,
//     required String identifier,
//   }) {
  
//     _identifier = identifier;
//     host = host;
//     _client = MqttServerClient(host, _identifier);
//     _client!.port = 1883;
//     _client!.keepAlivePeriod = 20;
//     _client!.secure = false;
//     _client!.logging(on: true);
//     _client!.onConnected = onConnected;
//     _client!.onDisconnected = onDisconnected;
//     _client!.onSubscribed = onSubscribed;
//     _client!.onUnsubscribed = onUnsubscribed;

//     final MqttConnectMessage connMess = MqttConnectMessage()
//         .withClientIdentifier(_identifier)
//         .startClean() // Non persistent session for testing
//         .withWillQos(MqttQos.atLeastOnce);
//     _client!.connectionMessage = connMess;
//   }

//   void connect() async {
//     assert(_client != null);
//     try {
//       currentState.setAppConnectionState(MQTTAppConnectionState.connecting);
//       updateState();
//       await _client!.connect();
//     } on Exception catch (e) {
//       log('EXAMPLE::client exception - ${e.toString()}');
//       disconnect();
//     }
//   }

//   void disconnect() {
//     log('Disconnected');
//     _client!.disconnect();
//   }

//   void publish(String message) {
//     final MqttPayloadBuilder builder = MqttPayloadBuilder();
//     builder.addString(message);
//     _client!.publishMessage(_topic, MqttQos.exactlyOnce, builder.payload!);
//   }

//   void subScribeTo(String topic) {
//     // Save topic for future use
//     _topic = topic;
//     _client!.subscribe(topic, MqttQos.atLeastOnce);
//   }

//   /// Unsubscribe from a topic
//   void unSubscribe(String topic) {
//     _client!.unsubscribeStringTopic(topic);
//   }

//   /// Unsubscribe from a topic
//   void unSubscribeFromCurrentTopic() {
//     _client!.unsubscribeStringTopic(_topic);
//   }

//   /// The subscribed callback
//   void onSubscribed(MqttSubscription topic) {
//     log('EXAMPLE::Subscription confirmed for topic $topic');
//     currentState
//         .setAppConnectionState(MQTTAppConnectionState.connectedSubscribed);
//     updateState();
//   }

//   void onUnsubscribed(MqttSubscription? topic) {
//     log('EXAMPLE::onUnsubscribed confirmed for topic $topic');
//     currentState.clearText();
//     currentState
//         .setAppConnectionState(MQTTAppConnectionState.connectedUnSubscribed);
//     updateState();
//   }

//   /// The unsolicited disconnect callback
//   void onDisconnected() {
//     log('EXAMPLE::OnDisconnected client callback - Client disconnection');
//     if (_client!.connectionStatus!.disconnectionOrigin ==
//         MqttDisconnectionOrigin.unsolicited) {
//       log('EXAMPLE::OnDisconnected callback is solicited, this is correct');
//     }
//     currentState.clearText();
//     currentState.setAppConnectionState(MQTTAppConnectionState.disconnected);
//     updateState();
//   }

//   /// The successful connect callback
//   void onConnected() {
//     currentState.setAppConnectionState(MQTTAppConnectionState.connected);
//     updateState();
//     _client!.updates.listen((dynamic c) {
//       final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
//       final String pt =
//           MqttUtilities.bytesToStringAsString(recMess.payload.message!);
//       currentState.setReceivedText(pt);
//       if (c[0].topic == pubTopic) {
//         topicNotified = true;
//       }
//       updateState();
//     });

//     _client!.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final recMess = c[0].payload as MqttPublishMessage;
//       final pt = MqttUtilities.bytesToStringAsString(recMess.payload.message!);

//       /// The above may seem a little convoluted for users only interested in the
//       /// payload, some users however may be interested in the received publish message,
//       /// lets not constrain ourselves yet until the package has been in the wild
//       /// for a while.
//       /// The payload is a byte buffer, this will be specific to the topic
//       print(
//           'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');

//       /// Indicate the notification is correct
//       if (c[0].topic == pubTopic) {
//         topicNotified = true;
//       }
//     });
//   }

//   void updateState() {
//     //controller.add(_currentState);
//     notifyListeners();
//   }
// }
