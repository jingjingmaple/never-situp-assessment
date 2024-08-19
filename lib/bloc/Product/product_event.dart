part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetDepartment extends ProductEvent {
}

class GetProduct extends ProductEvent {
  const GetProduct(
      {required this.departmentId,
      });

  final int departmentId;

  @override
  List<Object> get props =>
      [departmentId];
}