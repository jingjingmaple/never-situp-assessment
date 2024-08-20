import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:never_situp_assessment/bloc/Product/model/Department.model.dart';
import 'package:never_situp_assessment/config/Color.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard({super.key, required this.departmentItem});
  final DepartmentModel departmentItem;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // <-- Radius
        ),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
              color: Colors.green,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: departmentItem.imageUrl,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child:
                     Padding(padding: const EdgeInsets.all(5), child: Container(color: Color(0x50FFFFFF), child:
                     Padding(padding: EdgeInsets.all(5), child: Text(
                       departmentItem.name,
                       style: const TextStyle(fontSize: 15, color: ColorTheme.blackPrimary),
                     ),)
                     ),
                     ),)
                    ,
                ],
              )),
        ));
  }
}
