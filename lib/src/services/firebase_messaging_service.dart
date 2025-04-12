import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<String?> getToken() async {
    final String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');
    return token;
  }

  Future<void> initialize() async {
    print('Initializing Firebase Messaging Service');

    // Request permission
    final NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    print('User granted permission: ${settings.authorizationStatus}');

    // // Subscribe to transaction notifications topic
    // await _firebaseMessaging.subscribeToTopic('transaction_notifications');
    // print('Subscribed to transaction_notifications topic');

    // Get FCM token
    final String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');

    // Initialize local notifications
    await _initializeLocalNotifications();

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received foreground message:');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
      print('Data: ${message.data}');
      _handleForegroundMessage(message);
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle when app is opened from notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('App opened from notification:');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');
      print('Data: ${message.data}');
    });
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        print('Notification tapped: ${details.payload}');
      },
    );
    print('Local notifications initialized');
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    print('Handling foreground message');
    if (message.notification != null) {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'transaction_channel',
        'Transaction Notifications',
        channelDescription: 'Notifications for successful transfers',
        importance: Importance.high,
        priority: Priority.high,
      );

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      );

      try {
        _localNotifications.show(
          DateTime.now().millisecondsSinceEpoch % 100000,
          message.notification!.title ?? '',
          message.notification!.body ?? '',
          notificationDetails,
        );
        print('Notification shown successfully');
      } catch (e) {
        print('Error showing notification: $e');
      }
    }
  }

  // void handleNotificationTap(NotificationResponse details) {
  //   // Handle notification tap
  //   if (details.payload != null) {
  //     // Navigate to transaction details or relevant screen
  //     print('Notification tapped with transaction ID: ${details.payload}');
  //     // Add your navigation logic here
  //     // Example: Navigator.pushNamed(context, '/transaction-details', arguments: details.payload);
  //   }
  // }

  // Future<void> _handleBackgroundMessageTap(RemoteMessage message) async {
  //   // Handle notification tap when app was in background
  //   if (message.data['notification_type'] == 'transaction') {
  //     final String transactionId = message.data['transaction_id'] ?? '';
  //     // Add your navigation logic here
  //     // Example: Navigator.pushNamed(context, '/transaction-details', arguments: transactionId);
  //   }
  // }
}

// Top-level function to handle background messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling background message: ${message.messageId}');
  print('Message data: ${message.data}');
  print('Message notification: ${message.notification?.title}');
}
