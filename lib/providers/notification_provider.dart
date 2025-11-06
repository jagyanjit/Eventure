import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettings {
  final bool pushNotifications;
  final bool emailNotifications;
  final bool eventReminders;

  NotificationSettings({
    required this.pushNotifications,
    required this.emailNotifications,
    required this.eventReminders,
  });

  NotificationSettings copyWith({
    bool? pushNotifications,
    bool? emailNotifications,
    bool? eventReminders,
  }) {
    return NotificationSettings(
      pushNotifications: pushNotifications ?? this.pushNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      eventReminders: eventReminders ?? this.eventReminders,
    );
  }
}

class NotificationNotifier extends StateNotifier<NotificationSettings> {
  NotificationNotifier()
      : super(NotificationSettings(
          pushNotifications: true,
          emailNotifications: false,
          eventReminders: true,
        )) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    state = NotificationSettings(
      pushNotifications: prefs.getBool('push_notifications') ?? true,
      emailNotifications: prefs.getBool('email_notifications') ?? false,
      eventReminders: prefs.getBool('event_reminders') ?? true,
    );
  }

  Future<void> setPushNotifications(bool value) async {
    state = state.copyWith(pushNotifications: value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('push_notifications', value);
  }

  Future<void> setEmailNotifications(bool value) async {
    state = state.copyWith(emailNotifications: value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('email_notifications', value);
  }

  Future<void> setEventReminders(bool value) async {
    state = state.copyWith(eventReminders: value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('event_reminders', value);
  }
}

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, NotificationSettings>((ref) {
  return NotificationNotifier();
});
