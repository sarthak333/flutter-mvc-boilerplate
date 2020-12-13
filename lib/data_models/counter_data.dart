import 'nested.dart';
import 'package:json_annotation/json_annotation.dart';

// This is a data model.
// This will co-relate to the object that is received from the backend.
// Make sure to use the same names for both the object type and the properties inside as the backend.
// These models can be nested inside each other for accurate graphql object reproduction which will further help the JSON serialization.
// Run command `flutter pub run build_runner build` after creating this file. This will generate DATAMODEL.g.dart file which will handle the serialization.

// part command will generate a the file which will deal with json serialization.
part 'counter_data.g.dart';

// @JsonSerializable() denotes that a model can be converted to and from JSON.
@JsonSerializable()
class Counterdata {
  final int value;
  final Nested nested;
  Counterdata({this.value, this.nested});
  factory Counterdata.fromJson(Map<String, dynamic> json) =>
      _$CounterdataFromJson(json);

  Map<String, dynamic> toJson() => _$CounterdataToJson(this);
}
