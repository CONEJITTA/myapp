import 'package:flutter/material.dart';

class FavPonyScreen extends StatefulWidget {
  @override
  _FavPonyScreenState createState() => _FavPonyScreenState();
}

class _FavPonyScreenState extends State<FavPonyScreen> {
  final List<String> imageOptions = [
    'assets/images/fss.png',       // Cute
    'assets/images/fssEmo.png',    // Emo
    'assets/images/fssBee.png',    // Bee
    'assets/images/fssPoor.png',   // Humble
    'assets/images/fssVamp.png',   // Vampire
  ];

  final List<String> imageLabels = [
    'Cute',
    'Emo',
    'Bee',
    'Humble',
    'Vampire',
  ];

  String selectedImage = 'assets/images/fss.png';

  final Map<String, Size> imageSize = {
    'assets/images/fss.png': Size(165, 340),
    'assets/images/fssEmo.png': Size(364, 290),
    'assets/images/fssBee.png': Size(303, 330),
    'assets/images/fssPoor.png': Size(313, 258),
    'assets/images/fssVamp.png': Size(313, 310),
  };

  @override
  Widget build(BuildContext context) {
    Size currentSize =
        imageSize[selectedImage] ?? Size(200, 410); 

    return Scaffold(
      backgroundColor: Color.fromARGB(232, 235, 200, 247),
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color.fromARGB(151, 235, 200, 247),
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Image.asset(
                'assets/images/fs.png',
                width: 150,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 20), 

         
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 191, 221), 
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), 
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: DropdownButton<String>(
                value: selectedImage,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedImage = newValue!;
                  });
                },
                underline: SizedBox(), 
                items: imageOptions.asMap().entries.map<DropdownMenuItem<String>>((entry) {
                  int idx = entry.key;
                  String value = entry.value;
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      imageLabels[idx], 
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold, 
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          SizedBox(height: 20), 

          
          Center(
            child: Image.asset(
              selectedImage,
              width: currentSize.width,
              height: currentSize.height,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 50), 
        ],
      ),
    );
  }
}
