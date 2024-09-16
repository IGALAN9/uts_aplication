import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 0; // Tracks the selected tab (0 = Posts, 1 = Liked)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('PROFILE'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_rounded))
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // CircleAvatar with an Icon as the background image
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  CupertinoIcons.profile_circled,
                  size: 100,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'John Doe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 0.1),
              Text(
                '@johndoephotos',
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 10),
              // Row for followers and following
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "32",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 17),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Followers",
                          style: Theme.of(context).textTheme.labelSmall)
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "50",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontSize: 17), // Custom font size
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Following",
                          style: Theme.of(context).textTheme.labelSmall)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              // tab buat post dan liked
              Material(
                elevation: 1,
                child: Container(
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                        // ini buat posts klo di pencet dia index 0 dan warnanya berubah jadi biru klo engga jadi item
                        child: Text(
                          'Posts',
                          style: TextStyle(
                            fontWeight: currentIndex == 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color:
                                currentIndex == 0 ? Colors.blue : Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 1; // Highlight 'Liked'
                          });
                        },
                        child: Text(
                          'Liked',
                          style: TextStyle(
                            fontWeight: currentIndex == 1
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color:
                                currentIndex == 1 ? Colors.blue : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // buat isi dalem post dan liked
              if (currentIndex == 0)
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text("User Belum Ngepost Apa-pun..."),
                )
              else
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text("User Belum Ngelike Apa-pun..."),
                ),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 3,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.search), label: 'Search'),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.settings), label: 'Settings'),
      //     BottomNavigationBarItem(
      //         icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
      //   ],
      // ),
    );
  }
}
