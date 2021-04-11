import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Гостиница Красноярск',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  ' 660049, Россия, г. Красноярск, ул. Урицкого, 94 ',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(

        'Здание гостиницы является частью архитектурного комплекса,'
            'разработанного Заслуженным архитектором России Арегом Демирхановым.  '
            'Перед гостиницей раскинулась Театральная площадь со световыми '
            'музыкальными фонтанами,  слева расположена администрация города, знаменитая башня'
            'с часами, справа Государственный Театр Оперы и Балета, на нижнем ярусе комплекса  '
            'Вы можете прогуляться по прекрасной набережной Енисея и насладиться сибирским пейзажем. ',
        softWrap: true,
      ),
    );


    Widget textSectionTwo = Container(
      padding: const EdgeInsets.all(32),
      child: Text(

        'Большим плюсом является наличие множества ресторанов и кафе, '
            'расположенных в нашем здании, предлагающих кухню разных '
            'стран мира. Одним из преимуществ месторасположения нашего отеля является транспортная '
            'развязка, которая позволяет без пересадок добраться до любой точки города. ',
        softWrap: true,
      ),
    );

    Widget textSectionThree = Container(
      padding: const EdgeInsets.all(32),
      child: Text(

        'Дополнительные услуги: бесплатная парковка, интернет по технологии WiFi, трансфер, '
            'руглосуточное кафе, услуги бизнес-центра, аренда конференц-залов, центр красоты, '
            'прачечная, сауна, экскурсии по городу и его окрестностям, и другие сервисы. ',
        softWrap: true,
      ),
    );


    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Телефон'),
          _buildButtonColumn(color, Icons.near_me, 'Message'),
          _buildButtonColumn(color, Icons.share, 'Поделиться'),
        ],
      ),
    );

    Widget buttonSectionTwo = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.local_parking, 'Парковка'),
          _buildButtonColumn(color, Icons.fitness_center, 'Хороший фитнес-центр'),
          _buildButtonColumn(color, Icons.spa, 'Спа центр'),
        ],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Отели',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Отели'),
          backgroundColor: Color(0xFF0A0A8D),
        ),
        body: ListView(
          children: [
            Image.asset(
              'lib/images/room.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            Image.asset(
              'lib/images/building.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            textSectionTwo,
            buttonSectionTwo,
            textSectionThree,
          ],
        ),
      ),
    );

  }
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Color(0xFF0A0A8D)),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A8D),
            ),
          ),
        ),
      ],
    );
  }
}
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 12;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}