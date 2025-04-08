import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // Initialize notifications
  Future<void> initialize() async {
    // Initialize local notifications
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(initializationSettings);
  }

  // Show transfer success notification
  Future<void> showTransferSuccessNotification({
    required String amount,
    required String recipient,
  }) async {
    final message = 'You have successfully transferred $amount to $recipient';

    final androidDetails = AndroidNotificationDetails(
      'transfer_channel', // channel id
      'Transfer Notifications', // channel name
      channelDescription: 'Notifications for successful transfers',
      importance: Importance.max,
      priority: Priority.max,
      icon: '@drawable/ic_notification', // Changed to standard Android naming
      color: const Color(0xFF2196F3), // Brand color
      largeIcon:
          const DrawableResourceAndroidBitmap('@drawable/ic_notification'),
      styleInformation: BigTextStyleInformation(
        message,
        htmlFormatBigText: true,
        htmlFormatContent: true,
        htmlFormatTitle: true,
      ),
      enableVibration: true,
      enableLights: true,
      playSound: true,
      category: AndroidNotificationCategory.message,
      actions: const [
        AndroidNotificationAction('view', 'View Details'),
        AndroidNotificationAction('close', 'Close'),
      ],
      fullScreenIntent: true,
      ongoing: false,
      autoCancel: true,
      showWhen: true,
      when: DateTime.now().millisecondsSinceEpoch,
      showProgress: false,
      maxProgress: 100,
      progress: 0,
      ticker: 'Transfer Notification',
      visibility: NotificationVisibility.public,
      timeoutAfter: 5000, // Auto dismiss after 5 seconds
      colorized: true,
      groupKey: 'transfer_group',
      groupAlertBehavior: GroupAlertBehavior.all,
      channelShowBadge: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'default',
      interruptionLevel: InterruptionLevel.timeSensitive,
      threadIdentifier: 'transfer_thread',
      categoryIdentifier: 'transfer_category',
      subtitle: 'Transfer Details',
      attachments: [],
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // Unique notification id
      'Transfer Successful',
      message,
      details,
      payload:
          'transfer_success', // Additional data for handling notification tap
    );
  }
}
