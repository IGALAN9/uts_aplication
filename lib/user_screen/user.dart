import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_group3/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_screen/detail.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<String> bookmarkedPhotos = [];

  @override
  void initState() {
    super.initState();
    _loadBookmarkedPhotos();
  }

  Future<void> _loadBookmarkedPhotos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Load the list of bookmarked photos
    setState(() {
      bookmarkedPhotos = prefs.getStringList('bookmarked_photos') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
              icon: const Icon(CupertinoIcons.profile_circled))
        ],
      ),
      body: GridView.count(
        childAspectRatio: 0.78,
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 6,
        padding: const EdgeInsets.all(15),
        // Only display bookmarked photos
        children: bookmarkedPhotos.map((fotoPath) => Foto(fotoPath: fotoPath)).toList(),
      ),
    );
  }
}

class Foto extends StatefulWidget {
  final String fotoPath;

  const Foto({required this.fotoPath});

  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  bool isBookmarked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => Detail(widget.fotoPath),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              widget.fotoPath,
              fit: BoxFit.cover,
              height: 175,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  ),
                  color: isBookmarked ? Colors.yellow.shade600 : Colors.black,
                  onPressed: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


