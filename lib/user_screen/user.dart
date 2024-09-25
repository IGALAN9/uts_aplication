import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
      ),
      body: GridView.count(
        childAspectRatio: 0.78,
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 6,
        padding: EdgeInsets.all(15),
        children: <Widget>[
          Foto(fotoPath: 'assets/image1.jpg'),
          Foto(fotoPath: 'assets/image3.jpg'),
          Foto(fotoPath: 'assets/image4.jpg'),
          Foto(fotoPath: 'assets/image5.jpg'),
          Foto(fotoPath: 'assets/image6.jpg'),
          Foto(fotoPath: 'assets/image7.jpg'),
          Foto(fotoPath: 'assets/image8.jpg'),
          Foto(fotoPath: 'assets/image9.jpg'),
          Foto(fotoPath: 'assets/image10.jpg'),
          Foto(fotoPath: 'assets/image12.jpg'),
          Foto(fotoPath: 'assets/image13.jpg'),
          Foto(fotoPath: 'assets/image14.jpg'),
          Foto(fotoPath: 'assets/image15.jpg'),
          Foto(fotoPath: 'assets/image16.jpg'),
          Foto(fotoPath: 'assets/image17.jpg'),
          Foto(fotoPath: 'assets/image18.jpg'),
          Foto(fotoPath: 'assets/image19.jpg'),
          Foto(fotoPath: 'assets/image20.jpg'),
        ],
      ),
    );
  }
}

class Foto extends StatefulWidget {
  final String fotoPath;

  Foto({required this.fotoPath});

  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  bool isBookmarked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                GestureDetector(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        widget.fotoPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -15.0,
                  left: -10,
                  child: Container(
                    width: 60,
                    height: 30,
                    child: IconButton(
                      iconSize: 35,
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
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
