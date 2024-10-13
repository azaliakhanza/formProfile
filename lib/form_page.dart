import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final Function(String, String, String, String) onSubmit;

  const FormPage({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _nameController = TextEditingController();
  final _schoolController = TextEditingController();
  final _regionController = TextEditingController();
  final _majorController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _schoolController.dispose();
    _regionController.dispose();
    _majorController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String name = _nameController.text.trim();
    String school = _schoolController.text.trim();
    String region = _regionController.text.trim();
    String major = _majorController.text.trim();

    if (name.isEmpty || school.isEmpty || region.isEmpty || major.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Semua field harus diisi')),
      );
      return;
    }

    widget.onSubmit(name, school, region, major);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Isi Profil Anda',
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
                        'Lengkapi Profil',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Nama',
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
                      SizedBox(height: 20),
                      TextField(
                        controller: _schoolController,
                        decoration: InputDecoration(
                          labelText: 'Sekolah',
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
                      SizedBox(height: 20),
                      TextField(
                        controller: _regionController,
                        decoration: InputDecoration(
                          labelText: 'Asal Daerah',
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
                      SizedBox(height: 20),
                      TextField(
                        controller: _majorController,
                        decoration: InputDecoration(
                          labelText: 'Jurusan',
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
