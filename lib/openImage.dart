import 'package:flutter/material.dart';

class OpenImagePage extends StatefulWidget {
  OpenImagePage({
    Key? key,
    required this.title,
    required this.heroTag,
    required this.img,
    required this.name,
    required this.place,
    required this.pp,
  }) : super(key: key);
  final String title;
  final String img;
  final int heroTag;
  final String name;
  final String place;
  final String pp;

  @override
  _OpenImagePageState createState() => _OpenImagePageState();
}

class _OpenImagePageState extends State<OpenImagePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'bgimage ${widget.heroTag}',
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage('${widget.img}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: 'dp ${widget.heroTag}',
                    child: Container(
                      height: 150,
                      width: 150,
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.pp),
                        ),
                        // color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Hero(
                      tag: 'name ${widget.heroTag}',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(widget.name,
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'location ${widget.heroTag}',
                    child: Material(
                      type: MaterialType.transparency,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(widget.place,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
