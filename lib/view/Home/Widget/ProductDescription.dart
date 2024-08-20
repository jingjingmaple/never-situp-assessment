import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:never_situp_assessment/bloc/Product/model/Product.model.dart';
import 'package:never_situp_assessment/config/Text.dart';
import 'package:never_situp_assessment/view/Home/Widget/HeaderText.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.productItem});
  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      title: const Center(child: HeaderText(title: 'Product Description'),) ,
      content: SingleChildScrollView(
        child: Text(productItem.desc),
      ),
      scrollable: true,
      actions: <Widget>[
        const Divider(),
        Padding(padding: const EdgeInsets.only(bottom: 10), child: Center(child: TextButton(
          child: const Text('Close', style: CustomTextTheme.btnPrimary,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),),)

        ,
      ],
    );
  }
}
