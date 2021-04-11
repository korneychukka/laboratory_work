import 'package:flutter/material.dart';

void main() {
  runApp(FilmsApp());
}

class Film {
  String title;
  String author;
  String description;

  Film(this.title, this.author, this.description);
}

class FilmsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FilmsAppState();
}

class _FilmsAppState extends State<FilmsApp> {
  FilmRouterDelegate _routerDelegate = FilmRouterDelegate();
  FilmRouteInformationParser _routeInformationParser = FilmRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Фильмы',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

class FilmRouteInformationParser extends RouteInformationParser<FilmRoutePath> {
  @override
  Future<FilmRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.length >= 2) {
      var remaining = uri.pathSegments[1];
      return FilmRoutePath.details(int.tryParse(remaining));
    } else {
      return FilmRoutePath.home();
    }
  }

  @override
  RouteInformation restoreRouteInformation(FilmRoutePath path) {
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/film/${path.id}');
    }
    return null;
  }
}

class FilmRouterDelegate extends RouterDelegate<FilmRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<FilmRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Film _selectedFilm;

  List<Film> films = [
    Film('FORD против FERRARI, 2019', 'Джеймс Мэнголдс', ' Обладатели премии «Оскар» Мэтт Дэймон и Кристиан Бэйл в реальной истории двух мечтателей, которые объединили усилия и потрясли мир. Фильм Джеймса Мэнголда рассказывает о взаимоотношениях американского автомобильного конструктора Кэрролла Шелби и отважного британского гонщика Кена Майлза, которые вместе бросили вызов корпорациям и собственным демонам, чтобы создать абсолютно новый спорткар, который смог конкурировать с Ferrari на чемпионате мира, прошедшем во Франции в середине 1960-х.',
    ),
    Film('1+1, 2011', 'Оливье Накаш', 'Пострадав в результате несчастного случая, богатый аристократ Филипп нанимает в помощники человека, который менее всего подходит для этой работы, — молодого жителя предместья Дрисса, только что освободившегося из тюрьмы. Несмотря на то, что Филипп прикован к инвалидному креслу, Дриссу удается привнести в размеренную жизнь аристократа дух приключений.',
    ),
    Film('Пираты Карибского моря: Проклятие черной жемчужины, 2003', 'Гор Вербински', 'Карибское море, XVII век. Красавица Элизабет получает в подарок таинственный золотой медальон, который приносит ей и ее другу Уиллу Тернеру сплошные несчастья – ведь он проклят пиратами Карибского моря! Много лет полчища мертвых пиратов, обреченных на вечные муки, во главе со свирепым Капитаном Барбоссой, стерегли фантастические сокровища. Пропажа медальона из их сокровищницы вынуждает полуистлевших скелетов пойти штурмом на Порт Ройал и вернуть его вместе с заложницей – дочерью губернатора острова Элизабет. Отважный капитан Джек Спэрроу снаряжает команду, чтобы поквитаться с отвратительными разбойниками. Уилл с радостью присоединяется к команде, и они вместе отправляются на встречу приключениям, от которых стынет в жилах кровь, и мурашки бегут по телу...',
    ),
    Film('Король Лев, 1994', 'Роджер Аллерс', 'У величественного короля-льва Муфасы рождается наследник — львенок по имени Симба. Уже в детстве любознательный малыш становится жертвой интриг своего завистливого дяди Шрама, мечтающего только о власти и готового ради этого на все. В течение мультфильма показан весь трудный путь маленького Симбы, от изгнания, борьбы, до осознания того, что значит быть настоящим Королем. Закаленный испытаниями, он познает горечь утраты, предательство и в нелегкой борьбе завоюет свое законное место в "круге жизни", а главное, обретет верных, беззаботных, озорных и крайне забавных друзей: Тимона и Пумбу. Вместе они пройдут весь путь Симбы под веселую песню "Акуна Матата", которая стала своеобразным гимном хорошего настроения.',
    ),
    Film('Аватар, 2009', 'Джеймс Кэмерон', 'Джейк Салли — бывший морской пехотинец, прикованный к инвалидному креслу. Несмотря на немощное тело, Джейк в душе по-прежнему остается воином. Он получает задание совершить путешествие в несколько световых лет к базе землян на планете Пандора, где корпорации добывают редкий минерал, имеющий огромное значение для выхода Земли из энергетического кризиса. Поскольку воздух Пандоры токсичен, была создана программа «Аватар», в которой сознание людей подключается к аватару, биологическому телу с дистанционным управлением, помогающее находиться в этой губительной атмосфере. Аватары — созданные при помощи генной инженерии гибриды, полученные комбинированием человеческой ДНК и ДНК коренных жителей планеты Пандоры, На`ви.',
    ),
    Film('Душа, 2020', 'Пит Доктер', 'Вы когда-нибудь задумывались о том, как и где зарождаются ваши желания, мечты и потребности? Что именно делает вас – вами? Disney и Pixar приглашают вас прогуляться по улицам Нью-Йорка и отправиться в путешествие по космическим мирам для того, чтобы найти ответы на самые важные в жизни вопросы.',
    ),

  ];

  FilmRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  FilmRoutePath get currentConfiguration => _selectedFilm == null
      ? FilmRoutePath.home()
      : FilmRoutePath.details(films.indexOf(_selectedFilm));

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('FilmsListPage'),
          child: FilmsListScreen(
            films: films,
            onTapped: _handleFilmTapped,
          ),
        ),
        if (_selectedFilm != null) FilmDetailsPage(film: _selectedFilm)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedFilm to null
        _selectedFilm = null;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(FilmRoutePath path) async {
    if (path.isDetailsPage) {
      _selectedFilm = films[path.id];
    }
  }

  void _handleFilmTapped(Film film) {
    _selectedFilm = film;
    notifyListeners();
  }
}

class FilmDetailsPage extends Page {
  final Film film;

  FilmDetailsPage({
    this.film,
  }) : super(key: ValueKey(film));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return FilmDetailsScreen(film: film);
      },
    );
  }
}

class FilmRoutePath {
  final int id;

  FilmRoutePath.home() : id = null;

  FilmRoutePath.details(this.id);

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

class FilmsListScreen extends StatelessWidget {
  final List<Film> films;
  final ValueChanged<Film> onTapped;

  FilmsListScreen({
    @required this.films,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Популярные фильмы'),
      ),
      body: ListView(
        children: [
          for (var film in films)
            ListTile(
              title: Text(film.title),
              subtitle: Text(film.author),
              onTap: () => onTapped(film),
            )
        ],
      ),
    );
  }
}

class FilmDetailsScreen extends StatelessWidget {
  final Film film;

  FilmDetailsScreen({
    @required this.film,
  });

  @override
  Widget build(BuildContext context) {
    final _sizeTextTitle = const TextStyle(fontSize: 25.0, color: Color(0xFF155E7D), fontWeight: FontWeight.bold, fontFamily: 'Hind',);
    final _sizeTextDescription = const TextStyle(fontSize: 15.0, fontFamily: 'Hind',);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (film != null) ...[

              Text(film.title, style:  _sizeTextTitle),
              Text(film.author, style: Theme.of(context).textTheme.subtitle1),
              Container(
                margin: const EdgeInsets.only(top: 10),),
              Text(film.description, style: _sizeTextDescription,),

            ],
          ],
        ),
      ),
    );
  }
}
