import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:never_situp_assessment/bloc/Product/model/Product.model.dart';
import 'package:never_situp_assessment/config/Text.dart';
import 'package:never_situp_assessment/view/Home/Widget/ProductDescription.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productItem});
  final ProductModel productItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(15),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AspectRatio(
                      aspectRatio: 4 / 3,
                      child: CachedNetworkImage(
                        imageUrl: productItem.imageUrl,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productItem.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextTheme.title,),
                        Text(
                          productItem.desc,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextTheme.description,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Text(
                      '฿ ${productItem.price}',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                    ),
                  )),
            ],
          ),
        ),
        onTap: () {
          _showMyDialog(context);
        });
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return ProductDescription(productItem: productItem,);
      },
    );
  }
}
