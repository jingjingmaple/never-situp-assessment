part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.departmentList = null,
    this.productList = null,
    this.activeDepartment = null,
    this.isGetProductError = false,
    this.getProductErrorMessage = null,
  });

  final List<DepartmentModel>? departmentList;
  final List<ProductModel>? productList;
  final DepartmentModel? activeDepartment;
  final bool isGetProductError;
  final String? getProductErrorMessage;

  ProductState copyWith({
    List<DepartmentModel>? departmentList,
    List<ProductModel>? productList,
    DepartmentModel? activeDepartment,
    bool? isGetProductError,
    String? getProductErrorMessage,
  }) {
    return ProductState(
      departmentList: departmentList ?? this.departmentList,
      productList: productList ?? this.productList,
      activeDepartment: activeDepartment ?? this.activeDepartment,
      isGetProductError: isGetProductError ?? this.isGetProductError,
      getProductErrorMessage:
          getProductErrorMessage ?? this.getProductErrorMessage,
    );
  }

  @override
  List<dynamic> get props =>
      [departmentList, productList, activeDepartment, isGetProductError];
}
