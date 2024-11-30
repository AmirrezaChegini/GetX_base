class MyTextStyle {
  static const MyTextStyle _i = MyTextStyle._internal();

  const MyTextStyle._internal();

  factory MyTextStyle() => _i;
}
