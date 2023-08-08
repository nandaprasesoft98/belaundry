import 'package:flutter/material.dart';

class _ConstantImpl {
  String get baseImagesAssetsPath => "assets/images/";
  String _getImagesAssets(String imageAssetsPath) => "$baseImagesAssetsPath$imageAssetsPath";
  String get imageCategoryIcon => _getImagesAssets("category_icon.png");
  String get imageProductPlaceholder => _getImagesAssets("placeholder.png");

  String get baseVectorsAssetsPath => "assets/vectors/";
  String _getVectorsAssets(String vectorAssetsPath) => "$baseVectorsAssetsPath$vectorAssetsPath";
  String get vectorNote => _getVectorsAssets("note.svg");
  String get vectorLoginScenery => _getVectorsAssets("login_scenery.svg");

  Color get colorLightBlue1 => const Color.fromRGBO(231, 245, 253, 1);
  Color get colorLightBlue2 => const Color.fromRGBO(202, 236, 255, 1);
  Color get colorBlue1 => const Color.fromRGBO(45, 156, 219, 1);
  Color get colorBlue2 => const Color.fromRGBO(0, 153, 238, 1);
  Color get colorBlue3 => const Color.fromRGBO(31, 170, 248, 1);
  Color get colorBlue4 => const Color.fromRGBO(59, 151, 203, 1);
  Color get colorGreen => const Color.fromRGBO(86, 228, 160, 1);
  Color get colorRed => const Color.fromRGBO(243, 104, 104, 1);
  Color get colorGrey => const Color.fromRGBO(217, 217, 217, 1);
  Color get colorGrey2 => const Color.fromRGBO(246, 247, 250, 1);
  Color get colorGrey3 => const Color.fromRGBO(115, 115, 115, 1);
  Color get colorGrey4 => const Color.fromRGBO(121, 121, 121, 1);

  Color get colorBaseShimmer => const Color.fromRGBO(201, 201, 201, 1);
  Color get colorHighlightShimmer => const Color.fromRGBO(142, 142, 142, 1);

  String get settingHiveTable => 'setting_hive_table';
  String get settingHiveTableKey => 'setting_hive_table_key';
  String get textEmpty => "Empty";
  String get textLoading => "Loading";
}

// ignore: non_constant_identifier_names
final Constant = _ConstantImpl();