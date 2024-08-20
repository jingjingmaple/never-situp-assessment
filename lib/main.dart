import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:never_situp_assessment/bloc/Product/product_bloc.dart';
import 'package:never_situp_assessment/view/Home/Home.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductBloc>(
        create: (BuildContext context) => ProductBloc(),
      ),
    ],
    child: const HomePage(),
  ));
}
