
import 'package:freezed_annotation/freezed_annotation.dart';
part 'Department.model.freezed.dart';
part 'Department.model.g.dart';

@freezed
class DepartmentModel with _$DepartmentModel {
  const factory DepartmentModel({

    required String id,
    required String imageUrl,
    required String name,
  }) = _DepartmentModel;
  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);
}