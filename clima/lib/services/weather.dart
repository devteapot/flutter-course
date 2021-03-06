import 'location.dart';
import 'networking.dart';

const apiKey = 'lmao';

class WeatherModel {
  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }

  static Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    final nh = NetworkHelper(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'lat': location.latitude.toString(),
          'lon': location.longitude.toString(),
          'appid': apiKey,
          'units': 'metric',
        },
      ),
    );

    final weatherData = await nh.getData();
    return weatherData;
  }

  static Future<dynamic> getCityWeather(String cityName) async {
    final nh = NetworkHelper(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': cityName,
          'appid': apiKey,
          'units': 'metric',
        },
      ),
    );

    final weatherData = await nh.getData();
    return weatherData;
  }
}
