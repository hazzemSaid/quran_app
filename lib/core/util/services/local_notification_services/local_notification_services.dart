import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationServices {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    // Initialize the time zone database
    tz.initializeTimeZones();

    // Get the local time zone
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    print(
        'Local Time Zone: ${tz.local.name}'); // Debugging: Print the local time zone

    // Initialize the notifications plugin
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> scheduleDailyNotification(
      int id, String title, String body, int hour, int minute) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      await _nextInstanceOfTime(hour, minute),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'prayer_channel_id',
          'Prayer Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> scheduleWeeklyNotification(
      int id, String title, String body, int hour, int minute) async {
    // Calculate the next instance of the specified time on Friday
    final tz.TZDateTime nextFriday = _nextInstanceOfDayAndTime(
      day: DateTime.friday, // Friday
      hour: hour,
      minute: minute,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      nextFriday,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'prayer_channel_id',
          'Prayer Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents:
          DateTimeComponents.dayOfWeekAndTime, // Repeat weekly
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static tz.TZDateTime _nextInstanceOfDayAndTime({
    required int day, // Day of the week (e.g., DateTime.friday)
    required int hour,
    required int minute,
  }) {
    // Get the current time in the local time zone
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    // Create a TZDateTime object for the specified day and time
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // Adjust the scheduled date to the next occurrence of the specified day
    while (scheduledDate.weekday != day || scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    print(
        'Scheduled Date: $scheduledDate'); // Debugging: Print the scheduled date
    return scheduledDate;
  }

  static Future<tz.TZDateTime> _nextInstanceOfTime(int hour, int minute) async {
    // Get the current time in the local time zone
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    // Create a TZDateTime object for the scheduled time today
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // If the scheduled time is in the past, add one day
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    print(
        'Scheduled Date: $scheduledDate'); // Debugging: Print the scheduled date
    return scheduledDate;
  }

  static Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
