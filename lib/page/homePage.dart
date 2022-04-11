import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_generator_managing_app/models/notes.dart';
import 'package:password_generator_managing_app/page/edit_note.dart';
import 'package:password_generator_managing_app/page/notes.dart';
import 'package:password_generator_managing_app/page/user.dart';
import 'package:password_generator_managing_app/utils/database.dart';

class Home extends StatefulWidget {
  // ignore: use_key_in_widget_constructors

  @override
  // ignore: no_logic_in_create_state
  _MyAppState createState() => _MyAppState(" ");
}

class _MyAppState extends State<Home> {
  Future<bool?> showWarning(BuildContext context) async {
    context:
    context;
    builder:
    (context) => AlertDialog(
          title: Text('Do you want to go the previous screen?'),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('Yes')),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('No'))
          ],
        );
  }

  /*String? title;
  String? password;*/
  final String titles;
  _MyAppState(this.titles);

  void changeselected(int index) {
    setState(() {});
  }

  bool isChecked = false;
  bool iChecked = false;
  bool issChecked = false;
  bool isssChecked = false;
  TextEditingController length = TextEditingController();
  final controller = TextEditingController();
  String passes = "";
  var lim = "";
  String _pass = "";
  bool flag = true;
  TextEditingController control = TextEditingController();

  @override
  void dispose() {
    controller.dispose();

    //NotesDatabase.instance.close();

    super.dispose();
  }

  bool isLoading = false;
  late List<Note> notes;
  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final pop = await showWarning(context);
          return pop ?? true;
        },
        child: MaterialApp(
            home: Scaffold(
                backgroundColor: Color(0xFFEEEEF6),
                //Color(0xFFFF6D91),

                body: Stack(children: <Widget>[
                  Container(
                      child: ClipPath(
                          clipper: MyClipper(),
                          child: Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFF3383CD),
                                      Color(0xFF11249F),
                                    ]),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assests/images/new.png'))),
                            child: AppBar(backgroundColor: Colors.transparent),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: ListView(children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 230,
                            ),
                            Row(children: [
                              Expanded(
                                  child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: FloatingActionButton.extended(
                                        icon:
                                            Icon(Icons.supervised_user_circle),
                                        splashColor: Color(0xFF6A3F86),
                                        backgroundColor:
                                            Color.fromARGB(255, 241, 241, 245),
                                        foregroundColor: Color(0xFFF0A500),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Color(0xFF6A3F86),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        label: Text(
                                          "User's Choice",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w900,
                                              fontSize: 13),
                                        ),
                                        onPressed: () => setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return UserChoice(
                                                  "User Choice Password");
                                            }),
                                          );
                                        }),
                                        heroTag: "User's Choice",
                                      ))),
                              SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                  child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: FloatingActionButton.extended(
                                        icon: Icon(Icons.password_rounded),
                                        splashColor: Color(0xFF6A3F86),
                                        backgroundColor:
                                            Color.fromARGB(255, 241, 241, 245),
                                        foregroundColor: Color(0xFFF0A500),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Color(0xFF6A3F86),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        label: Text(
                                          "Password Manager",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w900,
                                              fontSize: 13),
                                        ),
                                        onPressed: () => setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return NotesPage();
                                            }),
                                          );
                                        }),
                                        heroTag: "Password Manager",
                                      ))),
                            ]),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text(
                                  "Uppercase",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  // style:TextStyle(fontFamily: "Roboto",
                                  //fontWeight: FontWeight.w700 ,fontSize: 8))),
                                )),
                                Checkbox(
                                    activeColor: Color(0xFF6A3F86),
                                    autofocus: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    side: BorderSide(
                                      width: 2.0,
                                      color: Color(0xFF6A3F86),
                                    ),
                                    value: this.isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.isChecked = value!;
                                      });
                                    }),
                                SizedBox(
                                  width: 90,
                                ),
                                Expanded(
                                    child: Text(
                                  "Lowercase",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                                Checkbox(
                                    activeColor: Color(0xFF6A3F86),
                                    autofocus: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    side: BorderSide(
                                      width: 2.0,
                                      color: Color(0xFF6A3F86),
                                    ),
                                    value: this.iChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.iChecked = value!;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  "Numbers",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Checkbox(
                                    activeColor: Color(0xFF6A3F86),
                                    autofocus: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    side: BorderSide(
                                      width: 2.0,
                                      color: Color(0xFF6A3F86),
                                    ),
                                    value: this.issChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.issChecked = value!;
                                      });
                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Symbols",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Checkbox(
                                    activeColor: Color(0xFF6A3F86),
                                    autofocus: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    side: BorderSide(
                                      width: 2.0,
                                      color: Color(0xFF6A3F86),
                                    ),
                                    value: this.isssChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.isssChecked = value!;
                                      });
                                    }),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Length",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18),
                                    )),
                                const SizedBox(
                                  height: 90,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      style: TextStyle(
                                        color: Color(0xFFF0A500),
                                      ),
                                      cursorColor: Color(0xFFF0A500),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            width: 2.0,
                                            color: Color(0xFF6A3F86),
                                          ),
                                        ),
                                      ),
                                      controller: length,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Random Password Generator",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: <Color>[
                                        Colors.pinkAccent,
                                        Colors.deepPurpleAccent,
                                        Colors.red
                                      ],
                                    ).createShader(
                                        Rect.fromLTWH(0.0, 0.0, 400.0, 100.0))
                                  // color: Color.fromARGB(255, 233, 164, 17),
                                  ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                                controller: controller,
                                readOnly: true,
                                enableInteractiveSelection: false,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color(0xFF6A3F86),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: const BorderSide(
                                        width: 2.0,
                                        color: Color(0xFF6A3F86),
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                        icon: Icon(Icons.copy,
                                            color: Color(0xFFF0A500)),
                                        onPressed: () {
                                          final data = ClipboardData(
                                              text: controller.text);
                                          Clipboard.setData(data);
                                          _pass = data.toString();
                                          Fluttertoast.showToast(
                                              msg: "Copied",
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white);
                                        }))),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Expanded(child: buildButton()),
                                Container(width: 50),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFF0A500),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(28))),
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18),
                                      ),
                                      onPressed: () async {
                                        if (isLoading) return;
                                        await Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddEditNotePage(
                                                      value: controller.text)),
                                        );
                                        refreshNotes();
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 50,
                              width: 100,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: flag
                                          ? Color(0xFFB71C1C)
                                          : Color(0xFF6A3F86),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28))),
                                  child: Text(
                                    "Reset",
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      flag = !flag;
                                      reset();
                                    });
                                  }),
                            )
                          ],
                        ),
                      ]))
                ]))));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 150,
      flexibleSpace: ClipPath(
        clipper: MyClipper(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ])),
        ),
      ),
      elevation: 0.0,
    );
  }

  String generatePassword({
    bool hasLetters = true,
    bool hasnumbers = true,
    bool hasSpecial = true,
  }) {
    String chars = '';
    final lengths = int.parse(length.text);
    final letterlower = 'abcdefghijklmnopqrstuvwxyz';
    final letterupper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers = '0123456789';
    final special = '@#\$%&*!+=-?/^[]{}<>,.()';

    if (iChecked == true) {
      chars += '$letterlower';
    }
    ;
    if (isChecked == true) {
      chars += '$letterupper';
    }
    ;
    if (issChecked == true) {
      chars += '$numbers';
    }
    ;
    if (isssChecked == true) {
      chars += ' $special';
    }
    ;
    return List.generate(lengths, (index) {
      final int indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
  }
  /* String s = List.generate(lengths, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);
      return  chars[indexRandom];
    }).toSet().join('').replaceAll(' ', '');

    return s.replaceFirst(s[0], s[0].toUpperCase());*/

  void reset() {
    length.text = '';
    controller.text = '';
    isChecked = false;
    iChecked = false;
    issChecked = false;
    isssChecked = false;
  }

  Widget buildButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Color(0xFFF0A500),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
      child: Text(
        "Generate ",
        style: TextStyle(
            fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 18),
      ),
      onPressed: () {
        final password = generatePassword();
        controller.text = password;
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
