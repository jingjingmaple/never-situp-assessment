import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:never_situp_assessment/bloc/Product/model/Department.model.dart';
import 'package:never_situp_assessment/bloc/Product/model/Product.model.dart';
import 'package:never_situp_assessment/service/MainAPI.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<GetDepartment>((event, emit) async {
      List<DepartmentModel> result = await getDepartments();
      if (result.isNotEmpty) {
        add(GetProduct(departmentId: result.first.id));
        add(SetActiveDepartment(department: result.first));
      }
      emit(state.copyWith(departmentList: result));
    });
    on<GetProduct>((event, emit) async {
      emit(state.copyWith(productList: []));
      await getProduct(event.departmentId).then((result) {
        emit(state.copyWith(
            productList: result,
            isGetProductError: false,
            getProductErrorMessage: null));
      }).catchError((error) {
        emit(state.copyWith(isGetProductError: true));
      });
    });
    on<SetActiveDepartment>((event, emit) async {
      emit(state.copyWith(activeDepartment: event.department));
    });
  }
}
