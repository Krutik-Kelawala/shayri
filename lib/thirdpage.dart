import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri/fourthpage.dart';

class thirdpage extends StatefulWidget {
  List wish;
  int index;

  thirdpage(this.wish, this.index);

  @override
  _thirdpageState createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  PageController pp = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pp = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shayari App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF71D2C8)),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              itemCount: widget.wish.length,
              onPageChanged: (value) {
                // print(value);
                setState(() {
                  widget.index = value;
                });
              },
              controller: pp,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(5, 50, 5, 50),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange])),
                      child: Text(
                        widget.wish[widget.index],
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      )),
                );
              },
            )),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                        iconSize: 40,
                        onPressed: () {
                          setState(() {
                            if (widget.index <= (widget.wish.length + 1)) {
                              if (widget.index != 0) {
                                widget.index--;
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Start",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP_RIGHT,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.white30,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            }
                          });
                        },
                        icon: Icon(
                          Icons.navigate_before,
                          // size: 40,
                        )),
                    // decoration: BoxDecoration(border: Border.all(width: 1)),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                        iconSize: 40,
                        onPressed: () {
                          FlutterClipboard.copy('${widget.wish[widget.index]}')
                              .then((value) => Fluttertoast.showToast(
                                  msg: "Copied",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.white10,
                                  textColor: Colors.white,
                                  fontSize: 16.0));
                        },
                        icon: Icon(
                          Icons.copy,
                          // size: 40,
                        )),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return fourthpage(widget.wish, widget.index);
                            },
                          ));
                        },
                        icon: Icon(
                          Icons.edit,
                          // size: 40,
                        )),
                    // decoration: BoxDecoration(border: Border.all(width: 1)),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                        iconSize: 40,
                        onPressed: () {
                          Share.share('${widget.wish[widget.index]}');
                          Fluttertoast.showToast(
                              msg: "Share",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white10,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        icon: Icon(
                          Icons.share,
                          // size: 40,
                        )),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        iconSize: 40,
                        onPressed: () {
                          setState(() {
                            if (widget.index < (widget.wish.length - 1)) {
                              widget.index++;
                            } else {
                              Fluttertoast.showToast(
                                  msg: "End",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP_RIGHT,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.white30,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          });
                        },
                        icon: Icon(
                          Icons.navigate_next,
                          // size: 40,
                        )),
                    // decoration: BoxDecoration(border: Border.all(width: 1)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
