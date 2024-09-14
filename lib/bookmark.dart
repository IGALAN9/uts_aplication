import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget { // yang jarang berubah, bersifat final 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark'),
      ),
      body: GridView.count(
        childAspectRatio: 0.78,
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 6,
        padding: EdgeInsets.all(15),
        children: <Widget>[
          foto(fotoPath: 'assets/apui1.jpg'),
          foto(fotoPath: 'assets/apui2.jpg'),
          foto(fotoPath: 'assets/apui3.jpg'),
          foto(fotoPath: 'assets/apui4.jpg'),
          foto(fotoPath: 'assets/apui5.jpg'),
          foto(fotoPath: 'assets/apui6.jpg'),
          foto(fotoPath: 'assets/apui7.jpg'),
          foto(fotoPath: 'assets/apui8.jpg'),
          foto(fotoPath: 'assets/apui9.jpg'),
        ],
      ),
    );
  }
}

class foto extends StatefulWidget{ //perlu berubah 
  final String fotoPath;

  foto({required this.fotoPath});

  @override
  _foto createState() => _foto();
}

class _foto extends State<foto>{ // ke iconnya
  bool isbookmarkd = true;

  @override
  Widget build(BuildContext context){
    return GestureDetector( //test ketukan 
      onTap: (){
        Navigator.push( // pindah ke halaman baru
          context,
          MaterialPageRoute(
            builder: (context)=> FullLayar(fotoPath: widget.fotoPath),
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
                    isbookmarkd? Icons.bookmark : Icons.bookmark_border,
                  ),
                  color: isbookmarkd ? Colors.yellow.shade600 : Colors.black,
                  onPressed: (){
                    setState(() {
                      isbookmarkd =!isbookmarkd;
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

class FullLayar extends StatelessWidget{
  final String fotoPath;

  FullLayar({required this.fotoPath});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Layar'),
      ),
      body: Center(
        child: Image.asset(
          fotoPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}