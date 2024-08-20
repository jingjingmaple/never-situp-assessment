import 'package:flutter/material.dart';
import 'package:never_situp_assessment/bloc/Product/model/Department.model.dart';
import 'package:never_situp_assessment/bloc/Product/model/Product.model.dart';
import 'package:never_situp_assessment/view/Home/Widget/DepartmentCard.dart';
import 'package:never_situp_assessment/view/Home/Widget/HeaderText.dart';
import 'package:never_situp_assessment/view/Home/Widget/ProductCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: 'Kanit',
        useMaterial3: true,
      ),
      home: const LandingPage(),
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
    ProductModel productMockItem = const ProductModel(
        name: 'Healthy Cat',
        imageUrl: 'https://loremflickr.com/640/480',
        desc:
            "Boston's most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
        price: '619',
        type: 'normal',
        id: "1",
        departmentId: "1");
    DepartmentModel departmentMockItem = const DepartmentModel(
        id: "1", imageUrl: "https://loremflickr.com/640/480", name: "Movies");
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
            Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DepartmentCard(
                      departmentItem: departmentMockItem,
                    ),
                    DepartmentCard(
                      departmentItem: departmentMockItem,
                    ),
                    DepartmentCard(
                      departmentItem: departmentMockItem,
                    )
                  ],
                )),
            const SizedBox(
              height: 5,
            ),
            const HeaderText(title: 'Product list: Movies'),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: 300,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      productItem: productMockItem,
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
