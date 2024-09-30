import 'package:flutter/material.dart';
import 'package:flutter_group3/notification_screen/custom_button.dart';

class CustomFollowNotification extends StatefulWidget {
  const CustomFollowNotification({super.key});

  @override
  State<CustomFollowNotification> createState() =>
      _CustomFollowNotificationState();
}

class _CustomFollowNotificationState extends State<CustomFollowNotification> {
  bool follow = false; // Tambahkan variabel untuk melacak status follow

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/imge/avatar1.png"),
        ),
        const SizedBox(
          width: 15,
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aang Avatar",
              style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "New following you   .  h1",
              style: TextStyle(color: Colors.grey,
            fontWeight: FontWeight.w700,
            fontSize: 13,),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: CustomButton(
              height: 40,
              text: follow ? 'Followed' : 'Follow', // Ubah teks berdasarkan status follow
              textColor: Colors.white,
              color: follow ? Colors.grey : Colors.red, // Ubah warna berdasarkan status follow
              onTap: () {
                setState(() {
                  follow = !follow; // Ganti status follow ketika tombol ditekan
                });
              },
            ),
          ),
        )
      ],
    );
  }
}
