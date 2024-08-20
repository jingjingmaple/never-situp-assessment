import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:never_situp_assessment/bloc/Product/model/Department.model.dart';
import 'package:never_situp_assessment/bloc/Product/model/Product.model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
      if (event is GetDepartment) {
        print("getDepartment");
      }
    });
  }
}
