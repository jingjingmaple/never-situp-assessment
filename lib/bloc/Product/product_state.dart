part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.departmentList = null,
    this.productList=null,
    this.activeDepartment=null,

  });

  final List<DepartmentModel>? departmentList;
  final List<ProductModel>? productList;
  final DepartmentModel? activeDepartment;



  ProductState copyWith({
    List<DepartmentModel>? departmentList,
    List<ProductModel>? productList,
    DepartmentModel? activeDepartment,

  }) {
    return ProductState(
      departmentList: departmentList ?? this.departmentList,
      productList: productList ?? this.productList,
      activeDepartment: activeDepartment ?? this.activeDepartment,
    );
  }


  @override
  List<dynamic> get props => [departmentList, productList, activeDepartment];
}