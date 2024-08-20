import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20), maxLines: 1, overflow: TextOverflow.ellipsis,);
  }
}
