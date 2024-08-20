import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:never_situp_assessment/bloc/Product/product_bloc.dart';
import 'package:never_situp_assessment/view/Home/Widget/DepartmentCard.dart';
import 'package:never_situp_assessment/view/Home/Widget/HeaderText.dart';
import 'package:never_situp_assessment/view/Home/Widget/ProductCard.dart';
import 'package:never_situp_assessment/view/Home/Widget/ShrimmerLoading.dart';
import 'package:never_situp_assessment/view/Home/Widget/ErrorDialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetDepartment());
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: 'Kanit',
        useMaterial3: true,
      ),
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(title: 'Department Carousel'),
            const SizedBox(
              height: 5,
            ),
            BlocConsumer<ProductBloc, ProductState>(
              buildWhen: (prev, current) {
                return prev.departmentList != current.departmentList;
              },
                builder: (context, state) {
                  print("re-render");
                    return Container(
                        height: 150,
                        child: ListView.builder(
                          addRepaintBoundaries: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.departmentList?.length ?? 1,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              ShimmerLoading(isLoading: state.departmentList == null, child: DepartmentCard(
                                departmentItem: state.departmentList != null ? state.departmentList![index] : null,
                              ),)
                              ;
                          },

                        ));


            }, listener: (BuildContext context, ProductState state) {
                  print('state $state');
            },)
            ,
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return HeaderText(title: 'Product list: ${state.activeDepartment?.name ?? '-'}');
              },
            ),


            const SizedBox(
              height: 5,
            ),
            Expanded(
              child:
              BlocConsumer<ProductBloc, ProductState>(
                buildWhen: (prev, current) {
                  if (current.isGetProductError) {
                    showErrorDialog(context, title: "Error", description: current?.getProductErrorMessage ?? "Can't get product data");
                  }
                  return prev.productList != current.productList;
                },
                builder: (context, state) {
                  print('state producrtList ${state.productList}');
                  return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemCount: state.productList?.length ?? 1,
                      itemBuilder: (BuildContext context, int index) {
                        return ShimmerLoading(isLoading: state.productList == null, child: ProductCard(
                          productItem: state.productList != null ? state.productList![index] : null,
                        ),)  ;
                      });

                }, listener: (BuildContext context, ProductState state) {
                // print('state $state');
                // if (state.isGetProductError) {
                //   showErrorDialog(context, title: "Error", description: state?.getProductErrorMessage ?? "Can't get product data");
                // }
              },)
              ,
            ),
          ],
        ),
      )),
    );
  }
}
