
import 'package:freezed_annotation/freezed_annotation.dart';
part 'Product.model.freezed.dart';
part 'Product.model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String name,
    required String imageUrl,
    required String desc,
    required String price,
    required String type,
    required String id,
    required String departmentId,
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}