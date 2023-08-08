import '../constant.dart';

extension StringExt on String? {
  bool get isEmptyString => this == null ? true : this!.isEmpty;
  bool get isNotEmptyString => !isEmptyString;
  String get toEmptyStringNonNull => !isEmptyString ? this! : "";
  String get toStringNonNull => !isEmptyString ? this! : "Empty";
  String toStringNonNullWithCustomText({String? text}) => !isEmptyString ? this! : (!text.isEmptyString ? text! : Constant.textEmpty);
}