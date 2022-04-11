import 'package:flutter/material.dart';
import 'package:password_generator_managing_app/models/notes.dart';
import 'package:password_generator_managing_app/page/notes.dart';
import 'package:password_generator_managing_app/utils/database.dart';
import 'package:password_generator_managing_app/widgets/note_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;
  final String? value;

  const AddEditNotePage({
    Key? key,
    this.note,
    this.value,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;
  late String val;

  @override
  void initState() {
    super.initState();

    isImportant = widget.note?.isImportant ?? false;
    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? widget.value ?? '';
    //val = widget.value?? '';
  }

  @override
  Widget build(BuildContext context) {
    //var noteFormWidget = NoteFormWidget;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFF647dee), Color(0xFF7f53ac)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        actions: [buildButton()],
      ),
      body: Form(
        
        key: _formKey,
        child: NoteFormWidget(
          isImportant: isImportant,
          number: number,
          title: title,
          description: description,
          onChangedImportant: (isImportant) =>
              setState(() => this.isImportant = isImportant),
          onChangedNumber: (number) => setState(() => this.number = number),
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
              setState(() => this.description = description),
        ),
      ),
    ));
  }

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Color.fromARGB(255, 15, 2, 24),
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
          onPrimary: Colors.white,

          primary: isFormValid ? Color(0xFFF0A500) : Color(0xFFB71C1C),
        ),
        onPressed: addOrUpdateNote,
        child: const Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NotesPage()));
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
    );

    await NotesDatabase.instance.create(note);
  }
}
