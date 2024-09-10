import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
          //colum isi bagian atas (profile,nama,username)
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
              // row buat menampilkan followers dan following
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
                            ?.copyWith(fontSize: 17), // Custom font size
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
              )
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
