import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:password_generator_managing_app/models/notes.dart';
import 'package:password_generator_managing_app/page/notes.dart';
import 'package:password_generator_managing_app/utils/database.dart';




class NoteCardWidget extends StatefulWidget {
  NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
    required this.noteId,
  }) : super(key: key);

  final Note note;
  final int index;
  final int noteId;

  @override
  State<NoteCardWidget> createState() => _NoteCardWidgetState();
}

class _NoteCardWidgetState extends State<NoteCardWidget> {
  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    //final color = _lightColors[widget.index % _lightColors.length];
    final time = DateFormat.yMMMd().format(widget.note.createdTime);
    final minHeight = getMinHeight(widget.index);
    double rate = widget.note.number.toDouble();
    Widget deleteButton() => IconButton(
          icon: Icon(Icons.delete),
          onPressed: () async {
            await NotesDatabase.instance.delete(widget.noteId);

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NotesPage(),
            ));
          },
        );

    return ClipRRect(
      
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX:100, sigmaY:100),
          
          child:Padding(padding: EdgeInsets.only(left: 7,right: 7,bottom: 2),
          child:
          Container(
          
        
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border:Border.all(color: Colors.black),
        color: Colors.transparent,
       ),
        padding: EdgeInsets.all(10),
        child: Column(
         
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    child:Text(
                  time,
                  style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: <Color>[
                      Colors.tealAccent.shade100,
                      Colors.red.shade200,
                    ],
                  ).createShader(Rect.fromLTWH(0.0, 0.0, 400.0, 100.0))
                // color: Color.fromARGB(255, 233, 164, 17),
                ),
                )),
                Spacer(),
                
                  
                    RatingBar.builder(
                     
                  itemCount: widget.note.number,
                  
                  initialRating: widget.note.number.toDouble(),
                  itemSize: 17,
                  
                  onRatingUpdate: (number)  {
                    
                  },
                  ignoreGestures: true,
                  itemBuilder: (BuildContext context, int index) =>
                      Icon(Icons.star,color: Color.fromARGB(255, 248, 200, 97),),
                      
                )
              ],
            ),
            SizedBox(height: 4),
            
            
            Row(
              children: [
                Expanded(child:
                Text(
              widget.note.title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: <Color>[
                      Color(0xFFfce4ec),
                      Color(0xFFf8bbd0),
                      
                    ],
                  ).createShader(Rect.fromLTWH(0.0, 0.0, 50.0, 100.0))
                // color: Color.fromARGB(255, 233, 164, 17),
                ),
            ),),
                Spacer(),
                deleteButton(),
              ],
            )
          ],
        ),
      ),
    )));
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
