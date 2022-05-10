import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Parallax',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController scrollController;
  var tabPosition = 0;
  double offset = 0.0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        offset = scrollController.offset;
        print(offset);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Parallax Demo'),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height *
                            (offset / MediaQuery.of(context).size.height)) +
                        300,
                    constraints: BoxConstraints(minHeight: 60),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0 -
                              (MediaQuery.of(context).size.height *
                                  (offset /
                                      MediaQuery.of(context).size.height)),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              "https://docs.flutter.dev/cookbook/img-files/effects/parallax/01-mount-rushmore.jpg",
                              height: MediaQuery.of(context).size.height + 300,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Title Guys',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    height: MediaQuery.of(context).size.height + 300,
                    // width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text('End of Line'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
