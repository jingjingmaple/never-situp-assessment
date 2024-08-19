part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  ProductState({ this.currentDepartment, this.productResults, this.departmentResults});
  final dynamic departmentResults;
  final dynamic productResults;
  final dynamic currentDepartment;
}

class ProductInitial extends ProductState {}

class UpdatedState extends ProductState {
  final dynamic departmentResults;
  final dynamic productResults;
  final dynamic currentDepartment;

  UpdatedState({ this.departmentResults, this.productResults, this.currentDepartment });
}
