import 'package:flutter/material.dart';
import 'form_page.dart';
import 'form_page2.dart';
import 'page2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFD2B48C),
      ),
      home: Builder(
        builder: (context) => FormPage(
          onSubmit: (name, school, region, major) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(
                  name: name,
                  school: school,
                  region: region,
                  major: major,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  final String name;
  final String school;
  final String region;
  final String major;

  const Home({
    Key? key,
    required this.name,
    required this.school,
    required this.region,
    required this.major,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _name;
  late String _school;
  late String _region;
  late String _major;

  // Data Tambahan
  String _about = '';
  String _history = '';
  List<String> _skills = [];

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _school = widget.school;
    _region = widget.region;
    _major = widget.major;
  }

  void _updateProfile(String name, String school, String region, String major) {
    setState(() {
      _name = name;
      _school = school;
      _region = region;
      _major = major;
    });
  }

  void _updateAdditionalData(String about, String history, List<String> skills) {
    setState(() {
      _about = about;
      _history = history;
      _skills = skills;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Anda',
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 80.0,
                              backgroundImage: AssetImage('assets/images/flower.jpg'),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.edit, color: Color(0xFFD2B48C)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FormPage(
                                          onSubmit: _updateProfile,
                                        ),
                                      ),
                                    );
                                  },
                                  tooltip: 'Edit Profile',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        _name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Sekolah Dinamis
                      Text(
                        "Student at $_school",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Asal Daerah: $_region',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Jurusan: $_major',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormPage2(
                                    onSubmit: _updateAdditionalData,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit),
                            color: Color(0xFFD2B48C),
                            iconSize: 40,
                            tooltip: 'Detail Profil',
                          ),
                          SizedBox(width: 30), 
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Page2(
                                    name: _name,
                                    school: _school,
                                    about: _about,
                                    history: _history,
                                    skills: _skills,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.arrow_forward),
                            color: Color(0xFFD2B48C),
                            iconSize: 40,
                            tooltip: 'Lihat Detail Profil',
                          ),
                        ],
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
