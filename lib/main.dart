import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:never_situp_assessment/view/Home.dart';
void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<BlocA>(
        create: (BuildContext context) => BlocA(),
      ),

    ],
    child: HomePage(),
  ));
}


