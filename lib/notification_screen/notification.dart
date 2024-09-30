import 'package:flutter/material.dart';
import "package:flutter_group3/notification_screen/custom_liked_notification.dart";
import "package:flutter_group3/notification_screen/custom_follow_notification.dart";

class NotificationPage extends StatefulWidget {
  NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> newItem = ["liked", "follow"];
  List<String> todayItem = ["follow", "liked", "liked"];
  List<String> oldItem = ["follow", "follow", "liked", "liked"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNotificationSection("New", newItem),
                buildNotificationSection("Today", todayItem),
                buildNotificationSection("Oldest", oldItem),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNotificationSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 35,
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index] == "follow"
                ? CustomFollowNotification()
                : CustomLikedNotification();
          },
        ),
      ],
    );
  }
}
