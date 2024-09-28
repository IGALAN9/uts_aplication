import 'package:flutter/material.dart';

class CustomLikedNotification extends StatelessWidget {
  const CustomLikedNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          const SizedBox(
            height: 80,
            width: 80,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/imge/chihuahua.jpg"),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/imge/pug.jpg"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Chihuahua",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                          text: "  and\n",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(text: "Mr.Pug"),
                      ]),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Liked your post  .  h1",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          Image.asset("assets/imge/kucing.jpg", height: 64, width: 64,)
        ],
      ),
    );
  }
}
