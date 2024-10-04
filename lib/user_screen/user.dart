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

  Future<void> _updateBookmarkedPhotos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedBookmarks = prefs.getStringList('bookmarked_photos') ?? [];
    
    setState(() {
      bookmarkedPhotos = updatedBookmarks;
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
        // display bookmarked photos
        children: bookmarkedPhotos
            .map((fotoPath) => Foto(fotoPath: fotoPath, onBookmarkChange: _updateBookmarkedPhotos))
            .toList(),
      ),
    );
  }
}

class Foto extends StatefulWidget {
  final String fotoPath;
  final Function onBookmarkChange;

  const Foto({required this.fotoPath, required this.onBookmarkChange});

  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  bool isBookmarked = true;

  @override
  void initState() {
    super.initState();
    _loadBookmarkStatus();
  }

  void _loadBookmarkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isBookmarked = prefs.getBool('${widget.fotoPath}_isBookmarked') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => Detail(widget.fotoPath),
          ),
        ).then((_) => widget.onBookmarkChange());
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
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    List<String> bookmarkedPhotos = prefs.getStringList('bookmarked_photos') ?? [];

                    setState(() {
                      isBookmarked = !isBookmarked;

                      // Update status bookmark
                      prefs.setBool('${widget.fotoPath}_isBookmarked', isBookmarked);

                      // Remove atau add bookmark list
                      if (!isBookmarked) {
                        bookmarkedPhotos.remove(widget.fotoPath);
                      } else if (!bookmarkedPhotos.contains(widget.fotoPath)) {
                        bookmarkedPhotos.add(widget.fotoPath);
                      }

                      // Save updated list bookmarks 
                      prefs.setStringList('bookmarked_photos', bookmarkedPhotos);
                      widget.onBookmarkChange();
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


