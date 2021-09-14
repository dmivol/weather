class Weather {
  final double lon;
  final double lat;
  final double humidity;
  final String country;
  final double speed;
  // Todo Description field not double is should be String!
  final double description;
  final double all;

  Weather(this.lon, this.lat, this.humidity, this.country, this.speed, this.description,
      this.all);

  Weather.fromJson(Map<String, dynamic> json)
      : lon = double.parse('${json['coord']['lon']}'),
        lat = double.parse('${json['coord']['lat']}'),
        humidity = double.parse('${json['main']['humidity']}'),
        country = json['sys']['country'],
        speed = double.parse('${json['wind']['speed']}'),
        description = json['weather']['description'],
        all = double.parse('${json['clouds']['all']}');
}
