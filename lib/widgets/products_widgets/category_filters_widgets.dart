import 'package:flutter/material.dart';
import 'package:online_store/widgets/products_widgets/filter_product_widget.dart';

class CategoryFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterProductWidget(
            label: 'Dresses',
            select: false,
          ),
          SizedBox(width: 8),
          FilterProductWidget(
            label: 'Pants',
            select: false,
          ),
          SizedBox(width: 8),
          FilterProductWidget(
            label: 'Skirts',
            select: false,
          ),
          SizedBox(width: 8),
          FilterProductWidget(
            label: 'Shorts',
            select: false,
          ),
          SizedBox(width: 8),
          FilterProductWidget(
            label: 'Jackets',
            select: false,
          ),
        ],
      ),
    );
  }
}
