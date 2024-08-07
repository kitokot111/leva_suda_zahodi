import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather Forecast',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body:
        _mainBody(),
      ),
    );
  }
}

Container _mainBody() {
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  return Container(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        Row(
          children: [
            Icon(Icons.search),
            SizedBox(
              width: 15,
            ),
            Text(
              'Enter City Name',
            ),
          ],
        ),
        Divider(),
        SizedBox(
          height: 20,
        ),
        Text(
          'Tomsk oblast, RU',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Text('Monday, June 22, 2024'),
        SizedBox(
          height: 60,
        ),
        _iconsBody(),
        SizedBox(
          height: 40,
        ),
        _iconsSmallBody(),
        SizedBox(
          height: 40,
        ),
        _forecast(),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) {
              return Container(
                height: 70,
                color: Colors.grey.shade400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${days[index]}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${17 + index} °C',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.sunny,
                          color: Colors.yellowAccent,
                        ),
                      ],
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(
                  right: 5,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Row _iconsBody() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.sunny_snowing,
        color: Colors.amber,
        size: 70,
      ),
      Column(
        children: [
          Text(
            '21 °C',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Text('IT\'S SUNNY AND RAINY'),
        ],
      ),
    ],
  );
}

Row _iconsSmallBody() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(
            Icons.air_rounded,
            color: Colors.blue,
          ),
          Text(
            '3',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('km/hr'),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.water_drop_rounded,
            color: Colors.blueAccent,
          ),
          Text(
            '40',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('%'),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.compress_outlined,
            color: Colors.blueGrey,
          ),
          Text(
            '740',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('mm/mec'),
        ],
      ),
    ],
  );
}

Column _forecast() {
  return Column(
    children: [
      Text(
        '7-DAY WEATHER FORECAST',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    ],
  );
}
