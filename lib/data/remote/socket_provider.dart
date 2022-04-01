// import 'dart:async';
//
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class SocketProvider extends GetxController {
//   IOWebSocketChannel webSocket;
//   Timer _timer;
//   List channelList = [""];
//   List<SocketListener> listenerList = [];
//
//   @override
//   void onInit() {
//     webSocket = IOWebSocketChannel.connect(SocketConstants.baseUrl);
//     _timer = new Timer.periodic(Duration(seconds: 10), (timer) {
//       webSocket.sink.add('{"event":"pusher:ping","data":{}}');
//     });
//
//     webSocket.stream.listen((message) {
//       print("message: $message");
//       parseMessage(socketResponseFromJson(message));
//     });
//     super.onInit();
//   }
//
//   parseMessage(SocketResponse socketResponse) {
//     //print("socket event: ${socketResponse.event}");
//     switch (socketResponse.event) {
//       case "pusher:connection_established":
//         print("socket connected");
//         break;
//       case "admin_notification": //test_notification
//         //SocketData data = socketDataFromJson(socketResponse.data);
//         //_callListeners("");
//         break;
//       case "bid_event":
//       case "auction_message":
//         SocketData data = socketDataFromJson(socketResponse.data);
//         BidMessage bid = BidMessage.fromJson(data.body);
//         _callListeners(bid);
//         break;
//
//       case SocketConstants.EventAuctionLiveStreamingStart:
//         SocketData data = socketDataFromJson(socketResponse.data);
//         SocketCallStartEndResponse startEndResponse = SocketCallStartEndResponse.fromJson(data.body);
//         _callListeners(startEndResponse);
//         break;
//
//       case SocketConstants.EventAuctionLiveStreamingEnd:
//         SocketData data = socketDataFromJson(socketResponse.data);
//         SocketCallStartEndResponse startEndResponse = SocketCallStartEndResponse.fromJson(data.body);
//         _callListeners(startEndResponse);
//         break;
//     }
//   }
//
//   //{channel: test_notification, event: admin_notification, data: {"title":"Test notification title","body":{"name":"Test 1","role":"Admin","description":"Some text will be written here"}}}
//
//   void subscribeEvent(String channel, SocketListener listener) {
//     if (!channelList.contains(channel)) {
//       print("subscribeEvent: $channel");
//       webSocket.sink
//           .add('{"event":"pusher:subscribe","data":{"channel":"$channel"}}');
//       channelList.add(channel);
//     }
//     if (!listenerList.contains(listener)) {
//       listenerList.add(listener);
//     }
//
//     ///webSocket.sink.add('{"event":"pusher:subscribe","data":{"channel":"test_notification"}}');
//   }
//
//   void unSubscribeEvent(String channel, SocketListener listener) {
//     print("unSubscribeEvent: $channel");
//
//     webSocket.sink
//         .add('{"event":"pusher:unsubscribe","data":{"channel":"$channel"}}');
//     channelList.remove(channel);
//     listenerList.remove(listener);
//   }
//
//   void closeWebSocket() {
//     webSocket.sink.close(status.goingAway);
//     _timer.cancel();
//     channelList.clear();
//     listenerList.clear();
//   }
//
//   void _callListeners(dynamic data) {
//     listenerList.forEach((element) {
//       element.onDataGet(data);
//     });
//   }
// }

// abstract class SocketListener {
//   void onDataGet(dynamic data);
// }
