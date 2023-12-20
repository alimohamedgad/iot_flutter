// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/presentation/screens/project/creat_project_screen.dart';
import 'package:uuid/uuid.dart';

import '../../core/mqtt_helper/MQTTAppState.dart';
import '../../core/mqtt_helper/generet_token.dart';
import '../../core/mqtt_helper/mqtt_manager.dart';
import '../widgets/status_info_message_utils.dart';
import '../widgets/statusbar.dart';

class MQttScreen extends StatefulWidget {
  const MQttScreen({super.key});

  @override
  State<MQttScreen> createState() => _MQttScreenState();
}

class _MQttScreenState extends State<MQttScreen> {
  final TextEditingController _messageTextController = TextEditingController();
  final TextEditingController _topicTextController = TextEditingController();
  final _controller = ScrollController();
  final TextEditingController _hostTextController =
      TextEditingController(text: 'mqtt.eclipseprojects.io');
  late MQTTManager _manager;
  @override
  void dispose() {
    _messageTextController.dispose();
    _topicTextController.dispose();
    _controller.dispose();
    _hostTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _manager = Provider.of<MQTTManager>(context);
    if (_controller.hasClients) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MQTT'),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const CreateProjectScreen();
                // }));
              },
              icon: Icon(Icons.generating_tokens))
        ],
        backgroundColor: Colors.greenAccent,
      ),
      body: _manager.currentState == null
          ? const CircularProgressIndicator()
          : ListView(
              children: <Widget>[
                StatusBar(
                  statusMessage: prepareStateMessageFrom(
                    _manager.currentState.getAppConnectionState,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _buildEditableColumn(_manager.currentState),
                      _buildTopicSubscribeRow(_manager.currentState),
                      const SizedBox(height: 10),
                      _buildPublishMessageRow(_manager.currentState),
                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent),
                              onPressed:
                                  _manager.currentState.getAppConnectionState ==
                                          MQTTAppConnectionState.disconnected
                                      ? _configureAndConnect
                                      : null,
                              child: const Text('Connect'), //
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent),
                              onPressed:
                                  _manager.currentState.getAppConnectionState !=
                                          MQTTAppConnectionState.disconnected
                                      ? _disconnect
                                      : null,
                              child: const Text('Disconnect'), //
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _buildScrollableTextWith(
                        _manager.currentState.getHistoryText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _configureAndConnect() {
    // TODO: Use UUID

    Uuid uuid = Uuid();
    _manager.initializeMQTTClient(
      host: _hostTextController.text,
      identifier: uuid.v1(),
    );
    _manager.connect();
  }

  void _disconnect() {
    _manager.disconnect();
  }

  Widget _buildEditableColumn(MQTTAppState currentAppState) {
    return Column(
      children: <Widget>[
        _buildTextFieldWith(
          _hostTextController,
          'Enter broker address',
          currentAppState.getAppConnectionState,
        ),
      ],
    );
  }

  Widget _buildPublishMessageRow(MQTTAppState currentAppState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: _buildTextFieldWith(
            _messageTextController,
            'Enter a message',
            currentAppState.getAppConnectionState,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            disabledForegroundColor: Colors.black38.withOpacity(0.38),
            disabledBackgroundColor: Colors.black38.withOpacity(0.12),
            textStyle: const TextStyle(color: Colors.white),
          ),
          onPressed: currentAppState.getAppConnectionState ==
                  MQTTAppConnectionState.connectedSubscribed
              ? () {
                  _publishMessage(_messageTextController.text);
                }
              : null,
          child: const Text('Send'),
        ),
      ],
    );
  }

  Widget _buildTextFieldWith(
    TextEditingController controller,
    String hintText,
    MQTTAppConnectionState state,
  ) {
    bool shouldEnable = false;
    if (controller == _messageTextController &&
        state == MQTTAppConnectionState.connectedSubscribed) {
      shouldEnable = true;
    } else if ((controller == _topicTextController &&
        (state == MQTTAppConnectionState.connected ||
            state == MQTTAppConnectionState.connectedUnSubscribed))) {
      shouldEnable = true;
    }
    return TextField(
        enabled: shouldEnable,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
          labelText: hintText,
        ));
  }

  Widget _buildTopicSubscribeRow(MQTTAppState currentAppState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: _buildTextFieldWith(
              _topicTextController,
              'Enter a topic to subscribe or listen',
              currentAppState.getAppConnectionState),
        ),
        _buildSubscribeButtonFrom(currentAppState.getAppConnectionState)
      ],
    );
  }

  void _handleSubscribePress(MQTTAppConnectionState state) {
    if (state == MQTTAppConnectionState.connectedSubscribed) {
      _manager.unSubscribeFromCurrentTopic();
    } else {
      String enteredText = _topicTextController.text;
      if (enteredText.isNotEmpty) {
        _manager.subScribeTo(_topicTextController.text);
      } else {
        _showDialog("Please enter a topic.");
      }
    }
  }

  Widget _buildSubscribeButtonFrom(MQTTAppConnectionState state) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.black38.withOpacity(0.12),
        ),
        onPressed: (state == MQTTAppConnectionState.connectedSubscribed) ||
                (state == MQTTAppConnectionState.connectedUnSubscribed) ||
                (state == MQTTAppConnectionState.connected)
            ? () {
                _handleSubscribePress(state);
              }
            : null, //,
        child: state == MQTTAppConnectionState.connectedSubscribed
            ? const Text('Unsubscribe')
            : const Text('Subscribe'));
  }

  Widget _buildScrollableTextWith(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 5.0),
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        child: SingleChildScrollView(
          controller: _controller,
          child: Text(text),
        ),
      ),
    );
  }

  void _publishMessage(String text) {
    // String osPrefix = 'Flutter_iOS';
    // if (Platform.isAndroid) {
    //   osPrefix = 'Flutter_Android';
    // }
    // final rand = Random().nextInt(1000);
    Uuid uuid = Uuid();

    final String message = '${uuid.v1()}: $text';
    _manager.publish(message);
    _messageTextController.clear();
  }

  void _showDialog(String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
