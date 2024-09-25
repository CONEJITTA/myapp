import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PoniesScreen extends StatefulWidget {
  @override
  _PonyApiScreenState createState() => _PonyApiScreenState();
}

class _PonyApiScreenState extends State<PoniesScreen> {
  List ponies = [];
  bool isLoading = true;

  final List<String> customImages = [
    'assets/images/pony1.png',
    'assets/images/pony2.png',
    'assets/images/pony3.png',
    'assets/images/pony4.png',
    'assets/images/pony5.png',
    'assets/images/pony6.png',
    'assets/images/spike.png',
    'assets/images/pony7.png',
    'assets/images/pony8.png',
    'assets/images/pony9.png',
  ];

  @override
  void initState() { //inicio
    super.initState();
    fetchPonies(); //http Get
  }

  Future<void> fetchPonies() async {
    try {
      final response =
          await http.get(Uri.parse('http://ponyapi.net/v1/character/all'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          ponies = data['data'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load ponies');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: ponies.length > 10 ? 10 : ponies.length,
              itemBuilder: (context, index) {
                if (ponies.isEmpty) {
                  return Center(child: Text('No ponies found.'));
                }

                final customImage = customImages[index % customImages.length];

                return Center(
                  child: ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ponies[index]['name'],
                          style: const TextStyle(
                            color: Color.fromARGB(150, 172, 4, 144),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            customImage,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PoniesScreen(),
  ));
}
