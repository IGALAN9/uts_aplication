import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail extends StatefulWidget {
  final String image;
  const Detail(this.image, {super.key});
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isBookmarked = false;
  bool isPostLiked = false;
  final TextEditingController _commentController = TextEditingController();
  List<String> comments = [];
  List<bool> isLiked = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isBookmarked = prefs.getBool('${widget.image}_isBookmarked') ?? false;
      isPostLiked = prefs.getBool('${widget.image}_isPostLiked') ?? false;
      comments = prefs.getStringList('${widget.image}_comments') ?? [];
      isLiked = (prefs.getStringList('${widget.image}_isLiked')?.map((e) => e == 'true').toList()) ?? [];
    });
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${widget.image}_isBookmarked', isBookmarked);
    await prefs.setBool('${widget.image}_isPostLiked', isPostLiked);
    await prefs.setStringList('${widget.image}_comments', comments);
    await prefs.setStringList('${widget.image}_isLiked', isLiked.map((e) => e.toString()).toList());

    // Update bookmarked photos list
    List<String> bookmarkedPhotos = prefs.getStringList('bookmarked_photos') ?? [];
    if (isBookmarked && !bookmarkedPhotos.contains(widget.image)) {
      bookmarkedPhotos.add(widget.image);
    } else if (!isBookmarked && bookmarkedPhotos.contains(widget.image)) {
      bookmarkedPhotos.remove(widget.image);
    }
    await prefs.setStringList('bookmarked_photos', bookmarkedPhotos);
  }

  void _deleteComment(int index) async {
    setState(() {
      comments.removeAt(index);
      isLiked.removeAt(index);
    });
    _saveData();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.image,
              child: Image.asset(widget.image),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    isPostLiked ? Icons.favorite : Icons.favorite_border,
                    color: isPostLiked ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    setState (() {
                      isPostLiked = !isPostLiked;
                      _saveData();
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                      _saveData();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isBookmarked ? Colors.grey[350] : Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    isBookmarked ? 'Disimpan' : 'Simpan',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              height: 300,
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  if(isLiked.length <= index){
                    isLiked.add(false);
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage('assets/user.png'),
                          radius: 20,
                          backgroundColor: Colors.grey[600],
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(comments[index]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton( //MENU LIKE
                                      icon: Icon(
                                        isLiked[index] ? Icons.favorite : Icons.favorite_border,
                                        color: isLiked[index] ? Colors.red : Colors.black,
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          isLiked[index] = !isLiked[index];
                                          _saveData();
                                        });
                                      },
                                      padding: const EdgeInsets.only(right: 30),
                                    ),
                                    IconButton( //MENU LAPORAN
                                      icon: const Icon(
                                        Icons.more_horiz, color: Colors.black),
                                      onPressed: () {

                                        FocusScope.of(context).unfocus();
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Laporan"),
                                              content: const Text(
                                                "Laporkan komentar ini?"),
                                              actions: [
                                                TextButton(
                                                  child: const Text('OK'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          'Komentar berhasil dilaporkan'
                                                          ),
                                                        duration: Duration(
                                                          seconds: 2
                                                          ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    IconButton( //ICON DELETE KOMEN
                                      icon: const Icon(Icons.close, color: Colors.black),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Hapus"),
                                              content: const Text(
                                                "Hapus komentar ini?"),
                                              actions: [
                                                TextButton(
                                                  child: const Text('OK'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    _deleteComment(index);
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Batal'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      padding: const EdgeInsets.only(right: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: "Add a comment on this post!",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        if (_commentController.text.isNotEmpty) {
                          comments.add(_commentController.text);
                          isLiked.add(false);
                          _commentController.clear();
                          _saveData();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}