import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

class fourthpage extends StatefulWidget {
  List wish;
  int index;

  fourthpage(this.wish, this.index);

  @override
  _fourthpageState createState() => _fourthpageState();
}

class _fourthpageState extends State<fourthpage> {
  List<List<Color>> randomcolour = [
    [Colors.redAccent, Colors.pinkAccent],
    [Colors.orange, Colors.yellow],
    [Colors.red, Colors.pink],
    [Colors.orangeAccent, Colors.yellowAccent],
    [Colors.cyan, Colors.greenAccent],
    [Colors.deepPurple, Colors.purpleAccent],
    [Colors.green, Colors.lightGreen],
  ];
  dynamic clr = 0;

  List mycolor = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.white,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.lime,
    Colors.limeAccent,
    Colors.tealAccent,
    Colors.grey,
    Colors.purpleAccent,
    Colors.purple,
    Colors.deepPurpleAccent,
    Colors.deepPurple,
    Colors.blue,
    Colors.cyanAccent,
    Colors.amber,
    Colors.white70,
    Colors.lightBlue,
    Colors.deepOrange,
    Colors.lightGreen,
    Colors.yellowAccent,
    Colors.indigo,
    Colors.lightGreenAccent,
    Colors.cyan,
    Colors.teal,
    Colors.tealAccent,
    Colors.white10,
    Colors.black12,
    Colors.blueGrey,
    Colors.white38,
    Colors.deepPurple,
    Color(0xFFA352B3),
    Color(0xFFD48E67),
  ];

  List fontcolor = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.white,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.lime,
    Colors.limeAccent,
    Colors.tealAccent,
    Colors.grey,
    Colors.purpleAccent,
    Colors.purple,
    Colors.deepPurpleAccent,
    Colors.deepPurple,
    Colors.blue,
    Colors.cyanAccent,
    Colors.amber,
    Colors.white70,
    Colors.lightBlue,
    Colors.deepOrange,
    Colors.lightGreen,
    Colors.yellowAccent,
    Colors.indigo,
    Colors.lightGreenAccent,
    Colors.cyan,
    Colors.teal,
    Colors.tealAccent,
    Colors.white10,
    Colors.black12,
    Colors.blueGrey,
    Colors.white38,
    Colors.deepPurple,
    Color(0xFFA352B3),
    Color(0xFFD48E67),
  ];

  Color currentcolor = Colors.indigoAccent;
  Color currentfontcolor = Colors.black;
  double currenrtfontsize = 10;

  List emoji = [
    "😀 😃 😄 😁 😆",
    "😍 😚 💋 😺",
    "👩‍❤‍👨 👫 🙌",
    "😣 😖 😫 😩",
    "🥺 😢 😭",
    "😤 😠 😡",
    "😴 🤤 😪 ",
    "🤓 😎 ",
    "🤗 🤙",
    "👦🏻 👩🏻 🧑🏻 👨🏻 👩🏻‍🦱 ",
    "👏🏼 🙌🏼 👐🏼 🤲🏼 🙏🏼"
  ];
  String emoji1 = "";

  String fonts1 = "";
  List font = [
    "font1",
    "font2",
    "font3",
    "font4",
    "font5",
    "font6",
    "font7",
    "font8",
    "font9",
    "font10"
  ];

  GlobalKey globalKey = GlobalKey();

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary = globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  String folderpath = "";

  _createFolder() async {
    final folderName = "Shayari";
    final path1 = Directory("storage/emulated/0/DCIM/$folderName");
    if ((await path1.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path1.create();
    }
    folderpath = path1.path;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _createFolder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD4C27C),
      appBar: AppBar(
        title: Text(
          "Shayari App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              RepaintBoundary(
                key: globalKey,
                // child: Container(
                //   margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                //   padding: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //       gradient: LinearGradient(colors: randomcolour[clr])),
                child: Container(
                  // margin: EdgeInsets.fromLTRB(5, 50, 5, 50),
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: currentcolor,
                    // borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "$emoji1\n${widget.wish[widget.index]}\n$emoji1",
                    style: TextStyle(
                      fontSize: currenrtfontsize,
                      color: currentfontcolor,
                      fontFamily: fonts1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // ),
              ),
              // SizedBox(height: 200),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              // margin: EdgeInsets.all(5),
                              child: IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   randomcolour.shuffle();
                                    // });
                                  },
                                  icon: Icon(Icons.wifi_protected_setup)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // margin: EdgeInsets.all(5),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.zoom_out_map),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 150,
                                          child: GridView.builder(
                                            itemCount: mycolor.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 7),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  currentcolor = mycolor[index];
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  color: mycolor[index],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  child: Text(
                                    "Background",
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 150,
                                          child: GridView.builder(
                                            itemCount: fontcolor.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 7),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  currentfontcolor =
                                                      fontcolor[index];
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.all(5),
                                                  color: fontcolor[index],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  child: Text(
                                    "Text Color",
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: ElevatedButton(
                                  onPressed: () {
                                    _capturePng().then((value) async {
                                      print(value);

                                      DateTime date = DateTime.now();
                                      String time =
                                          "${date.year}${date.month}${date.day}";
                                      String imagename = "Image${time}.jpg";
                                      String imagepath =
                                          "$folderpath/$imagename";
                                      File ff = File(imagepath);
                                      ff.writeAsBytes(value);

                                      // await ff.create();

                                      Share.shareFiles(
                                        ['${ff.path}'],
                                      );
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  child: Text(
                                    "Share",
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 150,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: font.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  fonts1 = font[index];
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 50,
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.red),
                                                  child: Text(
                                                    "Shayari",
                                                    style: TextStyle(
                                                        fontFamily: font[index],
                                                        fontSize: 20),
                                                  ),
                                                  margin: EdgeInsets.fromLTRB(
                                                      5, 50, 5, 50),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  child: Text(
                                    "Font",
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 150,
                                          child: ListView.builder(
                                            itemCount: emoji.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  emoji1 = emoji[index];
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              width: 1))),
                                                  alignment: Alignment.center,
                                                  child:
                                                      Text("${emoji[index]}"),
                                                  margin: EdgeInsets.all(5),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  child: Text(
                                    "Emoji",
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (context, setState1) {
                                            return Container(
                                              height: 150,
                                              child: Slider(
                                                min: 5,
                                                max: 50,
                                                label: currenrtfontsize
                                                    .round()
                                                    .toString(),
                                                autofocus: true,
                                                activeColor: Colors.blueAccent,
                                                inactiveColor:
                                                    Colors.blueAccent,
                                                divisions: 45,
                                                value: currenrtfontsize,
                                                onChanged: (value) {
                                                  setState(() {
                                                    setState1(() {
                                                      currenrtfontsize = value;
                                                    });
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                  child: Text(
                                    "Text Size",
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
