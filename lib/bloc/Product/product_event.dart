part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetDepartment extends ProductEvent {
  const GetDepartment();
}

class GetProduct extends ProductEvent {
  const GetProduct(
      {required this.departmentId,
      });

  final String departmentId;

  @override
  List<Object> get props =>
      [departmentId];
}

class SetActiveDepartment extends ProductEvent {
  const SetActiveDepartment(
      {required this.department,
      });

  final DepartmentModel department;

  @override
  List<Object> get props =>
      [department];
}