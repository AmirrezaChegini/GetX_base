class MyConstants {
  static const MyConstants _i = MyConstants._internal();

  const MyConstants._internal();

  factory MyConstants() => _i;

  static const String token = 'TOKEN';
}
