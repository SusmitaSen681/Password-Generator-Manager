import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:password_generator_managing_app/models/notes.dart';
import 'package:password_generator_managing_app/page/edit_note.dart';

import 'package:password_generator_managing_app/page/homePage.dart';
import 'package:password_generator_managing_app/page/notes.dart';
import 'package:password_generator_managing_app/utils/database.dart';

class UserChoice extends StatefulWidget {
  final String title;
  UserChoice(this.title);

  @override
  _UserChoiceState createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  TextEditingController uppercase = TextEditingController();
  TextEditingController lowercase = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController symbol = TextEditingController();
  TextEditingController length = TextEditingController();
  final controller = TextEditingController();
  bool flag = true;
  String _pass = "";

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
    return MaterialApp(
        home: Scaffold(
            
            backgroundColor: Color(0xFFEEEEF6),
            //Color(0xFFFF6D91),
            
                
            body: 
            Stack(
              children:<Widget>[
               
             
             
              Container(
              child:ClipPath(
       clipper: MyClipper(),
       child:
     Container(
                          
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin:Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFF3383CD),
                                      Color(0xFF11249F),
                                    ] ),
                                   image: DecorationImage(image: AssetImage('assests/images/new.png')) 
                                ),
                                child: AppBar(backgroundColor: Colors.transparent),
                              ),
      
     
     
     )  ),
            

                Padding(padding: EdgeInsets.only(right:15,left:15),
                child: 
               
                     ListView(children: [
                      
                      Column(
                        children: [
                          
                          const SizedBox(
                            height:200,
                          ),
                          Row(children: [
                            Expanded(
                                child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: FloatingActionButton.extended(
                                      icon: Icon(Icons.home_outlined),
                                      splashColor: Color(0xFF6A3F86),
                                      backgroundColor:
                                          Color.fromARGB(255, 241, 241, 245),
                                      foregroundColor: Color(0xFFF0A500),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Color(0xFF6A3F86),
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      label: Text("Home",
                                      style: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,fontSize: 16),),
                                      onPressed: () => setState(() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return Home(
                                                );
                                          }),
                                        );
                                      }),
                                      heroTag: "Home",
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
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      label: Text("Password Manager",style: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,fontSize: 13),),
                                      onPressed: () => setState(() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return NotesPage();
                                          }),
                                        );
                                      }),
                                      heroTag: "Password Manager",
                                    ))),
                          ]),
                          const SizedBox(
                            height: 40,
                          ),
                    
                    Row(
                      children: [
                        Expanded(child: 
                        TextFormField(
                      controller: uppercase,
                      decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF6A3F86),
                                ),
                                borderRadius: BorderRadius.circular(12), 
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF6A3F86),
                                ),
                                borderRadius: BorderRadius.circular(12), 
                              ),
                              labelStyle: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,fontSize: 15,
                                color: Color(0xFFF0A500),
                              ),
                          labelText: "Uppercase",
                          hintText: "Enter Uppercase letter"),
                    ),
                        ),
                        Container(width: 5.0),
                      Expanded(
                        flex: 1,
                       child:  TextFormField(
                      controller: lowercase,
                      decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF6A3F86),
                                ),
                                borderRadius: BorderRadius.circular(12), 
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF6A3F86),
                                ),
                                borderRadius: BorderRadius.circular(12), 
                              ),
                              labelStyle: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,fontSize: 15,
                                color: Color(0xFFF0A500),
                              ),
                          labelText: "Lowercase",
                          hintText: "Enter Lowercase letter"),
                    ),
                      )
                      ],
                    ),
                    
                    const SizedBox(
                      height: 15,
                    ),
                   
                    const SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: number,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF6A3F86),
                                ),
                                borderRadius: BorderRadius.circular(12), 
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF6A3F86),
                                ),
                                borderRadius: BorderRadius.circular(12), 
                              ),
                              labelStyle: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,fontSize: 15,
                                color: Color(0xFFF0A500),
                              ),
                              labelText: "Number",
                              hintText: "Enter Number"),
                        ),
                      ),
                      Container(width: 5.0),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: symbol,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF6A3F86),
                                ),
                                borderRadius: BorderRadius.circular(12), 
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF6A3F86),
                                ),
                                borderRadius: BorderRadius.circular(12), 
                              ),
                              labelStyle: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,fontSize: 15,
                                color: Color(0xFFF0A500),
                              ),
                              labelText: "Symbol",
                              hintText: "Enter Special Symbol"),
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text("Length",style: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,fontSize: 18),)),
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
                                  borderRadius: BorderRadius.circular(25.0),
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
                                foreground: Paint()..shader=
                                LinearGradient(colors: <Color>[
                                  Colors.pinkAccent,
                                  Colors.deepPurpleAccent,
                                  
                                  Colors.red
                                ],).createShader(Rect.fromLTWH(
                                  0.0, 0.0, 400.0, 100.0))
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
                                icon:
                                    Icon(Icons.copy, color: Color(0xFFF0A500)),
                                onPressed: () {
                                  final data =
                                      ClipboardData(text: controller.text);
                                  Clipboard.setData(data);
                                  _pass = data.toString();
                                  Fluttertoast.showToast(
                                      msg: "Copied",
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                }))),
                    const SizedBox(
                      height: 20,
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
                                      borderRadius: BorderRadius.circular(28))),
                              child: Text("Save",style: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,fontSize: 18),),
                              onPressed: () async {
                                if (isLoading) return;
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => AddEditNotePage(
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
                              primary:
                                  flag ? Color(0xFFB71C1C) : Color(0xFF6A3F86),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28))),
                          child: Text("Reset",style: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,fontSize: 18),),
                          onPressed: () {
                            setState(() {
                              flag = !flag;
                              reset();
                            });
                          }),
                    )
                  ],
                ),
              ])),
               ] )));
  }

  String generatePassword({
    required bool islowercase,
    required bool isupercase,
    required bool isnumber,
    required bool isspecial,
  }) {
    String chars = '';
    final lengths = int.parse(length.text);
    final letterlower = uppercase.text;
    final letterupper = lowercase.text;
    final numbers = int.parse(number.text);
    final special = symbol.text;

    chars += (islowercase ? '$letterlower' : '');

    chars += (isupercase ? '$letterupper' : '');

    chars += (isnumber ? '$numbers' : '');

    chars += (isspecial ? '$special' : '');

    return List.generate(lengths, (index) {
      final int indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
  }

  void reset() {
    uppercase.text = '';
    lowercase.text = '';
    symbol.text = '';
    number.text = '';
    length.text = '';
    controller.text = '';
  }
   Widget buildButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(

          primary: Color(0xFFF0A500),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
      child: Text("Generate ",style: TextStyle(fontFamily: "Roboto",
                                      fontWeight: FontWeight.w900,fontSize: 18),),
      onPressed: () {
        
        final password = generatePassword(
          islowercase: true,
            isupercase: true,
            isnumber: true,
            isspecial: true
        );
        controller.text = password;
      },
    );
  }



 
}
