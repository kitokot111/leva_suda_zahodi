import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(
            'Weather',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRatings(),
              ],
            ),
            padding: EdgeInsets.all(
              16,
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
        'https://kartinkof.club/uploads/posts/2022-04/1649965770_39-kartinkof-club-p-solntse-kartinki-prikolnie-43.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Monday - June 11',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        'Today the weather is great, how is my mood, today I don\'t want to open up, but I want to jump and eat delicious food!',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Icon(
            Icons.wb_sunny_sharp,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(
        width: 16,
      ),
      Column(
        children: [
          Row(
            children: [
              Text(
                '\t 27°C  -\t Clear sky and sunny!',
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Tomsk region, Tomsk city',
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10,
    children: List.generate(7, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°C',
          style: TextStyle(fontSize: 14),
        ),
        avatar: Icon(
          Icons.wb_sunny_outlined,
          color: Colors.yellow,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.black38,
          ),
        ),
        backgroundColor: Colors.white,
      );
    }),
  );
}

Row _footerRatings() {
  return Row(
    children: [
      Text('Info from weatherforyou.ru'),
      SizedBox(
        width: 60,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
      ),
      Icon(
        Icons.star,
        color: Colors.grey,
      ),
    ],
  );
}
