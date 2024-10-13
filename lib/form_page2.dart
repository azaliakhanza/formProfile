import 'package:flutter/material.dart';

class FormPage2 extends StatefulWidget {
  final Function(String, String, List<String>) onSubmit;

  const FormPage2({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _FormPage2State createState() => _FormPage2State();
}

class _FormPage2State extends State<FormPage2> {
  final _aboutController = TextEditingController();
  final _historyController = TextEditingController();
  final _skillsController = TextEditingController();

  @override
  void dispose() {
    _aboutController.dispose();
    _historyController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String about = _aboutController.text.trim();
    String history = _historyController.text.trim();
    String skillsInput = _skillsController.text.trim();

    if (about.isEmpty || history.isEmpty || skillsInput.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Semua field harus diisi')),
      );
      return;
    }

    List<String> skills = skillsInput.split(',').map((skill) => skill.trim()).toList();

    widget.onSubmit(about, history, skills);
    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Isi Detail profil',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.white.withOpacity(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Lengkapi Data Tambahan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _aboutController,
                        decoration: InputDecoration(
                          labelText: 'About',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _historyController,
                        decoration: InputDecoration(
                          labelText: 'History',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _skillsController,
                        decoration: InputDecoration(
                          labelText: 'Skills (pisahkan dengan koma)',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD2B48C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        ),
                        onPressed: _submitForm,
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
