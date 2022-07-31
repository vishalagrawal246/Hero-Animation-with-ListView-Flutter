import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listviewapp/openImage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List images = [
    "https://i.pinimg.com/originals/e4/c9/9c/e4c99c15c45bf3419bf9a45dbac25eaf.jpg",
    "https://wallpapercave.com/wp/wp4995205.jpg",
    "https://images.wallpaperscraft.com/image/single/autumn_forest_park_128379_1920x1080.jpg",
    "https://images.wallpaperscraft.com/image/single/lake_forest_snow_130421_1920x1080.jpg",
    "https://images.assettype.com/fortuneindia%2F2020-06%2Fef53f9be-f257-4aa3-9af5-6ca1a9f33a86%2Fclose_up_photography_of_leaves_with_droplets_807598.jpg?rect=0,607,4128,2322&w=1250&q=60",
  ];
  List names = [
    "Eminem",
    "Chester B",
    "Akshay Kumar",
    "C Ronaldo",
    "Bruce Lee",
  ];

  List locations = [
    "St. Joseph, Missouri, U.S.",
    "Phoenix, Arizona, U.S.",
    "Amritsar, Punjab, India",
    "Funchal, Madeira, Portugal",
    "San Francisco, California, U.S.",
  ];
  List profilePics = [
    "https://www.onthisday.com/images/people/eminem-medium.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Linkin_Park-Rock_im_Park_2014-_by_2eight_3SC0327.jpg/220px-Linkin_Park-Rock_im_Park_2014-_by_2eight_3SC0327.jpg",
    "https://yt3.ggpht.com/ytc/AKedOLRcs11G4-mWpUGxZjtfAvzaw09Dl4iow-oprDse=s900-c-k-c0x00ffffff-no-rj",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Cristiano_Ronaldo_2018.jpg/220px-Cristiano_Ronaldo_2018.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Bruce_Lee_1973.jpg/220px-Bruce_Lee_1973.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(47.0),
        child: AppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.black),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text(
            'favourites',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Hero(
                tag: 'bgimage $index',
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              InkWell(
                onTap: () {                  
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      reverseTransitionDuration: Duration(milliseconds: 1200),
                      //fullscreenDialog: true,
                      transitionDuration: Duration(milliseconds: 1200),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return OpenImagePage(
                          title: '',
                          heroTag: index,
                          img: images[index],
                          name: names[index],
                          place: locations[index],
                          pp: profilePics[index],
                        );
                      },
                      // transitionsBuilder: (BuildContext context,
                      //     Animation<double> animation,
                      //     Animation<double> secondaryAnimation,
                      //     Widget child) {
                      //   return FadeTransition(
                      //     opacity:
                      //         animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                      //     child: child,
                      //   );
                      // },
                    ),
                  );

                  Future.delayed(const Duration(milliseconds: 1200), () async {
                    await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.linear_scale),
                                  //icon: Image.asset('assets/delete.png'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      Navigator.pop(ctx);
                                    });
                                  }),
                              ListTile(
                                leading: new Icon(Icons.photo),
                                title: new Text('Photo'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.music_note),
                                title: new Text('Music'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.videocam),
                                title: new Text('Video'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.share),
                                title: new Text('Share'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'dp $index',
                        child: Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(profilePics[index]),
                            ),
                            // color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Hero(
                          tag: 'name $index',
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(names[index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Hero(
                tag: 'location $index',
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text('',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          );
        },
        itemCount: images.length,
      ),
    );
  }
}
