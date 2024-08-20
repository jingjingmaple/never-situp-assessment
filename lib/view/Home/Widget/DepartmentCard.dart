import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:never_situp_assessment/bloc/Product/model/Department.model.dart';
import 'package:never_situp_assessment/bloc/Product/product_bloc.dart';
import 'package:never_situp_assessment/config/Color.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard({super.key, required this.departmentItem});
  final DepartmentModel? departmentItem;

  @override
  Widget build(BuildContext context) {
    print('newloadddd');
    return InkWell(onTap: () {
      if (departmentItem != null) {
        context.read<ProductBloc>().add(SetActiveDepartment(department: departmentItem!));
        context.read<ProductBloc>().add(GetProduct(departmentId: departmentItem!.id));
      }

    }, child: Card.outlined(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // <-- Radius
        ),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
              child: Stack(
                children: [
                  Image.network('${departmentItem?.imageUrl}?${DateTime.now().millisecondsSinceEpoch.toString()}'

                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child:
                    Padding(padding: const EdgeInsets.all(5), child: Container(color: Color(0x50FFFFFF), child:
                    Padding(padding: EdgeInsets.all(5), child: Text(
                      departmentItem?.name ?? '',
                      style: const TextStyle(fontSize: 15, color: ColorTheme.blackPrimary),
                    ),)
                    ),
                    ),)
                  ,
                ],
              )),
        )),);
  }
}
