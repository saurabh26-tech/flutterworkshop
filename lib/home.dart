import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> ui = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController title = TextEditingController();
          TextEditingController subtitle = TextEditingController();

          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          "ADD TASK",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: title,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: subtitle,
                          decoration: InputDecoration(
                            labelText: 'Subtitle',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              ui.add(Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 4,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        color: Color((Random().nextDouble() *
                                                    0xFFFFFF)
                                                .toInt())
                                            .withOpacity(1.0),
                                        width: 20,
                                        height: 100,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              title.text,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              subtitle.text,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                              Navigator.pop(context);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Add Task",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("TO DO"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: ui.length,
            itemBuilder: (con, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onLongPress: () {
                      ui.removeAt(index);
                      setState(() {
                        ui;
                      });
                    },
                    child: ui[index]),
              );
            }),
      ),
    );
  }
}
