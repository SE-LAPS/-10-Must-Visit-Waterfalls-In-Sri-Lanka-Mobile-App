import 'dart:html';

import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '10 Must-Visit Waterfalls In Sri Lanka',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({key? key}) : super(key: key);

  @Override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final List<Map<String,dynamic>> _photos = [
   {
      "url":
          "https://www.ccf.gov.lk/wp-content/uploads/2022/10/27251920438_a97a711b1c_b.jpg",
      "caption": "Bambarakanda Falls",
    },
    {
      "url":
          "https://aaronswaterfallworld.tripod.com/goldrunfallsmiddle.JPG",
      "caption": "Baker Falls"
    },
    {
      "url":
          "https://sltraveler.com/wp-content/uploads/2021/12/St-Clair-Waterfall.jpg",
      "caption": "St. Clair’s Falls"
    },
    {
      "url":
          "https://api.travelql.com/images/2b6775ae-501e-4bb2-88e2-564babf31637.webp",
      "caption": "Ravana Falls"
    },
    {
      "url":
          "https://sltraveler.com/wp-content/uploads/2021/12/Dunhinda-Falls.jpg",
      "caption": "Dunhinda Falls"
    },
     {
      "url":
          "https://1.bp.blogspot.com/-MosQ58o-inA/VG6onbXcU9I/AAAAAAAABew/jI2LBL9Mspo/s1600/DSCN2669_1.JPG",
      "caption": "Gartmore Falls"
    },
     {
      "url":
          "https://tour.lk/uploads/Untitled_T8SF_VsI2E.jpg",
      "caption": "Devon Falls"
    },
     {
      "url":
          "https://upload.wikimedia.org/wikipedia/commons/3/3a/Diyaluma_Falls_%28Koslanda%2C_Sri_Lanka%29.jpg",
      "caption": "Diyaluma Falls"
    },
     {
      "url":
          "https://api.travelql.com/images/c3fad1c9-48e4-451e-81cd-d9ab3fc08520.webp",
      "caption": "Bomburu Falls"
    },
     {
      "url":
          "https://srilankatravelpages.com/media/2021/10/fb_img_16333402935014436968443833948626-800x528.jpg",
      "caption": "Kirindi Ella Falls"
    }


  ];

  Map<String, dynamic>? _selectedPhoto;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('-- 10 Must-Visit Waterfalls In Sri Lanka --')),
      body: Column(
        children: [
          Container(
            height: 616,
            color: Color.fromARGB(255, 119, 0, 95),
            alignment: Alignment.center,
            child: RotatedBox(
              quarterTurns: -45,
              child: ListWheelScrollView(
                itemExtent: MediaQuery.of(context).size.width * 0.9,
                onSelectedItemChanged: (index){
                  setState(() {
                    _selectedPhoto = _photos[index];
                  });
                },
                children: _photos
                .map((photo) => RotatedBox(
                  key:ValueKey(photo["url"]),
                  quarterTurns: 45,
                  child: Image.network(
                    photo["url"],
                    width:double.infinity,
                    height: 515,
                    fit: BoxFit.cover,
                  ),
                ))
                .toList(),
              ),
            ),
          ),

          SizedBox(
            height: 120,
            child: Center(
              child: Text(
                _selectedPhoto == null
                ? _photos[0]['caption']
                : _selectedPhoto! ['caption'],
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}